import 'package:ibnt/src/modules/auth/auth_imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool visible = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double buttonHeight = 60;
    double buttonFontSize = 18;
    double horizontalPadding = 10;
    double mainHeightSpacing = height * 0.015;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoComponent(logoHeight: height * 0.15, verticalPadding: height * 0.13),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldLabel(label: "E-mail"),
                      AppTextField(fieldName: "e-mail"),
                      TextFieldLabel(label: "Senha"),
                      AppTextField(
                        fieldName: "campo senha",
                        iconTap: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        obscureText: visible,
                        passwordField: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Modular.to.pushNamed('./send_email'),
                            child: const Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            //LOGIN LOGIC WILL BE IMPLEMENTED HERE
                            log("Válido!");
                          }
                        },
                        height: buttonHeight,
                        width: width,
                        primaryColor: Colors.white,
                        backgroundColor: AppThemes.primaryColor1,
                        fontSize: buttonFontSize,
                        text: "Entrar",
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Modular.to.pushNamed('./register'),
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: mainHeightSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
