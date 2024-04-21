import 'package:ibnt/firebase_options.dart';
import 'package:ibnt/src/app_imports.dart';
import 'package:ibnt/src/app_module.dart';
import 'package:ibnt/src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
