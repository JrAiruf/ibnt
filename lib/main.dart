import 'package:ibnt/src/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ModularApp(
      module: AppModule(),
      child: BlocProvider(
        create: (_) => Modular.get<AuthBloc>(),
        child: const AppWidget(),
      ),
    ),
  );
}
