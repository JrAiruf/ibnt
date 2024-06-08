// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/home/home_imports.dart';

class BibleMessageReactionsWidget extends StatefulWidget {
  BibleMessageReactionsWidget({
    Key? key,
    required this.bibleMessageReaction,
  }) : super(key: key);

  BibleMessageReaction bibleMessageReaction;

  @override
  State<BibleMessageReactionsWidget> createState() => _BibleMessageReactionsWidgetState();
}

class _BibleMessageReactionsWidgetState extends State<BibleMessageReactionsWidget> {
  final String _firstReactionTag = "Glória";
  final String _secondReactionTag = "Aleluia";
  final String _thirdReactionTag = "Abençoado";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;

    final reactionsBloc = context.read<ReactionsBloc>();

    bool bibleMessageReactedByMember0() {
      if (reactionsBloc.bibleMessagesReactions.isNotEmpty) {
        bool bibleMessageReactedByMember = reactionsBloc.bibleMessagesReactions.any((bibleMessageReaction) =>
            bibleMessageReaction.bibleMessageId == widget.bibleMessageReaction.bibleMessageId && //
            bibleMessageReaction.memberId == widget.bibleMessageReaction.memberId);

        return bibleMessageReactedByMember;
      } else {
        return false;
      }
    }

    bool selectedReaction(String reactionTagName) {
      if (bibleMessageReactedByMember0()) {
        late bool selectedTag;
        final bibleMessageReaction = reactionsBloc.bibleMessagesReactions.firstWhere((bibleMessageReaction) =>
            bibleMessageReaction.memberId == widget.bibleMessageReaction.memberId && //
            bibleMessageReaction.bibleMessageId == widget.bibleMessageReaction.bibleMessageId);

        selectedTag = bibleMessageReaction.name == reactionTagName ? true : false;
        return selectedTag;
      } else {
        return false;
      }
    }

    return SizedBox(
      height: height * 0.05,
      width: width,
      child: BlocBuilder(
        bloc: reactionsBloc,
        builder: (context, state) {
          if (state is ReactionsLoadingState) {
            return const LoadingReactionWidget();
          }
          if (state is ReactionSuccessState) {
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {
                      if (!bibleMessageReactedByMember0() && !selectedReaction(_firstReactionTag)) {
                        widget.bibleMessageReaction.name = _firstReactionTag;
                        reactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessageReactedByMember0() && !selectedReaction(_firstReactionTag)) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _firstReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        reactionsBloc.add(UpdateReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (selectedReaction(_firstReactionTag)) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
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
                          border: bibleMessageReactedByMember0() && selectedReaction(_firstReactionTag)
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
                                color: bibleMessageReactedByMember0() && selectedReaction(_firstReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _firstReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: bibleMessageReactedByMember0() && selectedReaction(_firstReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
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
                      if (!bibleMessageReactedByMember0() && !selectedReaction(_secondReactionTag)) {
                        widget.bibleMessageReaction.name = _secondReactionTag;
                        reactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessageReactedByMember0() && !selectedReaction(_secondReactionTag)) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _secondReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        reactionsBloc.add(UpdateReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (selectedReaction(_secondReactionTag)) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
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
                          border: bibleMessageReactedByMember0() && selectedReaction(_secondReactionTag)
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
                                color: bibleMessageReactedByMember0() && selectedReaction(_secondReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(contentPadding),
                                child: Text(
                                  _secondReactionTag,
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    color: bibleMessageReactedByMember0() && selectedReaction(_secondReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
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
                      if (!bibleMessageReactedByMember0() && !selectedReaction(_thirdReactionTag)) {
                        widget.bibleMessageReaction.name = _thirdReactionTag;
                        reactionsBloc.add(ReactionOnBibleMessageEvent(widget.bibleMessageReaction));
                      } else if (bibleMessageReactedByMember0() && !selectedReaction(_thirdReactionTag)) {
                        final updateReactionEntity = UpdateReactionEntity(
                          _thirdReactionTag,
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
                          EntityType.message,
                        );
                        reactionsBloc.add(UpdateReactionEvent(updateReactionEntity));
                      }
                    },
                    onDoubleTap: () {
                      if (selectedReaction(_thirdReactionTag)) {
                        final removeReactionEntity = RemoveReactionEntity(
                          widget.bibleMessageReaction.memberId,
                          widget.bibleMessageReaction.bibleMessageId,
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
                          border: bibleMessageReactedByMember0() && selectedReaction(_thirdReactionTag)
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
                              color: bibleMessageReactedByMember0() && selectedReaction(_thirdReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
                            ),
                            Padding(
                              padding: EdgeInsets.all(contentPadding),
                              child: Text(
                                _thirdReactionTag,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  color: bibleMessageReactedByMember0() && selectedReaction(_thirdReactionTag) ? AppThemes.primaryColor1 : AppThemes.secondaryColor1,
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
