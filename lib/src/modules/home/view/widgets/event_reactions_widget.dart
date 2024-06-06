// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/home/home_imports.dart';

class EventReactionsWidget extends StatelessWidget {
  EventReactionsWidget({
    Key? key,
    required this.eventReaction,
  }) : super(key: key);

  EventReaction eventReaction;
  bool gloryToggled = false;
  bool allellujahToggled = false;
  bool blessedToggled = false;

  @override
  Widget build(BuildContext context) {
    final reactionsBloc = context.read<ReactionsBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;
    return SizedBox(
      height: height * 0.05,
      width: width,
      child: BlocBuilder(
        bloc: reactionsBloc,
        builder: (context, state) {
          if (state is EventReactionSuccessState) {
            return Row(
              children: [
                Expanded(
                  child: Align(
                    child: InkWell(
                      splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                      onDoubleTap: () {
                        gloryToggled = true;
                        allellujahToggled = false;
                        blessedToggled = false;
                        eventReaction.name = "Glória";
                        reactionsBloc.add(EventReactionEvent(eventReaction));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(contentPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.front_hand_sharp,
                                color: gloryToggled ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Glória",
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: gloryToggled ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onDoubleTap: () {
                      gloryToggled = false;
                      allellujahToggled = true;
                      blessedToggled = false;
                      eventReaction.name = "Aleluia";
                      reactionsBloc.add(EventReactionEvent(eventReaction));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.waving_hand_sharp,
                              color: allellujahToggled ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Aleluia",
                              style: TextStyle(
                                fontSize: titleFontSize,
                                color: allellujahToggled ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onDoubleTap: () {
                      gloryToggled = false;
                      allellujahToggled = false;
                      blessedToggled = true;
                      eventReaction.name = "Abençoado";
                      reactionsBloc.add(EventReactionEvent(eventReaction));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                              Icons.brightness_auto_outlined,
                              color: AppThemes.secondaryColor1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Abençoado",
                              style: TextStyle(
                                fontSize: titleFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
