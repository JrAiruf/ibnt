import 'package:ibnt/src/modules/departments/departments_imports.dart';
import 'package:ibnt/src/modules/departments/view/pages/add_departments_page.dart';
import 'package:ibnt/src/modules/departments/view/pages/department_page.dart';
import 'package:ibnt/src/modules/departments/view/pages/departments_page.dart';

class DepartmentsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const DepartmentsPage());
    r.child('/', child: (_) => const AddDepartmentsPage());
    r.child('/', child: (_) => const DepartmentPage());
  }
}
