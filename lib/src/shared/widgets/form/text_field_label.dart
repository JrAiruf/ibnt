import 'package:ibnt/src/app_imports.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({required this.label, super.key});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    );
  }
}
