import 'package:ibnt/src/modules/home/home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: Drawer(
        width: width * 0.75,
      ),
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
    );
  }
}
