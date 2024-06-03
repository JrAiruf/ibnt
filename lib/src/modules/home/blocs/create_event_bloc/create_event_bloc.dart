import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_event_events.dart';
part 'create_event_states.dart';

class CreateEventBloc extends Bloc<CreateEventEvents, CreateEventState> {
  CreateEventBloc() : super(CreateEventInitial()) {
    on<CreateEventEvents>((event, emit) {
      // TODO: implement event handler
    });
  }
}
