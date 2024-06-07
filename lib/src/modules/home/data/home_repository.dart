import 'package:ibnt/src/modules/home/home_imports.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository(this._appClient) {
    () async => await saveEventsReactionsInCache();
  }
  final AppClient _appClient;

  @override
  Future<Either<HomeException, BaseUserEntity>> getMemberById(String memberId) async {
    try {
      late BaseUserEntity user;
      final response = await _appClient.get("$API_URL/members/$memberId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.OK) {
        var memberMap = jsonDecode(response.body) as Map<String, dynamic>;
        user = userTypeDefinition(memberMap);
        return right(user);
      } else {
        return left(UserException(exception: response.body));
      }
    } catch (e) {
      return left(UserException(exception: "Erro ao carregar dados do usuário."));
    }
  }

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

  @override
  Future<Either<HomeException, void>> setEventReaction(EventReaction reaction) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      List<EventReactionResponse> eventsReactions = [];

      final response = await _appClient.post("$API_URL/reactions/events", reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.OK) {
        final reactionsList = jsonDecode(response.body) as List;
        for (var i = 0; i < reactionsList.length; i++) {
          final eventReaction = EventReactionResponse.fromMap(reactionsList[i]);
          eventsReactions.add(eventReaction);
        }
        final events = eventsReactions.map((event) => event.toJson()).toList();
        await preferences.setStringList("events", events);
        return right(null);
      } else {
        return left(ReactionException(exception: response.body));
      }
    } catch (e) {
      return left(ReactionException(exception: "Erro ao reagir ao evento."));
    }
  }

  @override
  Future<Either<HomeException, void>> setBibleMessageReaction(BibleMessageReaction reaction) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      List<BibleMessageReactionResponse> bibleMessagesReactions = [];

      final response = await _appClient.post("$API_URL/reactions/bible-messages", reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.OK) {
        final reactionsList = jsonDecode(response.body) as List;
        for (var i = 0; i < reactionsList.length; i++) {
          final bibleMessageReaction = BibleMessageReactionResponse.fromMap(reactionsList[i]);
          bibleMessagesReactions.add(bibleMessageReaction);
        }
        final bibleMessages = bibleMessagesReactions.map((bibleMessage) => bibleMessage.toJson()).toList();
        await preferences.setStringList("bibleMessages", bibleMessages);
        return right(null);
      } else {
        return left(ReactionException(exception: response.body));
      }
    } catch (e) {
      return left(ReactionException(exception: "Erro ao reagir à mensagem."));
    }
  }

  BaseUserEntity userTypeDefinition(Map<String, dynamic> userMap) {
    String type = userMap["credential"]["role"];
    return type == "user"
        ? MemberEntity(
            id: userMap["id"],
            fullName: userMap["fullName"],
            profileImage: userMap["profileImage"],
            userCredential: AppUserCredential(
              email: userMap["credential"]["email"],
              role: UserRole.user,
            ))
        : AdminEntity(
            id: userMap["id"],
            fullName: userMap["fullName"],
            profileImage: userMap["profileImage"],
            userCredential: AppUserCredential(
              email: userMap["credential"]["email"],
              role: UserRole.admin,
            ));
  }

  @override
  Future<Either<HomeException, void>> saveEventsReactionsInCache() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      List<EventReactionResponse> eventsReactions = [];

      final response = await _appClient.get("$API_URL/reactions/events", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == StatusCodes.OK) {
        final list = jsonDecode(response.body) as List;
        for (var i = 0; i < list.length; i++) {
          final eventReaction = EventReactionResponse.fromMap(list[i]);
          eventsReactions.add(eventReaction);
        }
        final events = eventsReactions.map((event) => event.toJson()).toList();
        await preferences.setStringList("events", events);
        return right(null);
      } else {
        final message = jsonDecode(response.body);
        return left(EventsReactionsListException(exception: message));
      }
    } catch (e) {
      return left(EventsReactionsListException(exception: "Não foi possível obter lista de reações aos eventos."));
    }
  }

  @override
  Future<Either<HomeException, void>> saveBibleMessagesReactionsInCache() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      List<BibleMessageReactionResponse> bibleMessagesReactions = [];

      final response = await _appClient.get("$API_URL/reactions/bible-messages", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == StatusCodes.OK) {
        final list = jsonDecode(response.body) as List;
        for (var i = 0; i < list.length; i++) {
          final bibleMessageReaction = BibleMessageReactionResponse.fromMap(list[i]);
          bibleMessagesReactions.add(bibleMessageReaction);
        }
        final bibleMessages = bibleMessagesReactions.map((bibleMessage) => bibleMessage.toJson()).toList();
        await preferences.setStringList("bibleMessages", bibleMessages);
        return right(null);
      } else {
        final message = jsonDecode(response.body);
        return left(BibleMessagesReactionsListException(exception: message));
      }
    } catch (e) {
      return left(BibleMessagesReactionsListException(exception: "Não foi possível obter lista de reações às Mensagens."));
    }
  }

  @override
  Future<Either<HomeException, void>> removeReaction(RemoverReactionEntity reaction) async {
    try {
      final response = await _appClient.delete("$API_URL/reactions/remove-reaction", reaction.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;

      if (response.statusCode == StatusCodes.NO_CONTENT) {
        await saveEventsReactionsInCache();
        await saveBibleMessagesReactionsInCache();
        return right(null);
      } else {
        final message = jsonDecode(response.body);
        return left(RemoveReactionException(exception: message));
      }
    } catch (e) {
      return left(RemoveReactionException(exception: "Não foi possível obter lista de reações às Mensagens."));
    }
  }
}
