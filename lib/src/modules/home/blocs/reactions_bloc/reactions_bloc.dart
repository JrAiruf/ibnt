import 'package:ibnt/src/app_imports.dart';

part 'reactions_events.dart';
part 'reactions_states.dart';

class ReactionsBloc extends Bloc<ReactionsEvents, ReactionsStates> {
  ReactionsBloc(this._repository) : super(ReactionsInitialState()) {
    on<FetchEventsReactionsEvent>(_mapFetchEventsReactionsToState);
    on<FetchBibleMessagesReactionsEvent>(_mapFetchBibleMessagesReactionsToState);
    on<ReactionOnEventOfTimelineEvent>(_mapReactionOnEventOfTimelineEventToState);
    on<ReactionOnBibleMessageEvent>(_mapReactionOnBibleMessageEventToState);
    on<RemoveReactionEvent>(_mapRemoveReactionEventToState);
  }

  final IHomeRepository _repository;
  final List<EventReactionResponse> eventsReactions = [];
  final List<BibleMessageReactionResponse> bibleMessagesReactions = [];

  Future<void> _mapReactionOnEventOfTimelineEventToState(ReactionOnEventOfTimelineEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final preferences = await SharedPreferences.getInstance();

    final result = await _repository.setEventReaction(event.reaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState()),
    );
    final jsonListOfEventsReactions = preferences.getStringList('events') ?? [];
    if (jsonListOfEventsReactions.isNotEmpty) {
      eventsReactions.clear();
      for (var i = 0; i < jsonListOfEventsReactions.length; i++) {
        final eventReaction = EventReactionResponse.fromJson(jsonListOfEventsReactions[i]);
        eventsReactions.add(eventReaction);
      }
    }
  }

  Future<void> _mapReactionOnBibleMessageEventToState(ReactionOnBibleMessageEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final preferences = await SharedPreferences.getInstance();

    final result = await _repository.setBibleMessageReaction(event.reaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState()),
    );
    final jsonListOfBibleMessagesReactions = preferences.getStringList('bibleMessages') ?? [];
    if (jsonListOfBibleMessagesReactions.isNotEmpty) {
      bibleMessagesReactions.clear();
      for (var i = 0; i < jsonListOfBibleMessagesReactions.length; i++) {
        final bibleMessageReaction = BibleMessageReactionResponse.fromJson(jsonListOfBibleMessagesReactions[i]);
        bibleMessagesReactions.add(bibleMessageReaction);
      }
    }
  }

  Future<void> _mapFetchEventsReactionsToState(FetchEventsReactionsEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final preferences = await SharedPreferences.getInstance();

    final result = await _repository.saveEventsReactionsInCache();
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState()),
    );
    final jsonListOfEventsReactions = preferences.getStringList('events') ?? [];
    if (jsonListOfEventsReactions.isNotEmpty) {
      eventsReactions.clear();
      for (var i = 0; i < jsonListOfEventsReactions.length; i++) {
        final eventReaction = EventReactionResponse.fromJson(jsonListOfEventsReactions[i]);
        eventsReactions.add(eventReaction);
      }
    }
  }

  Future<void> _mapFetchBibleMessagesReactionsToState(FetchBibleMessagesReactionsEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final preferences = await SharedPreferences.getInstance();
    final result = await _repository.saveBibleMessagesReactionsInCache();
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(BibleMessageReactionSuccessState()),
    );

    final jsonListOfBibleMessagesReactions = preferences.getStringList('bibleMessages') ?? [];
    if (jsonListOfBibleMessagesReactions.isNotEmpty) {
      bibleMessagesReactions.clear();
      for (var i = 0; i < jsonListOfBibleMessagesReactions.length; i++) {
        final bibleMessageReaction = BibleMessageReactionResponse.fromJson(jsonListOfBibleMessagesReactions[i]);
        bibleMessagesReactions.add(bibleMessageReaction);
      }
    }
  }

  Future<void> _mapRemoveReactionEventToState(RemoveReactionEvent event, Emitter<ReactionsStates> state) async {
    state(ReactionsLoadingState());
    final preferences = await SharedPreferences.getInstance();
    final result = await _repository.removeReaction(event.removeReaction);
    result.fold(
      (left) => state(ReactionsFailureState(left.exception)),
      (right) => state(EventReactionSuccessState()),
    );
    final jsonListOfEventsReactions = preferences.getStringList('events') ?? [];
    if (jsonListOfEventsReactions.isNotEmpty) {
      eventsReactions.clear();
      for (var i = 0; i < jsonListOfEventsReactions.length; i++) {
        final eventReaction = EventReactionResponse.fromJson(jsonListOfEventsReactions[i]);
        eventsReactions.add(eventReaction);
      }
    }
  }
}
