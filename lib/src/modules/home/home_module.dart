import 'package:ibnt/src/modules/home/home_imports.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const HomePage()));
    r.child('/add_events', child: (_) => const AddEventsPage());
    r.child('/notifications', child: (_) => const NotificationsPage());
    r.child('/profile', child: (_) => const ProfilePage());
  }
}
