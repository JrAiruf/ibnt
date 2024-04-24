// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/home_event_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

class EventTypeWidget extends StatelessWidget {
  const EventTypeWidget({Key? key, required this.event}) : super(key: key);

  final HomeEventEntity event;
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height * 0.35,
        width: width,
        decoration: BoxDecoration(
          color: Colors.indigoAccent.shade400,
        ),
      ),
    );
  }
}
