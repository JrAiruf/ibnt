part of 'reactions_bloc.dart';

sealed class ReactionsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ReactionOnEventOfTimelineEvent extends ReactionsEvents {
  final EventReaction reaction;

  ReactionOnEventOfTimelineEvent(this.reaction);
}

class ReactionOnBibleMessageEvent extends ReactionsEvents {
  final BibleMessageReaction reaction;

  ReactionOnBibleMessageEvent(this.reaction);
}

final class FetchEventsReactionsEvent extends ReactionsEvents {}

final class FetchBibleMessagesReactionsEvent extends ReactionsEvents {}

final class RemoveReactionEvent extends ReactionsEvents {
  final RemoverReactionEntity removeReaction;

  RemoveReactionEvent(this.removeReaction);
}
