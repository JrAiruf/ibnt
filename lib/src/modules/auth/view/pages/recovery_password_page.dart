import 'package:ibnt/src/modules/auth/auth_imports.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => RecoveryPasswordPageState();
}

class RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  bool visible = false;
  bool passwordConfirmationVisible = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double buttonHeight = 60;
    double buttonFontSize = 18;
    double horizontalPadding = 10;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: ListView(
                  children: [
                    LogoComponent(logoHeight: height * 0.15,verticalPadding: height * 0.085),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldLabel(label: "Código de Verificação"),
                          AppTextField(),
                          TextFieldLabel(label: "Senha"),
                          AppTextField(
                            visible: visible,
                            passwordField: true,
                            iconTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                          ),
                          TextFieldLabel(label: "Confirmar Senha"),
                          AppTextField(
                            visible: passwordConfirmationVisible,
                            passwordField: true,
                            iconTap: () {
                              setState(() {
                                passwordConfirmationVisible = !passwordConfirmationVisible;
                              });
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          AppButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                log("Válido!");
                              }
                            },
                            height: buttonHeight,
                            width: width,
                            primaryColor: Colors.white,
                            backgroundColor: AppThemes.primaryColor1,
                            fontSize: buttonFontSize,
                            text: "Recuperar Senha",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: 10,
            child: const Text(
              "Recuperar Senha",
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
