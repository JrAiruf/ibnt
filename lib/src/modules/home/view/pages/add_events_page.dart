import 'package:ibnt/src/modules/home/home_imports.dart';

class AddEventsPage extends StatefulWidget {
  const AddEventsPage({super.key});

  @override
  State<AddEventsPage> createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
