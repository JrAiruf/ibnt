import 'package:ibnt/src/modules/home/entities/timeline/timeline_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/interfaces/ihome_repository.dart';

part 'home_events.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc(this._repository) : super(HomeInitialState()) {
    on<FetchTimelineEvent>(_mapFetchTimelineEventToState);
  }

  final IHomeRepository _repository;
  Future<void> _mapFetchTimelineEventToState(FetchTimelineEvent event, Emitter<HomeStates> state) async {
    state(HomeLoadingState());
    final result = await _repository.fetchTimeline();
    result.fold(
      (left) => state(HomeFailureState(left.exception)),
      (right) => state(HomeSuccessState(right)),
    );
  }
}
