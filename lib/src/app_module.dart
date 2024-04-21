import 'app_imports.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: SplasHModule(), transition: TransitionType.fadeIn);
    r.module('auth', module: AuthModule(), transition: TransitionType.fadeIn);
    r.module('home', module: HomeModule(), transition: TransitionType.fadeIn);
    r.module('bible_messages', module: BibleMessagesModule(), transition: TransitionType.fadeIn);
    r.module('warnings', module: WarningsModule(), transition: TransitionType.fadeIn);
    r.module('posts', module: PostsModule(), transition: TransitionType.fadeIn);
    r.module('departments', module: DepartmentsModule(), transition: TransitionType.fadeIn);
  }
}
