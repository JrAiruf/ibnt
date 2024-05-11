// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/home_imports.dart';

class PostTypeWidget extends StatelessWidget {
  const PostTypeWidget({Key? key, required this.post}) : super(key: key);

  final HomePostEntity post;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.25;
    final imageContainerSize = height * 0.075;
    final memberNameFontSize = height * 0.022;
    final postContentFontSize = height * 0.017;
    return SizedBox(
      height: widgetHeight,
      width: width,
      child: Column(
        children: [
          Row(
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
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Text(
                        "Nome do Membro",
                        style: TextStyle(fontSize: memberNameFontSize),
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
          const ReactionsWidget(),
        ],
      ),
    );
  }
}
