import 'package:ibnt/src/modules/auth/auth_imports.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, BaseUserEntity>> createAccount(CreateUserEntity newUserEntity, {bool admin});
  Future<Either<AuthException, BaseUserEntity>> signInWithAuthEntity(AuthEntity auth);
  Future<Either<AuthException, BaseUserEntity>> signInWithGoogleAccount({bool admin});
  Future<void> signOut();
}
