import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._googleSignIn, this._firebaseAuth);
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  @override
  Future<Either<AuthException, UserEntity>> signInWithGoogleAccount() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final auth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken,
        accessToken: auth?.accessToken,
      );
      final signInResult = await _firebaseAuth.signInWithCredential(credential);
      final id = signInResult.user?.uid;
      final email = signInResult.user?.email;
      final idToken = await signInResult.user?.getIdToken();
      return right(UserEntity(id: id ?? "", token: idToken ?? "Error", email: email ?? "Error"));
    } catch (e) {
      return left(AuthException(exception: "Não foi possível realizar o login."));
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
