// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

sealed class UserStates extends Equatable {
  const UserStates();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserStates {}

final class LoadingUserState extends UserStates {}

final class MemberUserState extends UserStates {
  MemberEntity member;
  MemberUserState(this.member);
}

final class AdminUserState extends UserStates {
  AdminEntity admin;
  AdminUserState(this.admin);
}
