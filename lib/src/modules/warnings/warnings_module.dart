import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class WarningsModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) =>  const WarningsPage(),
    );
    r.child('/add_warnings',
        child: (_) => const AddWarningsPage(),
    );
  }
}
