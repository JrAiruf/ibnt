import 'dart:convert';
import 'dart:developer';

import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._googleSignIn, this._firebaseAuth, this._uno);

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final Uno _uno;

  @override
  Future<Either<AuthException, AuthResponseEntity>> createAccount(CreateUserEntity newUserEntity) async {
    try {
      final authJson = jsonEncode({
        "fullName": newUserEntity.fullName,
        "auth": {"email": newUserEntity.authEntity.email, "password": newUserEntity.authEntity.password, "role": "user"}
      });
      final response = await _uno.post('http://127.0.0.1:5099/api/users', data: authJson);
      if (response.status == 201) {
        final body = response.data as Map<String, dynamic>;
        return right(AuthResponseEntity(id: body["id"], email: body["email"], role: body["role"], token: body["token"]));
      } else {
        return left(AuthException(exception: "Não foi possível realizar o login."));
      }
    } catch (e) {
      log(e.toString());
      return left(AuthException(exception: "Erro ao criar conta."));
    }
  }

  @override
  Future<Either<AuthException, AuthResponseEntity>> signInWithGoogleAccount() async {
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
      return right(AuthResponseEntity(id: id ?? "", token: idToken ?? "Error", role: "", email: email ?? "Error"));
    } catch (e) {
      return left(AuthException(exception: "Não foi possível realizar o login."));
    }
  }

  @override
  Future<Either<AuthException, AuthResponseEntity>> signInWithAuthEntity(AuthEntity auth) async {
    try {
      final authJson = jsonEncode({"email": auth.email, "password": auth.password});
      final response = await _uno.post('${API_URL}auth', data: authJson);
      if (response.status == 200) {
        final body = response.data as Map<String, dynamic>;
        return right(AuthResponseEntity(id: body["id"], email: body["email"], role: body["role"], token: body["token"]));
      } else {
        return left(AuthException(exception: "Não foi possível realizar o login."));
      }
    } catch (e) {
      return left(AuthException(exception: "Erro de autenticação."));
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
