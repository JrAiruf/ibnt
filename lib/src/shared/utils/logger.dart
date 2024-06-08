import 'package:ibnt/src/shared/shared_imports.dart';

void logger({required String url, required String method, required String logValue}) {
  logValue = logValue
      .replaceAll('{', '{\n') //
      .replaceAll('}', '\n}') //
      .replaceAll(',', ',\n')
      .replaceAll('[', '[\n')
      .replaceAll(']', '\n]');

  return log('''URL: $url \nMETHOD: $method \nREQUEST BODY: \n$logValue \n \n''');
}
