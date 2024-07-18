import 'package:http/http.dart' as http;

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



}