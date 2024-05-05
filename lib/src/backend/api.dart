// ignore_for_file: constant_identifier_names
import 'package:ibnt/src/app_imports.dart';

const API_URL = "https://ibnt-api.up.railway.app/api";

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
