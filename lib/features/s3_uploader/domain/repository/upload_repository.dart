import 'dart:io';
import 'package:dio/dio.dart';
import '../models/media_model.dart';

class S3UploadRepository {
  final Dio _dio;

  S3UploadRepository(this._dio);

  Future<S3UploadResponse> getSignedUrl(String fileName) async {
    try {
      final response = await _dio.get(
        'https://drapper.neksoft.com/webapi-drapper/s3-upload',
        queryParameters: {'fileName': fileName},
      );

      if (response.statusCode == 200) {
        return S3UploadResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to get signed URL: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get signed URL: $e');
    }
  }

  Future<void> uploadToS3(String uploadUrl, File file) async {
    try {
      final bytes = await file.readAsBytes();

      final response = await _dio.put(
        uploadUrl,
        data: Stream.fromIterable(bytes.map((e) => [e])),
        options: Options(
          headers: {
            'Content-Type': file.path.split('.').last == 'png'
                ? 'image/png'
                : 'image/jpeg',
            'Content-Length': bytes.length,
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Upload to S3 failed: $e');
    }
  }

  // Optional: Send fileUrl to your update API
  Future<void> sendToUpdateApi(
    String fileUrl, {
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final data = {'imageUrl': fileUrl, ...?additionalData};

      final response = await _dio.post(
        'YOUR_UPDATE_API_ENDPOINT', // Replace with your actual endpoint
        data: data,
      );

      if (response.statusCode != 200) {
        throw Exception('Update API failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to send to update API: $e');
    }
  }
}
