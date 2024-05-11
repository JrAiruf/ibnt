import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class WarningsModule extends Module {
  @override
  List<Module> get imports => [
    AuthModule(),
  ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const WarningsPage()));
    r.child('/add_warnings', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const AddWarningsPage()));
  }
}
