// ignore_for_file: prefer_const_constructors_in_immutables
part of 'bible_messages_bloc.dart';

sealed class BibleMessagesStates {}

final class BibleMessagesInitialState extends BibleMessagesStates {}

final class BibleMessagesLoadingState extends BibleMessagesStates {}

final class BibleMessagesFailureState extends BibleMessagesStates {
  final String exception;

  BibleMessagesFailureState(this.exception);
}

final class BibleMessagesSuccessState extends BibleMessagesStates {
  final BibleMessageEntity message;

  BibleMessagesSuccessState(this.message);
}
