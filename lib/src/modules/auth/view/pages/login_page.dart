import 'package:ibnt/src/modules/auth/auth_imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.15),
                LogoComponent(logoHeight: height * 0.15),
                SizedBox(height: height * 0.15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFieldLabel(label: "E-mail"),
                    AppTextField(),
                    const TextFieldLabel(label: "Senha"),
                    AppTextField(
                      iconTap: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      visible: visible,
                      passwordField: true,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                ButtonWidget(
                  height: 60,
                  width: width,
                  primaryColor: Colors.white,
                  backgroundColor: AppThemes.primaryColor1,
                  fontSize: 18,
                  text: "Entrar",
                ),
                SizedBox(height: height * 0.12),
                TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('./register');
                  },
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
