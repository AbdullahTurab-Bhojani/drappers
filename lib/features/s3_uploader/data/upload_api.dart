import 'dart:io';
import 'package:dio/dio.dart';

class UploadApi {
  final Dio dio;

  UploadApi({Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
              sendTimeout: const Duration(seconds: 30),
            ),
          );

  /// Get presigned S3 URL
  Future<Map<String, dynamic>> getPresignedUrl(String fileName) async {
    final response = await dio.get(
      'https://drapper.neksoft.com/webapi-drapper/s3-upload',
      queryParameters: {'fileName': fileName},
    );

    if (response.statusCode != 200 || response.data == null) {
      throw Exception('Failed to get presigned URL');
    }

    return response.data;
  }

  /// Upload file to S3 using presigned URL
  Future<void> uploadToS3({
    required File file,
    required String uploadUrl,
    required String contentType,
  }) async {
    final encodedUrl = Uri.encodeFull(uploadUrl);
    final length = await file.length();

    final response = await dio.put(
      encodedUrl,
      data: file.openRead(),
      options: Options(
        headers: {'Content-Type': contentType, 'Content-Length': length},
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) =>
            status != null && status >= 200 && status < 300,
      ),
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception(
        'S3 upload failed: ${response.statusCode} ${response.data}',
      );
    }
  }
}
