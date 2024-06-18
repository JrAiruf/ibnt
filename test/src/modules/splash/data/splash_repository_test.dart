import 'package:ibnt/src/modules/splash/data/splash_repository.dart';
import 'package:ibnt/src/modules/splash/splash_imports.dart';

class AppClientMock extends Mock implements AppClient {}

void main() {
  late AppClient client;
  late ISplashRepository repository;

  setUp(
    () {
      client = AppClientMock();
      repository = SplashRepository(client);
    },
  );
  group(
    'VerifyToken should',
    () {
      test(
        'return false, due to an invalid token.',
        () async {
          when(() => client.post(any(), any())).thenAnswer((_) async => Response(jsonEncode({}), 401));
          final result = await repository.verifyToken("token");

          expect(result.isLeft(), equals(true));
          expect(result.fold((l) => l, (r) => null), isA<InvalidTokenException>());
        },
      );
      test(
        'return true, due to a valid token.',
        () async {
          when(() => client.post(any(), any())).thenAnswer((_) async => Response(jsonEncode({}), 200));
          final result = await repository.verifyToken("token");

          expect(result.isRight(), equals(true));
          expect(result.fold((l) => null, (r) => r), equals(true));
        },
      );
    },
  );
}
