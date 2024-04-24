import 'package:ibnt/src/modules/auth/auth_imports.dart';

class SendEmailPage extends StatefulWidget {
  const SendEmailPage({super.key});

  @override
  State<SendEmailPage> createState() => SendEmailPageState();
}

class SendEmailPageState extends State<SendEmailPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    double horizontalPadding = 10;
    double buttonHeight = 60;
    double buttonFontSize = 18;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    LogoComponent(logoHeight: height * 0.15, verticalPadding: height * 0.13),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Informe o e-mail da sua conta e receba um código \n de verificação para recuperar sua senha.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.02),
                          TextFieldLabel(label: "Email"),
                          AppTextField(fieldName: "e-mail"),
                          SizedBox(height: height * 0.02),
                          AppButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Modular.to.pushNamed('./recovery_password');
                              }
                            },
                            height: buttonHeight,
                            width: width,
                            primaryColor: Colors.white,
                            backgroundColor: AppThemes.primaryColor1,
                            fontSize: buttonFontSize,
                            text: "Enviar Código",
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
