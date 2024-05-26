import 'package:http/http.dart' as http;
import 'package:ibnt/src/services/services_imports.dart';

class AppHttpClient implements AppClient {

  @override
  Future<Response> delete(String url, Object body, {Map<String, String>? headers}) async {
    return await http.delete(Uri.parse(url), body: jsonEncode(body), headers: headers);
  }

  @override
  Future<Response> get(String url, {Map<String, String>? headers}) async {
    return await http.get(Uri.parse(url), headers: headers);
  }

  @override
  Future<Response> post(String url, Object requestBody, {Map<String, String>? headers}) async {
    return await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: headers);
  }

  @override
  Future<Response> put(String url, Object body, {Map<String, String>? headers}) async {
    return await http.put(Uri.parse(url), body: jsonEncode(body), headers: headers);
  }
}
