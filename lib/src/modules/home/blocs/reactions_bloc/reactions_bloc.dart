import 'package:ibnt/src/app_imports.dart';

part 'reactions_events.dart';
part 'reactions_states.dart';

class ReactionsBloc extends Bloc<ReactionsEvents, ReactionsStates> {
  ReactionsBloc(this._repository) : super(ReactionsInitialState()) {
    on<EventReactionEvent>(_mapEventReactionEventToState);
    on<BibleMessageReactionEvent>(_mapBibleMessageReactionEventToState);
  }

  final IHomeRepository _repository;

  Future<void> _mapEventReactionEventToState(EventReactionEvent event, Emitter<ReactionsStates> state) async {
    final result = await _repository.setEventReaction(event.reaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState(right)),
    );
  }

  Future<void> _mapBibleMessageReactionEventToState(BibleMessageReactionEvent event, Emitter<ReactionsStates> state) async {
    final result = await _repository.setBibleMessageReaction(event.reaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState(right)),
    );
  }
}
