import 'package:ibnt/src/modules/splash/splash_imports.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    r.module('/auth', module: AuthModule(), transition: TransitionType.fadeIn);
  }
}
