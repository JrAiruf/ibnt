import 'package:ibnt/src/modules/posts/posts_imports.dart';

class PostsModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const PostsPage()));
    r.child('/post', child: (_) => const PostPage());
    r.child('/add_post', child: (_) => const AddPostsPage());
  }
}
