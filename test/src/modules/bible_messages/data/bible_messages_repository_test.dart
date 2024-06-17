import 'package:ibnt/src/app_imports.dart';
import 'package:ibnt/src/mocks/bible_messages_mocks.dart';

void main() {

  late AppHttpClientMock client;
  late BibleMessagesRepository repository;
  setUp(
    () {
      user_token = user_token_mock;
      client = AppHttpClientMock();
      repository = BibleMessagesRepository(client);
    },
  );

  group(
    'GetMemberMessages should',
    () {
      test(
        'return a BibleMessageException due to fail in get member messages.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.getMemberMessages("3c3e1563-cb6a-46ae-5b92-01dc7c441249");

          expect(result.fold((left) => left, (right) => null), isA<GetMessagesException>());
        },
      );
      test(
        'return a List<BibleMessageEntity> containing all member messages.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.getMemberMessages("3c3e1563-cb6a-46ae-5b92-08dc7c441249");
          expect(result.fold((left) => null, (right) => right), isA<List<BibleMessageEntity>>());
          expect(result.fold((left) => null, (right) => right.isNotEmpty), equals(true));
        },
      );
    },
  );
  group(
    'CreateBibleMessage should',
    () {
      test(
        'return a BibleMessageException due to fail in creating message.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.createBibleMessage(NewMessageEntity(book: 'mt', memberId: "skadfak"));

          expect(result.fold((left) => left, (right) => null), isA<CreateMessageException>());
        },
      );
      test(
        'return a BibleMessageEntity containing data of created bible message.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.createBibleMessage(NewMessageEntity(
              book: 'mt', memberId: "3c3e1563-cb6a-46ae-5b92-08dc7c441249", content: "Testing Message", baseText: "Testing Base Text", title: "Testing Title", type: BibleMessageType.created.name));
          expect(result.fold((left) => null, (right) => right), isA<BibleMessageEntity>());
          expect(result.fold((left) => null, (right) => right.id) != null, equals(true));
          expect(result.fold((left) => null, (right) => right.content) != null, equals(true));
        },
      );
    },
  );
  group(
    'GenerateBibleMessage should',
    () {
      test(
        'return a BibleMessageEntity containing data of generated bible message.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.generateBibleMessage(NewMessageEntity(
            book: 'mt',
            memberId: "7ca1d637-f724-4058-a28b-08dc71614ee6",
            title: "Some Title",
          ));
          expect(result.isRight(), equals(true));
          expect(result.fold((left) => null, (right) => right), isA<BibleMessageEntity>());
          expect(result.fold((left) => null, (right) => right.content.isNotEmpty), equals(true));
        },
      );
    },
  );
  group(
    'UpdateBibleMessage should',
    () {
      test(
        'return a BibleMessageEntity updated.',
        () async {
          repository = BibleMessagesRepository(AppHttpClient());
          final result = await repository.updateBibleMessage(BibleMessageEntity(
            id: "d3922c57-54a5-40cb-068e-08dc7b813808",
            title: "Desafios Enormes",
            baseText: "1Sm 17",
            content: "Não há o que temer diante de grandes desafios, pois Deus está sempre conosco",
          ));
          expect(result.isRight(), equals(true));
          expect(result.fold((left) => null, (right) => right), isA<BibleMessageEntity>());
          expect(result.fold((left) => null, (right) => right.content.isNotEmpty), equals(true));
        },
      );
    },
  );
  group(
    'ChapterSelector Functions should',
    () {
      test(
        'to throw a GetBookChapterException.',
        () async {
          when(() => client.get(any())).thenAnswer(
            (_) async => Response(jsonEncode({"msg": "Capítulo não encontrado"}), 404),
          );
          expect(repository.chapterSelector("mt"), throwsA(isA<GetBookChapterException>()));
        },
      );
      test(
        'return a random integer within the boundaries of an amount of book chapters.',
        () async {
          when(() => client.get(any())).thenAnswer((_) async => Response(bookJson, 200));

          final result = await repository.chapterSelector("mt");
          expect(result, isA<int>());
        },
      );
    },
  );

  group(
    'ComposeMessageContent Function should',
    () {
      test(
        'to throw a ComposeMessageContentException.',
        () async {
          when(() => client.get(any())).thenAnswer((_) async => Response(jsonEncode({"msg": "Versos não encontrados"}), 404));
          expect(repository.composeMessageContent("nvi", "mt", 7), throwsA(isA<ComposeMessageContentException>()));
        },
      );

      test(
        'return a list of verses from a specific chapter to compose a message content.',
        () async {
          when(() => client.get(any())).thenAnswer((_) async => Response(verseJson, 200));

          final result = await repository.composeMessageContent("nvi", "sl", 23);
          expect(result, isA<String>());
          expect(result.isNotEmpty, equals(true));
        },
      );
    },
  );
}
