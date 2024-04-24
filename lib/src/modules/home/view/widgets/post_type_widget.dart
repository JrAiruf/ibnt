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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height * 0.25,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}
