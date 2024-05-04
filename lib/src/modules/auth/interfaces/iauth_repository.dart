import 'package:ibnt/src/modules/auth/auth_imports.dart';
import 'package:ibnt/src/shared/base_entities/base_user_entity.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, BaseUserEntity>> createAccount(CreateUserEntity newUserEntity);
  Future<Either<AuthException, BaseUserEntity>> signInWithAuthEntity(AuthEntity auth);
  Future<Either<AuthException, BaseUserEntity>> signInWithGoogleAccount();
  Future<void> signOut();
}
