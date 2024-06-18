import 'package:ibnt/src/app_imports.dart';

class SplashRepositoryMock extends Mock implements ISplashRepository {}

void main() {
  late ISplashRepository repository;
  late TokenVerifierBloc bloc;
  group(
    'TokenVerifierBloc should',
    () {
      setUp(
        () {
          repository = SplashRepositoryMock();
          bloc = TokenVerifierBloc(repository);
        },
      );
      blocTest<TokenVerifierBloc, TokenVerifierStates>(
        'return TokenVerifierSuccessState in token verification',
        setUp: () {
          registerFallbackValue("token");
          when(() => repository.verifyToken(any())).thenAnswer((_) async => const Right(true));
        },
        build: () => bloc,
        act: (bloc) => bloc.add(const VerifyTokenEvent('token')),
        expect: () => [
          isA<TokenVerifierLoadingState>(),
          isA<TokenVerifierSuccessState>(),
        ],
        tearDown: () => bloc.close(),
      );
    },
  );
}
