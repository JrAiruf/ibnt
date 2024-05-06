import 'package:ibnt/src/modules/splash/splash_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      var prefereces = await SharedPreferences.getInstance();
      var token = prefereces.get("token");
      await Future.delayed(const Duration(seconds: 3));
      if (token != null) {
        Modular.to.navigate('/home/');
      } else {
        Modular.to.navigate('/auth/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(key: Key("logo_widget")),
      ),
    );
  }
}
