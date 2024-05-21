import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';
import 'package:ibnt/src/modules/bible_messages/view/widgets/bible_message_widget.dart';
import 'package:ibnt/src/shared/widgets/form/app_search_widget.dart';

class MessageMenuWidget extends StatefulWidget {
  const MessageMenuWidget({super.key});

  @override
  State<MessageMenuWidget> createState() => _MessageMenuWidgetState();
}

int _currentIndex = 0;
int _initialPage = 0;
int _seccondPage = 1;

class _MessageMenuWidgetState extends State<MessageMenuWidget> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final buttonFontSize = height * 0.025;
    final buttonInnerPadding = height * 0.0041;
    final buttonRowPadding = height * 0.04;

    bool firstPageSelected = _currentIndex == _initialPage;
    bool seccondPageSelected = _currentIndex == _seccondPage;
    int transitionDuration = 200;
    Color allMessagesColor = firstPageSelected ? AppThemes.primaryColor1 : Colors.white;
    Color allMessagesTextColor = firstPageSelected ? Colors.white : AppThemes.primaryColor1;
    Color createdMessagesColor = seccondPageSelected ? AppThemes.primaryColor1 : Colors.white;
    Color createdMessagesTextColor = seccondPageSelected ? Colors.white : AppThemes.primaryColor1;
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
                        _currentIndex = _initialPage;
                      });
                      controller.animateToPage(
                        _initialPage,
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
                        _currentIndex = _seccondPage;
                      });
                      controller.animateToPage(
                        _seccondPage,
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
