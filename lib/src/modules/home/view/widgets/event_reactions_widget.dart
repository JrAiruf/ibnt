// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/view/widgets/loading_reaction_widget.dart';

class EventReactionsWidget extends StatefulWidget {
  EventReactionsWidget({
    Key? key,
    required this.eventReaction,
  }) : super(key: key);

  EventReaction eventReaction;

  @override
  State<EventReactionsWidget> createState() => _EventReactionsWidgetState();
}

late ReactionsBloc reactionsBloc;

class _EventReactionsWidgetState extends State<EventReactionsWidget> {
  final String _firstReactionTag = "Glória";
  final String _secondReactionTag = "Aleluia";
  final String _thirdReactionTag = "Abençoado";

  bool _eventReactedByMember() {
    bool eventReactedByMember = reactionsBloc.eventsReactions.any((eventReaction) =>
        eventReaction.eventId == widget.eventReaction.eventId && //
        eventReaction.memberId == widget.eventReaction.memberId);

    return eventReactedByMember;
  }

  bool _selectedReaction(String reactionTagName) {
    bool selectedTag = false;
    if (_eventReactedByMember()) {
      final eventReaction = reactionsBloc.eventsReactions.where((eventReaction) => eventReaction.eventId == widget.eventReaction.eventId).first;
      selectedTag = eventReaction.name == reactionTagName ? true : false;
    }
    return selectedTag;
  }

  @override
  void initState() {
    super.initState();
    reactionsBloc = context.read<ReactionsBloc>();
    reactionsBloc.add(FetchEventsReactionsEvent());
  }

  @override
  Widget build(BuildContext context) {
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
          if (state is ReactionsLoadingState) {
            return const LoadingReactionWidget();
          }
          if (state is EventReactionSuccessState) {
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!_eventReactedByMember() && !_selectedReaction(_firstReactionTag)) {
                        widget.eventReaction.name = _firstReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (_eventReactedByMember() && !_selectedReaction(_firstReactionTag)) {
                        log("OUTRA REAÇÃO");
                      }
                    },
                    onDoubleTap: () {
                      if (_selectedReaction(_firstReactionTag)) {
                        final removeReactionEntity = RemoverReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: _eventReactedByMember() && _selectedReaction(_firstReactionTag)
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.front_hand_sharp,
                                color: _eventReactedByMember() && _selectedReaction(_firstReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _firstReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: _eventReactedByMember() && _selectedReaction(_firstReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                                  ),
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
                    onTap: () {
                      if (!_eventReactedByMember() && !_selectedReaction(_secondReactionTag)) {
                        widget.eventReaction.name = _secondReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (_eventReactedByMember() && !_selectedReaction(_secondReactionTag)) {
                        log("OUTRA REAÇÃO");
                      }
                    },
                    onDoubleTap: () {
                      if (_selectedReaction(_secondReactionTag)) {
                        final removeReactionEntity = RemoverReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: _eventReactedByMember() && _selectedReaction(_secondReactionTag)
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.waving_hand_sharp,
                                color: _eventReactedByMember() && _selectedReaction(_secondReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _secondReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: _eventReactedByMember() && _selectedReaction(_secondReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                                  ),
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
                    onTap: () {
                      if (!_eventReactedByMember() && !_selectedReaction(_thirdReactionTag)) {
                        widget.eventReaction.name = _thirdReactionTag;
                        reactionsBloc.add(ReactionOnEventOfTimelineEvent(widget.eventReaction));
                      } else if (_eventReactedByMember() && !_selectedReaction(_thirdReactionTag)) {
                        log("OUTRA REAÇÃO");
                      }
                    },
                    onDoubleTap: () {
                      if (_selectedReaction(_thirdReactionTag)) {
                        final removeReactionEntity = RemoverReactionEntity(
                          widget.eventReaction.memberId,
                          widget.eventReaction.eventId,
                        );
                        reactionsBloc.add(RemoveReactionEvent(removeReactionEntity));
                      } else {
                        return;
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Container(
                        decoration: BoxDecoration(
                          border: _eventReactedByMember() && _selectedReaction(_thirdReactionTag)
                              ? Border.all(
                                  color: AppThemes.primaryColor1,
                                )
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.light_mode,
                              color: _eventReactedByMember() && _selectedReaction(_thirdReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                            ),
                            Padding(
                              padding: EdgeInsets.all(contentPadding),
                              child: Text(
                                _thirdReactionTag,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: _eventReactedByMember() && _selectedReaction(_thirdReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                                ),
                              ),
                            ),
                          ],
                        ),
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
