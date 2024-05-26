abstract class AppClient {
  Future<dynamic> get(String url,{Map<String, String>? headers});
  Future<dynamic> post(String url, Map requestBody,{Map<String, String>? headers});
  Future<dynamic> put(String url, Map body,{Map<String, String>? headers});
  Future<dynamic> delete(String url, Map body,{Map<String, String>? headers});
}
