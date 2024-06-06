import 'package:ibnt/src/shared/shared_imports.dart';

void logger({required String url, required String method, required String logValue}) {
  return log('''URL: $url \nMETHOD: $method \n${logValue.replaceAll('{', '{\n').replaceAll('}', '\n}').replaceAll(',', ',\n')} \n''');
}