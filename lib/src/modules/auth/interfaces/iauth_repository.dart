import 'package:ibnt/src/modules/auth/auth_imports.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, AuthResponseEntity>> createAccount(CreateUserEntity newUserEntity);
  Future<Either<AuthException, AuthResponseEntity>> signInWithAuthEntity(AuthEntity auth);
  Future<Either<AuthException, AuthResponseEntity>> signInWithGoogleAccount();
  Future<void> signOut();
}
