abstract class AppClient {
  Future get(String url, {Map<String, String>? headers});
  Future post(String url, Map requestBody, {Map<String, String>? headers});
  Future put(String url, Map body, {Map<String, String>? headers});
  Future delete(String url, Map body, {Map<String, String>? headers});
}