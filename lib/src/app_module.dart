import 'app_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: SplasHModule(), transition: TransitionType.fadeIn);
    r.module('auth', module: AuthModule(), transition: TransitionType.fadeIn);
    r.module('bible_messages', module: BibleMessagesModule(), transition: TransitionType.fadeIn);
  }
}
