abstract class AppClient {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, Object requestBody);
  Future<dynamic> put(String url, Object body);
  Future<dynamic> delete(String url, Object body);
}
