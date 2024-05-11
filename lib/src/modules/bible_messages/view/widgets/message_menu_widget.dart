import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';
import 'package:ibnt/src/modules/bible_messages/view/widgets/bible_message_widget.dart';
import 'package:ibnt/src/shared/widgets/form/app_search_widget.dart';

class MessageMenuWidget extends StatefulWidget {
  const MessageMenuWidget({super.key});

  @override
  State<MessageMenuWidget> createState() => _MessageMenuWidgetState();
}

int _listIndex = 0;

class _MessageMenuWidgetState extends State<MessageMenuWidget> {
  PageController controller = PageController(initialPage: _listIndex);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final buttonFontSize = height * 0.025;
    final buttonInnerPadding = height * 0.0041;
    final buttonRowPadding = height * 0.04;

    bool selected = _listIndex == 0;
    int transitionDuration = 200;
    Color allMessagesColor = selected ? AppThemes.primaryColor1 : Colors.white;
    Color allMessagesTextColor = selected ? Colors.white : AppThemes.primaryColor1;
    Color createdMessagesColor = !selected ? AppThemes.primaryColor1 : Colors.white;
    Color createdMessagesTextColor = !selected ? Colors.white : AppThemes.primaryColor1;
    double radius = 5;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: buttonRowPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(top: buttonInnerPadding),
                      backgroundColor: allMessagesColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _listIndex--;
                      });
                      controller.animateToPage(
                        0,
                        duration: Duration(milliseconds: transitionDuration),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Todas",
                      style: TextStyle(
                        fontFamily: "Karma",
                        height: 0,
                        fontSize: buttonFontSize,
                        color: allMessagesTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.01),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(top: buttonInnerPadding),
                      backgroundColor: createdMessagesColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: createdMessagesColor),
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _listIndex++;
                      });
                      controller.animateToPage(
                        1,
                        duration: Duration(milliseconds: transitionDuration),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Criadas",
                      style: TextStyle(fontFamily: "Karma", height: 0, fontSize: buttonFontSize, color: createdMessagesTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppSearchWidget(
            onChanged: () {},
          ),
          Expanded(
            child: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  child: ListView(
                    children: [
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                    ],
                  ),
                ),
                SizedBox(
                  child: ListView(
                    children: [
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                      BibleMessageWidget(message: HomeMessageEntity()),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
