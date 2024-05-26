import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._googleSignIn, this._firebaseAuth, this._appClient);

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final AppClient _appClient;

  @override
  Future<Either<AuthException, AuthResponseEntity>> createAccount(CreateUserEntity newUserEntity, {bool admin = false}) async {
    var prefereces = await SharedPreferences.getInstance();
    try {
      Map<String, dynamic> authMap = {
        "fullName": newUserEntity.fullName,
        "profileImage": newUserEntity.profileImage,
        "credential": {"email": newUserEntity.authEntity.email, "password": newUserEntity.authEntity.password}
      };
      if (admin) {
        authMap["credential"]["role"] = "admin";
      }
      final response = await _appClient.post(
        "$API_URL/members",
        authMap,
        headers: {"content-type": "application/json"},
      ) as Response;
      if (response.statusCode == 400) {
        final message = jsonDecode(response.body);
        return left(CreateMemberException(exception: message));
      } else if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        final userRole = body["credential"]["role"] == "user" ? UserRole.user : UserRole.admin;
        final authResponseEntity = AuthResponseEntity(
          id: body["id"],
          email: body["credential"]["email"],
          role: userRole,
          token: body["credential"]["token"],
        );
        await prefereces.setString("token", authResponseEntity.token!);
        await prefereces.setString("user", authResponseEntity.toJson());
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
  Future<Either<AuthException, AuthResponseEntity>> signInWithGoogleAccount({bool admin = false}) async {
    try {
      var prefereces = await SharedPreferences.getInstance();

      final googleUser = await _googleSignIn.signIn();
      final auth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: auth?.idToken,
        accessToken: auth?.accessToken,
      );

      final signInResult = await _firebaseAuth.signInWithCredential(credential);

      final userData = {"email": signInResult.user?.email, "password": signInResult.user?.uid};

      final apiSignInAttempt = await _appClient.post(
        "$API_URL/auth",
        userData,
        headers: {"content-type": "application/json"},
      ) as Response;

      if (apiSignInAttempt.statusCode != 200) {
        CreateUserEntity newUserEntity = CreateUserEntity(
          fullName: signInResult.user?.displayName ?? "",
          profileImage: signInResult.user?.photoURL,
          authEntity: AuthEntity(
            email: signInResult.user?.email ?? "",
            password: signInResult.user?.uid ?? "",
          ),
        );

        final result = await createAccount(newUserEntity, admin: admin);

        final authResponseEntity = result.fold((l) => null, (r) => r);

        if (authResponseEntity != null) {
          await prefereces.setString("token", authResponseEntity.token!);
          await prefereces.setString("user", authResponseEntity.toJson());
          return right(authResponseEntity);
        } else {
          return left(AuthException(exception: "Não foi possível realizar o login."));
        }
      } else {
        final body = jsonDecode(apiSignInAttempt.body);
        final userRole = body["role"] == "user" ? UserRole.user : UserRole.admin;
        final authResponseEntity = AuthResponseEntity(
          id: body["id"],
          email: body["email"],
          role: userRole,
          token: body["token"],
        );
        await prefereces.setString("token", authResponseEntity.token!);
        await prefereces.setString("user", authResponseEntity.toJson());
        return right(authResponseEntity);
      }
    } catch (e) {
      return left(AuthException(exception: "Não foi possível realizar o login."));
    }
  }

  @override
  Future<Either<AuthException, AuthResponseEntity>> signInWithAuthEntity(AuthEntity auth) async {
    var prefereces = await SharedPreferences.getInstance();
    try {
      final userData = {"email": auth.email, "password": auth.password};

      final response = await _appClient.post(
        '$API_URL/auth',
        userData,
        headers: {"content-type": "application/json"},
      ) as Response;
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final userRole = body["role"] == "user" ? UserRole.user : UserRole.admin;
        final authResponseEntity = AuthResponseEntity(
          id: body["id"],
          email: body["email"],
          role: userRole,
          token: body["token"],
        );
        await prefereces.setString("token", authResponseEntity.token!);
        await prefereces.setString("user", authResponseEntity.toJson());
        return right(authResponseEntity);
      } else {
        return left(AuthException(exception: "Não foi possível realizar o login. Verifique os dados e tente novamente."));
      }
    } catch (e) {
      return left(AuthException(exception: "Erro de autenticação."));
    }
  }

  @override
  Future<Either<AuthException, AuthRecoveryEntity>> sendVerificationCode(String email) async {
    try {
      final emailMap = {"email": email};
      final response = await _appClient.post(
        '$API_URL/auth/send-recovery-code',
        emailMap,
        headers: {"content-type": "application/json"},
      ) as Response;
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        final recoveryEntity = AuthRecoveryEntity(
          fullName: body["fullName"],
          verificationCode: body["verificationCode"],
          verificationEmail: body["verificationEmail"],
          newPassword: "",
        );
        return right(recoveryEntity);
      } else {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        return left(AuthException(exception: body.values.first.toString()));
      }
    } catch (e) {
      return left(AuthException(exception: "Erro ao solicitar código de verificação."));
    }
  }

  @override
  Future<Either<AuthException, void>> changePassword(AuthRecoveryEntity recoveryEntity) async {
    try {
      final recoveryData = {"email": recoveryEntity.verificationEmail, "password": recoveryEntity.newPassword};
      final response = await _appClient.put(
        '$API_URL/auth/password-definition/${recoveryEntity.verificationCode}',
        recoveryData,
        headers: {"content-type": "application/json"},
      ) as Response;
      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(AuthException(exception: "Erro ao redefinir nova senha."));
      }
    } catch (e) {
      return left(AuthException(exception: "Erro ao redefinir nova senha."));
    }
  }

  @override
  Future<void> signOut() async {
    var prefereces = await SharedPreferences.getInstance();
    prefereces.remove("token");
    await _googleSignIn.signOut();
  }
}
