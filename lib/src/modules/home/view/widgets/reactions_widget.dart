// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/home/home_imports.dart';

class ReactionsWidget extends StatefulWidget {
  const ReactionsWidget({
    Key? key,
    required this.memberId,
    required this.content,
  }) : super(key: key);

  final TimeLineContent content;
  final String memberId;
  @override
  State<ReactionsWidget> createState() => _ReactionsWidgetState();
}

class _ReactionsWidgetState extends State<ReactionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;
    return SizedBox(
      height: height * 0.05,
      width: width,
      child: Row(
        children: [
          Expanded(
            child: Align(
              child: InkWell(
                splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(contentPadding),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Icon(
                          Icons.front_hand_sharp,
                          color: AppThemes.secondaryColor1,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Glória",
                          style: TextStyle(
                            fontSize: titleFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: AppThemes.primaryColor1.withOpacity(0.4),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Row(
                  children: [
                    const Expanded(
                      child: Icon(
                        Icons.waving_hand_sharp,
                        color: AppThemes.secondaryColor1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Aleluia",
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: AppThemes.primaryColor1.withOpacity(0.4),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Row(
                  children: [
                    const Expanded(
                      child: Icon(
                        Icons.brightness_low_outlined,
                        color: AppThemes.secondaryColor1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Abençoado",
                        style: TextStyle(
                          fontSize: titleFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
