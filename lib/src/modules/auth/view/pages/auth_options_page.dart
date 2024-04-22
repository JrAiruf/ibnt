import 'package:ibnt/src/modules/auth/auth_imports.dart';

class AuthOptionsPage extends StatefulWidget {
  const AuthOptionsPage({super.key});

  @override
  State<AuthOptionsPage> createState() => AuthOptionsPageState();
}

class AuthOptionsPageState extends State<AuthOptionsPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              const LogoWidget(),
              SizedBox(height: height * 0.045),
              const Text(
                "Para acessar o app, você pode \n usar as seguintes opções",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: height * 0.05),
              AppButton(
                showBorder: true,
                width: width,
                primaryColor: Colors.black,
                widget: const Icon(Icons.email_outlined),
                text: "Email e senha",
                onTap: () {
                  Modular.to.pushNamed('./login');
                },
              ),
              SizedBox(height: height * 0.01),
              BlocConsumer(
                bloc: authBloc,
                listener: (context, state) {
                  if (state is AuthFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        margin: EdgeInsets.symmetric(vertical: height * 0.12, horizontal: 10),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppThemes.secondaryColor1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        content: Center(child: Text(state.message)),
                      ),
                    );
                  }
                  if (state is AuthSuccessState) {
                    Modular.to.navigate('/home/');
                  }
                  if (state is AuthSignOutState) {
                    Modular.to.navigate('/');
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return AppButton(
                    showBorder: true,
                    width: width,
                    primaryColor: Colors.black,
                    widget: const Text(
                      "G",
                      style: TextStyle(fontSize: 30),
                    ),
                    onTap: () => authBloc.add(GoogleSignInEvent()),
                    text: "Sua Conta do Google",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
