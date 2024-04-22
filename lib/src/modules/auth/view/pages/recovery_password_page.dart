import 'package:ibnt/src/modules/auth/auth_imports.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => RecoveryPasswordPageState();
}

class RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  bool visible = false;
  bool passwordConfirmationVisible = false;
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldLabel(label: "Código de Verificação"),
                        AppTextField(),
                        const TextFieldLabel(label: "Senha"),
                        AppTextField(
                          visible: visible,
                          passwordField: true,
                          iconTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                        ),
                        const TextFieldLabel(label: "Confirmar Senha"),
                        AppTextField(
                          visible: passwordConfirmationVisible,
                          passwordField: true,
                          iconTap: () {
                            setState(() {
                              passwordConfirmationVisible = !passwordConfirmationVisible;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.025),
                    AppButton(
                      height: 60,
                      width: width,
                      primaryColor: Colors.white,
                      backgroundColor: AppThemes.primaryColor1,
                      fontSize: 18,
                      text: "Recuperar Senha",
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
              "Recuper Senha",
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
