// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/home_event_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/view/widgets/reactions_widget.dart';

class EventTypeWidget extends StatelessWidget {
  const EventTypeWidget({Key? key, required this.event}) : super(key: key);

  final HomeEventEntity event;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = height * 0.45;
    final verticalPadding = height * 0.01;
    final eventNameFontSize = height * 0.03;
    final eventContentFontSize = height * 0.019;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: widgetHeight,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.pexels.com/photos/2351722/pexels-photo-2351722.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Nome do Evento",
                    style: TextStyle(fontSize: eventNameFontSize),
                  ),
                  Text(
                    "Data do Evento",
                    style: TextStyle(fontSize: eventContentFontSize),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              child: Text(
                "Descrição do evento, contendo informações pertinentes como participantes, cronograma, e demais informações que forem úteis ao evento.",
                style: TextStyle(fontSize: eventContentFontSize),
              ),
            ),
            const ReactionsWidget(),
          ],
        ),
      ),
    );
  }
}
