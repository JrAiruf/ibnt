import 'package:ibnt/src/modules/auth/auth_imports.dart';

abstract class IAuthRepository {
  Future<Either<AuthException, UserEntity>> signInWithGoogleAccount();
}
