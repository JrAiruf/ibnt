import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._googleSignIn);
  final GoogleSignIn _googleSignIn;
  @override
  Future<Either<AuthException, UserEntity>> signInWithGoogleAccount() async {
    try {
      final signInResult = await _googleSignIn.signIn();
      final idToken = await signInResult?.authentication.then((value) => value.idToken);
      return right(UserEntity(id: signInResult?.id ?? "", token: idToken ?? "Error", email: signInResult?.email ?? "Error"));
    } catch (e) {
      final exce = e as Exception;
      return left(AuthException(exception: "Não foi possível realizar o login.${exce.toString()}"));
    }
  }
}
