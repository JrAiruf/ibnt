import 'package:ibnt/src/modules/posts/posts_imports.dart';
import 'package:ibnt/src/modules/posts/view/pages/add_posts_page.dart';
import 'package:ibnt/src/modules/posts/view/pages/post_page.dart';
import 'package:ibnt/src/modules/posts/view/pages/posts_page.dart';

class PostsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_)=> const PostsPage());
    r.child('/post', child: (_)=> const PostPage());
    r.child('/add_post', child: (_)=> const AddPostsPage());
  }
}