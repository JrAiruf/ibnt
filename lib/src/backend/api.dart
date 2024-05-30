// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:ibnt/src/app_imports.dart';
import 'package:ibnt/src/mocks/bible_messages_mocks.dart';

const API_URL = "https://ibnt-api.up.railway.app/api";
const BIBLE_API_URL = "https://www.abibliadigital.com.br/api";
String user_token = "";

Future<String> setUserTokenToGlobalVariable() async {
  final preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");
  return token ?? user_token_mock;
}

abstract class StatusCodes {
  static int OK = 200;
  static int CREATED = 201;
  static int BAD_REQUEST = 400;
  static int NOT_FOUND = 404;
}
