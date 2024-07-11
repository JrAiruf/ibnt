import 'package:ibnt/src/app_imports.dart';

class ClassName {}

void main() {
  final client = AppHttpClientMock();
  final repository = WarningsRepository(client);
  test(
    'FulfillMonthAnnouncements should return a List<AnnouncementEntity>, based on total of announcements added in a month, following a given date',
    () {
      final announcement = AnnouncementEntity(
        id: "id",
        title: "title",
        memberId: "memberId",
        description: "description",
        dateString: "2024/07/16",
        fixedWarning: true,
      );
      final result = repository.fulfillMonthAnnouncements(announcement, 7);
      expect(result, isA<List<AnnouncementEntity>>());
      expect(result.isNotEmpty, equals(true));
      expect(result.length, equals(3));
      expect(result.first.dateString != result.last.dateString, equals(true));
    },
  );
}
