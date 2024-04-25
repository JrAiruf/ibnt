// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/home_post_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

class PostTypeWidget extends StatelessWidget {
  const PostTypeWidget({Key? key, required this.post}) : super(key: key);

  final HomePostEntity post;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final imageContainerSize = height * 0.07;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
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
      ],
    );
  }
}
