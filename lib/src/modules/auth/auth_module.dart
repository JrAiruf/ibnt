import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];
  @override
  void binds(Injector i) {
    i.addSingleton<IAuthRepository>(AuthRepository.new);
    i.add<AuthBloc>(AuthBloc.new);
    i.addLazySingleton<CreateUserBloc>(CreateUserBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const AuthOptionsPage());
    r.child('/login', child: (_) => const LoginPage());
    r.child('/register', child: (_) => BlocProvider(create: (context) => Modular.get<CreateUserBloc>(), child: const RegisterPage()));
    r.child('/send_email', child: (_) => const SendEmailPage());
    r.child('/recovery_password', child: (_) => const RecoveryPasswordPage());
  }
}
