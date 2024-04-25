// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/home_message_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/view/widgets/reactions_widget.dart';

class MessageTypeWidget extends StatelessWidget {
  const MessageTypeWidget({Key? key, required this.message}) : super(key: key);

  final HomeMessageEntity message;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.35;
    final imageContainerSize = height * 0.075;
    final iconSize = height * 0.045;
    final memberNameFontSize = height * 0.025;
    final postContentFontSize = height * 0.019;
    return SizedBox(
      height: widgetHeight,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: Container(
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
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Text(
                        "Nome do Membro",
                        style: TextStyle(fontSize: memberNameFontSize),
                      ),
                    ),
                    Icon(
                      Icons.library_books,
                      color: AppThemes.primaryColor1,
                      size: iconSize,
                    )
                  ],
                ),
                Text(
                  "Postagem realizada por membro da igreja, contendo mensagens para os outros irmãos Postagem realizada por membro da igreja, contendo mensagens criadas.",
                  style: TextStyle(fontSize: postContentFontSize),
                ),
                const Spacer(),
                const ReactionsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
