// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/app_imports.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({Key? key, required this.logoHeight}) : super(key: key);

  final double logoHeight;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        SizedBox(
          height: logoHeight,
          child: Image.asset("assets/images/logo_image.jpg"),
        ),
        SizedBox(height: height * 0.015),
        const Text(
          "IBNT",
          style: TextStyle(
            fontFamily: 'Karma',
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
