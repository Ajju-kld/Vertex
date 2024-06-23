import 'package:dio/dio.dart';

class ApiService {
final _dio= Dio();
final baseUrl = 'http://143.244.141.7/api';
  ApiService() {
    
    _dio.interceptors.add(LogInterceptor(responseBody: true));// Optional: Add logging interceptor

  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get('$baseUrl/$url');
      return response;
    } catch (e) {
      throw Exception('Failed to make GET request: $e');
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {

      final response = await _dio.post('$baseUrl/$url', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to make POST request: $e');
    }
  }

  // Add more methods for other HTTP methods (e.g., PUT, DELETE) as needed

  // Optional: Add custom headers or authentication methods

  // Optional: Add error handling or response parsing methods
}