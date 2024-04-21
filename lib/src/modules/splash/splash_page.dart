import 'package:ibnt/src/app_imports.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "HELLO",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
