import 'package:ibnt/src/modules/home/home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.06),
        child: FloatingActionButton.large(
          onPressed: () {},
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
