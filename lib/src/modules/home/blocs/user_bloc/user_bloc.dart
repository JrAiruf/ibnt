import 'package:ibnt/src/modules/home/home_imports.dart';

part 'user_events.dart';
part 'user_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  UserBloc() : super(UserInitialState()) {
    on<UserEvents>((event, emit) {});
  }
}
