part of 'recovery_password_bloc.dart';

sealed class RecoveryPasswordEvents extends Equatable {
  @override
  List<Object> get props => [];
}

final class RecoveryPasswordEvent extends RecoveryPasswordEvents {
  RecoveryPasswordEvent();
}
