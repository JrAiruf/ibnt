import 'package:ibnt/src/shared/shared_imports.dart';

class AppSearchWidget extends StatefulWidget {
  const AppSearchWidget({super.key, required this.onChanged});

  final Function() onChanged;
  @override
  State<AppSearchWidget> createState() => _AppSearchWidgetState();
}

class _AppSearchWidgetState extends State<AppSearchWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final searchPaddingSize = height * 0.02;
    final textBottomPadding = height * 0.01;
    final widgetHeight = height * 0.038;
    double radius = 5;
    double cursorWidth = 0.6;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: searchPaddingSize),
      child: Container(
        height: widgetHeight,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: AppThemes.primaryColor1,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      color: AppThemes.primaryColor1,
                      Icons.search,
                      weight: 0.5,
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Expanded(
                      child: TextField(
                        cursorWidth: cursorWidth,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            bottom: textBottomPadding,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
