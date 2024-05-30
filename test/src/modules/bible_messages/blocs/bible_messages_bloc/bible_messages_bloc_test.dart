import 'package:ibnt/src/app_imports.dart';

void main() {
  late IBibleMessagesRepository repository;
  late BibleMessagesBloc bloc;
  group(
    'CreateMessageEvent should',
    () {
      setUp(
        () {
          repository = BibleMessagesRepositoryMock();
          bloc = BibleMessagesBloc(repository);
        },
      );

      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'emit a BibleMessageFailureState',
        setUp: () {
          registerFallbackValue(NewMessageEntity(memberId: "memberId"));
          when(() => repository.createBibleMessage(any())).thenAnswer(
            (_) async => Left(CreateMessageException(exception: "exception")),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(CreateMessageEvent(NewMessageEntity(memberId: "memberId"))),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<BibleMessagesFailureState>(),
        ],
        tearDown: () => bloc.close(),
      );
      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'emit a BibleMessageSuccessState',
        setUp: () {
          registerFallbackValue(NewMessageEntity(memberId: "memberId"));
          when(() => repository.createBibleMessage(any())).thenAnswer(
            (_) async => Right(BibleMessageEntity()),
          );
        },
        build: () => BibleMessagesBloc(repository),
        act: (bloc) => bloc.add(CreateMessageEvent(
          NewMessageEntity(memberId: "memberId"),
        )),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<BibleMessagesSuccessState>(),
        ],
        tearDown: () => bloc.close(),
      );
    },
  );

  group(
    'GenerateMessageEvent should',
    () {
      setUp(
        () {
          repository = BibleMessagesRepositoryMock();
          bloc = BibleMessagesBloc(repository);
        },
      );

      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'return a BibleMessageFailureState',
        setUp: () {
          registerFallbackValue(NewMessageEntity(memberId: "memberId"));
          when(() => repository.generateBibleMessage(any())).thenAnswer(
            (_) async => Left(CreateMessageException(exception: "exception")),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GenerateMessageEvent(NewMessageEntity(memberId: "memberId"))),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<BibleMessagesFailureState>(),
        ],
        tearDown: () => bloc.close(),
      );
      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'return a BibleMessageSuccessState',
        setUp: () {
          registerFallbackValue(NewMessageEntity(memberId: "memberId"));
          when(() => repository.generateBibleMessage(any())).thenAnswer(
            (_) async => Right(BibleMessageEntity()),
          );
        },
        build: () => BibleMessagesBloc(repository),
        act: (bloc) => bloc.add(GenerateMessageEvent(NewMessageEntity(memberId: "memberId"))),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<BibleMessagesSuccessState>(),
        ],
        tearDown: () => bloc.close(),
      );
    },
  );
  group(
    'UpdateMessageEvent should',
    () {
      setUp(
        () {
          registerFallbackValue(BibleMessageEntity());
          repository = BibleMessagesRepositoryMock();
          bloc = BibleMessagesBloc(repository);
        },
      );

      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'return a UpdateBibleMessageFailureState',
        setUp: () {
          when(() => repository.updateBibleMessage(any())).thenAnswer(
            (_) async => Left(UpdateMessageException(exception: "exception")),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(UpdateMessageEvent(BibleMessageEntity())),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<UpdateBibleMessageFailureState>(),
        ],
        tearDown: () => bloc.close(),
      );
      blocTest<BibleMessagesBloc, BibleMessagesStates>(
        'return a BibleMessageSuccessState',
        setUp: () {
          when(() => repository.updateBibleMessage(any())).thenAnswer(
            (_) async => Right(BibleMessageEntity()),
          );
        },
        build: () => BibleMessagesBloc(repository),
        act: (bloc) => bloc.add(UpdateMessageEvent(BibleMessageEntity())),
        wait: const Duration(milliseconds: 300),
        expect: () => [
          isA<BibleMessagesLoadingState>(),
          isA<UpdateBibleMessageSuccessState>(),
        ],
        tearDown: () => bloc.close(),
      );
    },
  );
}
