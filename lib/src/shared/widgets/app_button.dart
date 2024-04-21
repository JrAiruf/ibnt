import 'package:ibnt/src/app_imports.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.widget,
    this.elevation,
    this.borderRadius,
    this.onTap,
    this.primaryColor,
    this.height,
    this.width,
    this.text,
    this.showBorder,
    this.backgroundColor,
  });

  final Widget? widget;
  final Function()? onTap;
  final Color? primaryColor;
  final Color? backgroundColor;
  final String? text;
  final bool? showBorder;
  final double? borderRadius;
  final double? elevation;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 55,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            border: Border.all(color: primaryColor ?? Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget != null ? widget! : Container(),
                const SizedBox(width: 25),
                Text(
                  text ?? "",
                  style: TextStyle(color: primaryColor, fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
