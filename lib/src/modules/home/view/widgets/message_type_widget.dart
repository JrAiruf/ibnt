// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/home_message_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

class MessageTypeWidget extends StatelessWidget {
  const MessageTypeWidget({Key? key, required this.message}) : super(key: key);

  final HomeMessageEntity message;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height * 0.22,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.5),
          color: Colors.white,
        ),
      ),
    );
  }
}
