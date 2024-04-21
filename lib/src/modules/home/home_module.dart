import 'package:ibnt/src/modules/home/home_imports.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.child('/add_event', child: (_) => const AddEventPage());
    r.child('/profile', child: (_) => const ProfilePage());
  }
}
