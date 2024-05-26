import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessagesRepository implements IBibleMessagesRepository {
  BibleMessagesRepository(this._appClient);
  final AppClient _appClient;

  @override
  Future<Either<BibleMessageException, BibleMessageEntity>> createBibleMessage(NewMessageEntity message) async {
    try {
      final response = await _appClient.post("$API_URL/biblemessages", message.toMap(), headers: {
        "content-type": "application/json",
        "authorization": "Bearer $user_token",
      }) as Response;
      if (response.statusCode == 201) {
        final bibleMessageMap = jsonDecode(response.body) as Map<String, dynamic>;
        final bibleMessage = BibleMessageEntity.fromMap(bibleMessageMap);
        return right(bibleMessage);
      } else {
        return left(CreateMessageException(exception: "Erro ao criar nova mensagem."));
      }
    } on BibleMessageException catch (e) {
      return left(CreateMessageException(exception: e.exception));
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

  Future<int> chapterSelector(String book) async {
    try {
      final randomValues = Random();
      final booksResponse = await _appClient.get(
        "$BIBLE_API_URL/books/$book",
      ) as Response;
      if (booksResponse.statusCode == 200) {
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

      final response = await _appClient.get(
        "$BIBLE_API_URL/verses/$bibleVersion/$book/$chapter",
      ) as Response;
      if (response.statusCode == 200) {
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

  Future<String> getUserToken() async {
    final preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    return token ?? "";
  }
}