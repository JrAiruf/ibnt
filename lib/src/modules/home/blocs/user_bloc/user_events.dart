part of 'user_bloc.dart';

abstract class UserEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FilterUserEvent extends UserEvents {
  FilterUserEvent(this.user);
  final BaseUserEntity user;
}
