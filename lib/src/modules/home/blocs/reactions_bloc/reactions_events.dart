part of 'reactions_bloc.dart';

sealed class ReactionsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class EventReactionEvent extends ReactionsEvents {
  final EventReaction reaction;

  EventReactionEvent(this.reaction);
}

 class BibleMessageReactionEvent extends ReactionsEvents {
  final BibleMessageReaction reaction;

  BibleMessageReactionEvent(this.reaction);
}
