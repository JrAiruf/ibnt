import 'package:http/http.dart' as http;
import 'package:ibnt/src/services/services_imports.dart';

class AppHttpClient implements AppClient {
  @override
  Future<Response> delete(String url, Object body) async {
    return await http.delete(Uri.parse(url), body: jsonEncode(body), headers: {"content-type": "application/json"});
  }

  @override
  Future<Response> get(String url) async {
    return await http.get(Uri.parse(url), headers: {"content-type": "application/json"});
  }

  @override
  Future<Response> post(String url, Object requestBody) async {
    return await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: {"content-type": "application/json"});
  }

  @override
  Future<Response> put(String url, Object body) async {
    return await http.put(Uri.parse(url), body: jsonEncode(body), headers: {"content-type": "application/json"});
  }
}
