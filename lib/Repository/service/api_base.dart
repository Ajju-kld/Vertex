import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiBase {
  final String baseUrl;

  ApiBase(this.baseUrl);

  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$path');

    final response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> post(String path, {Map<String, dynamic>? body}) async {
    final url = Uri.parse('$baseUrl$path');
    print(url);
    final response = await http.post(url, body: body);
    return response;
  }

  // Add more HTTP methods as needed (e.g., PUT, DELETE)
  Future<http.Response> put(String path, {Map<String, dynamic>? body}) async {
    final url = Uri.parse('$baseUrl$path');
    final response = await http.put(url, body: body);
    return response;
  }

  Future<http.Response> delete(String path) async {
    final url = Uri.parse('$baseUrl$path');
    final response = await http.delete(url);
    return response;
  }

  Future<http.Response> postFormData(String path, Map<String, String> fields,
      {File? file, required String fileField}) async {
    final url = Uri.parse('$baseUrl$path');
    var request = http.MultipartRequest('POST', url);

    // Add fields
    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    // Add profile file if provided
    if (file != null) {
     if (fileField == 'profile') {
        request.files.add(http.MultipartFile.fromBytes(
          'profile',
          await file.readAsBytes(),
          filename: file.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ));
      } else {
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          await file.readAsBytes(),
          filename: file.path.split('/').last,
          contentType: MediaType('video', 'mp4', {'codecs': 'avc1.42E01E'}),
        ));
      }
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return response;
  }
}
