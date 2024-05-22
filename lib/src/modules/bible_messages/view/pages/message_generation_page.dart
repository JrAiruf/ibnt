import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';
import 'package:ibnt/src/shared/widgets/form/app_drop_down.dart';

class MessageGenerationPage extends StatefulWidget {
  const MessageGenerationPage({super.key});

  @override
  State<MessageGenerationPage> createState() => _MessageGenerationPageState();
}

int _pageIndex = 2;

class _MessageGenerationPageState extends State<MessageGenerationPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final buttonFontSize = height * 0.02;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.035;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Mensagens Bíblicas",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              AppDropDown<String>(
                items: const [
                  "Value",
                  "Value 1",
                  "Value 2",
                ],
                fieldLabel: "Versão",
                hintText:"Escolha a versão"
              ),
              SizedBox(height: height * 0.01),
              AppDropDown<String>(
                items: const [
                  "Value",
                ],
                fieldLabel: "Testamento",
                hintText:"Escolha o Testamento"
              ),
              SizedBox(height: height * 0.01),
              AppDropDown<String>(
                items: const [
                  "Value",
                ],
                fieldLabel: "Livro",
                hintText:"Escolha o Livro"
              ),
              const Spacer(),
              SizedBox(height: height * 0.01),
              AppButton(
                primaryColor: Colors.white,
                backgroundColor: AppThemes.primaryColor1,
                fontSize: buttonFontSize,
                text: "Gerar Mensagem Automática",
              ),
              SizedBox(height: height * 0.06),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: _pageIndex),
    );
  }
}
