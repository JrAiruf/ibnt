import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._googleSignIn, this._firebaseAuth, this._appClient);

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final AppClient _appClient;

  @override
  Future<Either<AuthException, AuthResponseEntity>> createAccount(CreateUserEntity newUserEntity, {bool? admin = false}) async {
    var prefereces = await SharedPreferences.getInstance();
    try {
      var authMap = {
        "fullName": newUserEntity.fullName,
        "profileImage": newUserEntity.profileImage,
        "credential": {"email": newUserEntity.authEntity.email, "password": newUserEntity.authEntity.password}
      };
      if (admin!) {
        authMap["role"] = "admin";
      }
      final response = await _appClient.post("$API_URL/members", authMap);
      if (response.statusCode == 400) {
        final message = jsonDecode(response.body);
        return left(CreateMemberException(exception: message));
      } else if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        var userRole = body["credential"]["role"];
        var authResponseEntity = AuthResponseEntity(
          id: body["id"],
          email: body["credential"]["email"],
          role: userRole == "user" ? UserRole.user : UserRole.admin,
          token: body["credential"]["token"],
        );
        await prefereces.setString("token", authResponseEntity.token!);
        return right(authResponseEntity);
      } else {
        final message = jsonDecode(response.body);
        return left(CreateMemberException(exception: message));
      }
    } catch (e) {
      return left(CreateMemberException(exception: "Erro ao criar conta.${e.toString()}"));
    }
  }

  @override
  Future<Either<AuthException, AuthResponseEntity>> signInWithGoogleAccount() async {
    try {
      var prefereces = await SharedPreferences.getInstance();

      final googleUser = await _googleSignIn.signIn();
      final auth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken,
        accessToken: auth?.accessToken,
      );
      final signInResult = await _firebaseAuth.signInWithCredential(credential);
      final authResponseEntity =
          AuthResponseEntity(id: signInResult.user?.uid ?? "", token: await signInResult.user?.getIdToken() ?? "Error", email: signInResult.user?.email ?? "Error", role: UserRole.user);
      await prefereces.setString("token", authResponseEntity.token!);
      return right(authResponseEntity);
    } catch (e) {
      return left(AuthException(exception: "Não foi possível realizar o login."));
    }
  }

  @override
  Future<Either<AuthException, AuthResponseEntity>> signInWithAuthEntity(AuthEntity auth) async {
    try {
      final authJson = jsonEncode({"email": auth.email, "password": auth.password});
      final response = await _appClient.post('${API_URL}auth', authJson);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
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
    var prefereces = await SharedPreferences.getInstance();
    prefereces.remove("token");
    await _googleSignIn.signOut();
  }
}
