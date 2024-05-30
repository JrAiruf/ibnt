import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessagesRepository implements IBibleMessagesRepository {
  BibleMessagesRepository(this.appClient);
  final AppClient appClient;

  @override
  Future<Either<BibleMessageException, List<BibleMessageEntity>>> getMemberMessages(String memberId) async {
    try {
      final memberMessages = <BibleMessageEntity>[];
      final response = await appClient.get("$API_URL/biblemessages/member/$memberId", headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.NOT_FOUND) {
        return left(GetMessagesException(exception: response.body));
      } else if (response.statusCode == StatusCodes.OK) {
        final jsonMemberMessages = jsonDecode(response.body) as List;
        for (var i = 0; i < jsonMemberMessages.length; i++) {
          var jsonMemberMessage = jsonMemberMessages[i];
          final memberMessage = BibleMessageEntity.fromMap(jsonMemberMessage);
          if (!memberMessages.contains(memberMessage)) {
            memberMessages.add(memberMessage);
          }
        }
        return right(memberMessages);
      } else {
        return left(GetMessagesException(exception: response.body));
      }
    } catch (e) {
      return left(GetMessagesException(exception: "Erro ao obter mensagens do usuário."));
    }
  }

  @override
  Future<Either<BibleMessageException, BibleMessageEntity>> createBibleMessage(NewMessageEntity message) async {
    try {
      final response = await appClient.post("$API_URL/biblemessages", message.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.CREATED) {
        final bibleMessageMap = jsonDecode(response.body) as Map<String, dynamic>;
        final bibleMessage = BibleMessageEntity.fromMap(bibleMessageMap);
        return right(bibleMessage);
      } else {
        return left(CreateMessageException(exception: "Erro ao criar nova mensagem."));
      }
    } on BibleMessageException {
      rethrow;
    }
  }

  @override
  Future<Either<BibleMessageException, BibleMessageEntity>> generateBibleMessage(NewMessageEntity message) async {
    try {
      int selectedChapter = await chapterSelector(message.book);
      message.content = await composeMessageContent(message.bibleVersion, message.book, selectedChapter);
      message.baseText = "${message.book.toUpperCase()} $selectedChapter";
      message.title = message.baseText;
      message.type = BibleMessageType.generated.name;

      final generatedBibleMessage = await createBibleMessage(message);

      if (generatedBibleMessage.isRight()) {
        return generatedBibleMessage;
      } else {
        return left(GenerateMessageException(exception: "Não foi possível gerar uma nova mensagem."));
      }
    } on BibleMessageException catch (e) {
      return left(GenerateMessageException(exception: e.exception));
    }
  }

  @override
  Future<Either<BibleMessageException, BibleMessageEntity>> updateBibleMessage(BibleMessageEntity message) async {
    try {
      final response = await appClient.put("$API_URL/biblemessages/${message.id}", message.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == StatusCodes.OK) {
        final bibleMessageMap = jsonDecode(response.body) as Map<String, dynamic>;
        final bibleMessage = BibleMessageEntity.fromMap(bibleMessageMap);
        return right(bibleMessage);
      } else {
        return left(UpdateMessageException(exception: "Erro ao atualizar mensagem."));
      }
    } on BibleMessageException catch (e) {
      return left(UpdateMessageException(exception: e.exception));
    }
  }

  Future<int> chapterSelector(String book) async {
    try {
      final randomValues = Random();
      final booksResponse = await appClient.get(
        "$BIBLE_API_URL/books/$book",
      ) as Response;
      if (booksResponse.statusCode == StatusCodes.OK) {
        final bookMap = jsonDecode(booksResponse.body) as Map<String, dynamic>;
        int generatedChapter = randomValues.nextInt(bookMap["chapters"]);
        int chapter = generatedChapter > 0 ? generatedChapter : (generatedChapter + 1);
        return chapter;
      } else {
        throw GetBookChapterException(exception: "Erro ao gerar capítulo de busca.");
      }
    } on BibleMessageException {
      rethrow;
    }
  }

  Future<String> composeMessageContent(String bibleVersion, String book, int chapter) async {
    try {
      final random = Random();
      final versesList = <String>[];

      final response = await appClient.get("$BIBLE_API_URL/verses/$bibleVersion/$book/$chapter") as Response;
      if (response.statusCode == StatusCodes.OK) {
        final verseMap = jsonDecode(response.body) as Map<String, dynamic>;
        final chapterVerses = verseMap["verses"] as List;
        for (var i = 0; i < chapterVerses.length; i++) {
          var verse = "${chapterVerses[i]["number"]} ${chapterVerses[i]["text"]}";
          versesList.add(verse);
        }
        final totalChaptersVerses = verseMap["chapter"]["verses"] as int;
        final randomVerseValue = random.nextInt(totalChaptersVerses);
        final versesAmount = randomVerseValue > 0 ? randomVerseValue : randomVerseValue + 1;
        final messageContent = versesList.take(versesAmount).toList().join("\n");
        return messageContent;
      } else {
        final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
        throw ComposeMessageContentException(exception: responseMap["msg"]);
      }
    } on BibleMessageException {
      rethrow;
    }
  }
}
