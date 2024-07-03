// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementWidget extends StatelessWidget {
  AnnouncementWidget({required this.announcement, super.key});

  AnnouncementEntity announcement;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.28;
    final dateContainerSize = height * 0.065;
    final titleFontSize = height * 0.04;
    final iconSize = height * 0.04;
    final dateFontSize = height * 0.035;
    final eventTitleFontSize = height * 0.025;
    final eventContentFontSize = height * 0.02;
    return SizedBox(
      height: widgetHeight,
      width: width,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: dateContainerSize,
                width: dateContainerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppThemes.primaryColor1,
                  ),
                ),
                child: Center(
                  child: Text(
                    announcement.dateString.split("/")[1],
                    style: TextStyle(fontSize: dateFontSize, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Expanded(
                child: VerticalDivider(
                  thickness: 2,
                ),
              ),
            ],
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      announcement.setAnnouncementWeekDay(announcement.dateString),
                      style: TextStyle(
                        fontSize: titleFontSize,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppThemes.primaryColor1,
                        size: iconSize,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: Text(
                    announcement.title,
                    style: TextStyle(fontSize: eventTitleFontSize, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  announcement.description,
                  style: TextStyle(
                    fontSize: eventContentFontSize,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
