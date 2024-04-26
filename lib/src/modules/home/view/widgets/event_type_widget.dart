// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:ibnt/src/modules/home/home_imports.dart';

class EventTypeWidget extends StatelessWidget {
  EventTypeWidget({Key? key, required this.event, this.editable = false}) : super(key: key);

  final HomeEventEntity event;
  bool editable = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final widgetHeight = editable ? height * 0.4 : height * 0.57;
    final verticalPadding = height * 0.009;
    final iconSize = height * 0.04;
    final eventNameFontSize = height * 0.03;
    final eventContentFontSize = height * 0.019;
    double stackOutlineMeasure = -10;
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('./event');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          height: widgetHeight,
          width: width,
          child: Column(
            children: [
              Expanded(
                flex: 3,
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
              editable ? SizedBox(height: height * 0.02) : Container(),
              editable
                  ? Container()
                  : Padding(
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
              editable
                  ? Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: verticalPadding),
                          child: Text(
                            "Descrição do evento, contendo informações pertinentes como participantes, cronograma, e demais informações que forem úteis ao evento.",
                            style: TextStyle(fontSize: eventContentFontSize),
                          ),
                        ),
                        Positioned(
                          top: stackOutlineMeasure,
                          right: stackOutlineMeasure,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_note,
                              size: iconSize,
                              color: AppThemes.primaryColor1,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: verticalPadding),
                      child: Text(
                        "Descrição do evento, contendo informações pertinentes como participantes, cronograma, e demais informações que forem úteis ao evento.",
                        style: TextStyle(fontSize: eventContentFontSize),
                      ),
                    ),
              editable ? Container() : const ReactionsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
