import 'package:ibnt/src/modules/splash/splash_imports.dart';

class SplasHModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
  }
}
