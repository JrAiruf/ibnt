import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessageWidget extends StatelessWidget {
  const BibleMessageWidget({Key? key, required this.message, this.onTap}) : super(key: key);

  final HomeMessageEntity message;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.2;
    final imageContainerSize = height * 0.075;
    final iconSize = height * 0.033;
    final memberNameFontSize = height * 0.02;
    final messageTitleFontSize = height * 0.026;
    final postContentFontSize = height * 0.017;
    final bottomPadding = height * 0.03;
    bool createdMessage = message.messageType == BibleMessageType.created;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: SizedBox(
          height: widgetHeight,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: imageContainerSize,
                      width: imageContainerSize,
                      decoration: BoxDecoration(
                        border:!createdMessage ? Border.all(color: AppThemes.primaryColor1, width: 2) : null,
                        shape: BoxShape.circle,
                        image: createdMessage
                            ? const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/1309052/pexels-photo-1309052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"))
                            : const DecorationImage(
                                image: AssetImage("assets/images/ibnt_logo.png")),
                      ),
                    ),
                   message.messageType == BibleMessageType.created ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_outlined,
                        size: iconSize,
                        color: AppThemes.primaryColor1,
                      ),
                    ) : Container()
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nome do Membro",
                      style: TextStyle(
                        fontSize: memberNameFontSize,
                      ),
                    ),
                    Text(
                      message.title,
                      style: TextStyle(
                        fontFamily: "Karma",
                        fontSize: messageTitleFontSize,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        message.content,
                        style: TextStyle(
                          fontSize: postContentFontSize,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
