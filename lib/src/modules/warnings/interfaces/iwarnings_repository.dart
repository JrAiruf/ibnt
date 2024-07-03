import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

abstract class IWarningsRepository {
  Future<(WarningException?, AnnouncementEntity?)> createAnnouncement(AnnouncementEntity announcement);
  Future<(WarningException?, List<AnnouncementEntity>)> getAnnouncements();
}
