import 'package:ibnt/src/modules/home/home_imports.dart';

part 'home_events.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
}
