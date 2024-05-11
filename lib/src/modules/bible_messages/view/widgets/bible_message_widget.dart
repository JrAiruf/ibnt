import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessageWidget extends StatelessWidget {
  const BibleMessageWidget({Key? key, required this.message}) : super(key: key);

  final HomeMessageEntity message;

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
    final bottomPadding = height * 0.02;
    return Padding(
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://images.pexels.com/photos/1309052/pexels-photo-1309052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      size: iconSize,
                      color: AppThemes.primaryColor1,
                    ),
                  )
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
                    "Título da Mensagem",
                    style: TextStyle(
                      fontFamily: "Karma",
                      fontSize: messageTitleFontSize,
                    ),
                  ),
                  Text(
                    "Postagem realizada por membro da igreja, contendo mensagens para os outros irmãos Postagem realizada por membro da igreja, contendo mensagens criadas.",
                    style: TextStyle(
                      fontSize: postContentFontSize,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
