import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class AppDropDown<T> extends StatefulWidget {
  AppDropDown({
    required this.items,
    required this.fieldLabel,
    this.hintText,
    super.key,
  });

  final List<T> items;
  final String fieldLabel;
  final String? hintText;
  T? selectedValue;

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final labelSpacing = height * 0.01;
    final fontSize = height * 0.02;
    final iconSize = height * 0.035;
    final dropdownButtonHeight =  height * 0.069;
    final labelFontSize = height * 0.025;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(
          label: widget.fieldLabel,
          fontSize: labelFontSize,
        ),
        SizedBox(
          height: labelSpacing,
        ),
        SizedBox(
          height:dropdownButtonHeight,
          child: DropdownButtonFormField(
            onChanged: (value) {
              setState(() {
                widget.selectedValue = value;
              });
            },
            hint: Text(widget.hintText ?? ""),
            items: widget.items
                .map((item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        item.toString(),
                      ),
                    ))
                .toList(),
            dropdownColor: Colors.white,
            style: TextStyle(fontSize: fontSize, color: AppThemes.secondaryColor1),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
              border: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppThemes.secondaryColor1)),
            ),
            iconEnabledColor: AppThemes.primaryColor1,
            iconSize: iconSize,
            isDense: true,
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}
