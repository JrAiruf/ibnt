import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
    AppModule(),
  ];
  @override
  void binds(Injector i) {
    i.addLazySingleton<IAuthRepository>(AuthRepository.new);
    i.addLazySingleton<AuthBloc>(AuthBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (_) => Modular.get<AuthBloc>(), child: const AuthOptionsPage()));
    r.child('/login', child: (_) => const LoginPage());
    r.child('/register', child: (_) => const RegisterPage());
    r.child('/send_email', child: (_) => const SendEmailPage());
    r.child('/recovery_password', child: (_) => const RecoveryPasswordPage());
  }
}
