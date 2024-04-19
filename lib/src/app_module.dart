import 'app_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    r.module('auth', module: AppModule());
  }
}
