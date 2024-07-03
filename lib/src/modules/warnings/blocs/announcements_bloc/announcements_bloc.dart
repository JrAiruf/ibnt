import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

part 'announcements_events.dart';
part 'announcements_states.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvents, AnnouncementsStates> {
  AnnouncementsBloc(this._repository) : super(AnnouncementsInitialState()) {
    on<GetAllAnnouncementsEvent>(_mapGetAllAnnouncementsEvent);
  }
  final IWarningsRepository _repository;

  Future<void> _mapGetAllAnnouncementsEvent(GetAllAnnouncementsEvent event, Emitter<AnnouncementsStates> state) async {
    state(AnnouncementsLoadingState());
    final (exception, announcements) = await _repository.getAnnouncements();
    if (exception != null) {
      state(AnnouncementsFailureState(exception.exception));
    } else {
      state(AnnouncementsSuccessState(announcements));
    }
  }
}
