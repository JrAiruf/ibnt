import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class WarningsRepository implements IWarningsRepository {
  WarningsRepository(this._appClient);
  final AppClient _appClient;

  @override
  Future<(WarningException?, AnnouncementEntity?)> createAnnouncement(AnnouncementEntity announcement) async {
    try {
      final response = await _appClient.post("$API_URL/announcements", announcement.creationMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.CREATED) {
        final announcementMap = jsonDecode(response.body) as Map<String, dynamic>;
        final announcement = AnnouncementEntity.fromMap(announcementMap);
        return (null, announcement);
      } else {
        return (CreateAnnouncementException(exception: "Não foi possível adicionar um novo anúncio. Erro: ${response.body}"), null);
      }
    } catch (e) {
      return (CreateAnnouncementException(exception: "Erro: $e"), null);
    }
  }

  @override
  Future<(WarningException?, List<AnnouncementEntity>)> getAnnouncements() async {
    try {
      final List<AnnouncementEntity> announcements = [];
      final response = await _appClient.get("$API_URL/announcements", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.OK) {
        final mapsList = jsonDecode(response.body) as List;

        for (var i = 0; i < mapsList.length; i++) {
          final map = mapsList[i];
          final annoucement = AnnouncementEntity.fromMap(map);
          announcements.add(annoucement);
        }

        return (null, announcements);
      } else {
        return (
          GetAnnouncementsException(exception: "Não foi possível adicionar um novo anúncio. Erro: ${response.body}"),
          announcements,
        );
      }
    } catch (e) {
      return (
        GetAnnouncementsException(exception: "Erro: $e"),
        <AnnouncementEntity>[],
      );
    }
  }
}
