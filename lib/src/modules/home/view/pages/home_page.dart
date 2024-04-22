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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: height * 0.045,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset("assets/images/logo_image.jpg"),
              const SizedBox(width: 15),
              const Text(
                "IBNT",
                style: TextStyle(
                  fontFamily: 'Karma',
                  fontSize: 35,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed('./notifications'),
            icon: const Icon(
              Icons.notifications_none_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
