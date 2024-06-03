import 'package:ibnt/src/modules/home/entities/timeline/timeline_entity.dart';
import 'package:ibnt/src/modules/home/exceptions/home_exception.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/interfaces/ihome_repository.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository(this._appClient);
  final AppClient _appClient;
  @override
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline() async {
    try {
      final timelineEntity = TimeLineEntity(title: "", timeline: []);
      final eventsList = <EventEntity>[];
      final messagesList = <MessageEntity>[];

      final response = await _appClient.get("$API_URL/timeline", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.BAD_REQUEST) {
        return left(TimeLineException(exception: response.body));
      } else if (response.statusCode == StatusCodes.OK) {
        final jsonTimeline = jsonDecode(response.body) as Map<String, dynamic>;
        final eventsJsonList = jsonTimeline["events"] as List;
        final messagesJsonList = jsonTimeline["bibleMessages"] as List;

        for (var i = 0; i < eventsJsonList.length; i++) {
          var jsonEvent = eventsJsonList[i];
          final eventEntity = EventEntity.fromMap(jsonEvent);
          if (!eventsList.contains(eventEntity)) {
            eventsList.add(eventEntity);
          }
        }

        for (var i = 0; i < messagesJsonList.length; i++) {
          var jsonMessage = messagesJsonList[i];
          final memberMessage = MessageEntity.fromMap(jsonMessage);
          if (!messagesList.contains(memberMessage)) {
            messagesList.add(memberMessage);
          }
        }
        timelineEntity.timeline.addAll(eventsList);
        timelineEntity.timeline.addAll(messagesList);
        return right(timelineEntity);
      } else {
        return left(TimeLineException(exception: response.body));
      }
    } catch (e) {
      return left(TimeLineException(exception: "Erro ao carregar timeline."));
    }
  }
}
