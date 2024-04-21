import 'package:ibnt/src/modules/auth/auth_imports.dart';

class SendEmailPage extends StatefulWidget {
  const SendEmailPage({super.key});

  @override
  State<SendEmailPage> createState() => SendEmailPageState();
}

class SendEmailPageState extends State<SendEmailPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
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
                    SizedBox(height: height * 0.1),
                    const Text(
                      "Informe o e-mail da sua conta e receba um código \n de verificação para recuperar sua senha.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldLabel(label: "Email"),
                        AppTextField(),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    ButtonWidget(
                      onTap: () => Modular.to.pushNamed('./recovery_password'),
                      height: 60,
                      width: width,
                      primaryColor: Colors.white,
                      backgroundColor: AppThemes.primaryColor1,
                      fontSize: 18,
                      text: "Enviar Código",
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
