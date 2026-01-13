import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dio = Dio();

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  Future<Response> getApiResponse(String url, String userToken) async {
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $userToken', // optional
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
