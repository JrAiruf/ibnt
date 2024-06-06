import 'package:ibnt/src/app_imports.dart';

part 'reactions_events.dart';
part 'reactions_states.dart';

class ReactionsBloc extends Bloc<ReactionsEvents, ReactionsStates> {
  ReactionsBloc(this._repository) : super(ReactionsInitialState()) {
    on<FetchEventsReactions>(_mapFetchEventsReactionsToState);
    on<FetchBibleMessagesReactions>(_mapFetchBibleMessagesReactionsToState);
  }

  final IHomeRepository _repository;

  Future<void> _mapFetchEventsReactionsToState(FetchEventsReactions event, Emitter<ReactionsStates> state) async {
    final result = await _repository.saveEventsReactionsInCache();
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState()),
    );
  }

  Future<void> _mapFetchBibleMessagesReactionsToState(FetchBibleMessagesReactions event, Emitter<ReactionsStates> state) async {
    final result = await _repository.saveBibleMessagesReactionsInCache();
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState()),
    );
  }
}
