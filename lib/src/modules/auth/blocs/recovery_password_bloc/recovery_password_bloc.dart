import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ibnt/src/modules/auth/entities/auth_recovery_entity.dart';

part 'recovery_password_events.dart';
part 'recovery_password_states.dart';

class RecoveryPasswordBloc extends Bloc<RecoveryPasswordEvents, RecoveryPasswordStates> {
  RecoveryPasswordBloc() : super(RecoveryPasswordInitialState()) {
    on<RecoveryPasswordEvents>((event, emit) {
      // TODO: implement event handler
    });
  }
}
