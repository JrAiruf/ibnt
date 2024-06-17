// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class MessagePage extends StatefulWidget {
  MessagePage({required this.message, super.key});

  BibleMessageEntity message;
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final textPadding = height * 0.035;
    final titleFontSize = height * 0.035;
    final textFontSize = height * 0.023;
    final buttonFontSize = height * 0.02;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.message.title,
                        style: TextStyle(fontSize: titleFontSize, fontFamily: 'Karma'),
                      ),
                    ),
                    SizedBox(height: textPadding),
                    SizedBox(
                      height: height * 0.6,
                      child: ListView(
                        children: [
                          Text(
                            widget.message.content,
                            style: TextStyle(
                              fontSize: textFontSize,
                              fontFamily: 'Karma',
                            ),
                          ),
                          widget.message.type == BibleMessageType.generated
                              ? Container()
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                                    child: Text(
                                      widget.message.baseText,
                                      style: TextStyle(fontSize: titleFontSize),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    AppButton(
                      primaryColor: Colors.white,
                      backgroundColor: AppThemes.primaryColor1,
                      fontSize: buttonFontSize,
                      text: "Compartilhar",
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: FloatingActionButton(
          onPressed: () {
            Modular.to.pushReplacementNamed('./edit_message', arguments: {"message": widget.message});
          },
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.mode_edit,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 2),
    );
  }
}
