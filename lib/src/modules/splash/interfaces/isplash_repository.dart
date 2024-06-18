import 'package:ibnt/src/modules/splash/splash_imports.dart';

abstract class ISplashRepository {
  Future<Either<AuthException, bool>> verifyToken(String token);
}
