import 'package:ibnt/src/app_imports.dart';

void main() {
  late GoogleSignIn googleSignIn;
  late AuthRepository repository;
  setUp(
    () {
      googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      repository = AuthRepository(googleSignIn);
    },
  );
  test(
    'return an UserEntity object',
    () async {
      final result = await repository.signInWithGoogleAccount();
      expect(result.fold((left) => null, (right) => right), isA<UserEntity>());
    },
  );
}
