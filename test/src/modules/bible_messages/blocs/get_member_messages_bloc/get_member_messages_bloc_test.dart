import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

void main() {
  late IBibleMessagesRepository repository;
  late GetMemberMessagesBloc bloc;

  setUp(
    () {
      repository = BibleMessagesRepositoryMock();
      bloc = GetMemberMessagesBloc(repository);
    },
  );
  group(
    'GetMemberMessagesBloc should',
    () {
      blocTest<GetMemberMessagesBloc, GetMemberMessagesStates>(
        'emit a GetMemberMessagesFailureState',
        setUp: () {
          when(() => repository.getMemberMessages(any())).thenAnswer(
            (_) async => Left(GetMessagesException(exception: "exception")),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMemberMessagesEvent("memberId")),
        expect: () => [
          isA<GetMemberMessagesLoadingState>(),
          isA<GetMemberMessagesFailureState>(),
        ],
      );
      blocTest<GetMemberMessagesBloc, GetMemberMessagesStates>(
        'emit a GetMemberMessagesSuccessState',
        setUp: () {
          when(() => repository.getMemberMessages(any())).thenAnswer(
            (_) async => const Right([]),
          );
        },
        build: () => bloc,
        act: (bloc) => bloc.add(GetMemberMessagesEvent("memberId")),
        expect: () => [
          isA<GetMemberMessagesLoadingState>(),
          isA<GetMemberMessagesSuccessState>(),
        ],
      );
    },
  );
}
