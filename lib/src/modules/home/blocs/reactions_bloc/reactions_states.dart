part of 'reactions_bloc.dart';

sealed class ReactionsStates extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReactionsInitialState extends ReactionsStates {}

final class ReactionsFailureState extends ReactionsStates {
  final String exception;

  ReactionsFailureState(this.exception);
}

final class EventReactionSuccessState extends ReactionsStates {}

final class BibleMessageReactionSuccessState extends ReactionsStates {}
