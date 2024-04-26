import 'package:ibnt/src/modules/home/home_imports.dart';

class WarningsPage extends StatefulWidget {
  const WarningsPage({super.key});

  @override
  State<WarningsPage> createState() => _WarningsPageState();
}

class _WarningsPageState extends State<WarningsPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final listViewPadding = width * 0.03;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: listViewPadding),
          child: ListView(
            children: const [
              AnnouncementWidget(),
              AnnouncementWidget(),
              AnnouncementWidget(),
              AnnouncementWidget(),
              AnnouncementWidget(),
              AnnouncementWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 3),
    );
  }
}
