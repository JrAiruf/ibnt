import 'package:ibnt/src/modules/home/home_imports.dart';

class AnnouncementCheckBox extends StatefulWidget {
  const AnnouncementCheckBox({super.key});

  @override
  State<AnnouncementCheckBox> createState() => _AnnouncementCheckBoxState();
}

class _AnnouncementCheckBoxState extends State<AnnouncementCheckBox> {
  bool boxValue = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final itemSpacing = width * 0.04;
    final fontSize = height * 0.02;
    return Row(
      children: [
        Checkbox(
            value: boxValue,
            onChanged: (value) {
              setState(() {
                boxValue = !boxValue;
              });
            }),
        SizedBox(width: itemSpacing),
        Text("Fixar no quadro de avisos", style: TextStyle(fontSize: fontSize)),
      ],
    );
  }
}
