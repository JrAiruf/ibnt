part of 'announcements_bloc.dart';

sealed class AnnouncementsEvents extends Equatable {
  const AnnouncementsEvents();

  @override
  List<Object> get props => [];
}

final class GetAllAnnouncementsEvent extends AnnouncementsEvents {}
