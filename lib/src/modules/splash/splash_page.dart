import 'package:ibnt/src/modules/splash/splash_imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 3));
      Modular.to.navigate('/auth/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}
