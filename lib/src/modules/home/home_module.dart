import 'package:ibnt/src/modules/home/home_imports.dart';



class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.child('/add_event_page', child: (_) => const AddEventPage());
  }
}
