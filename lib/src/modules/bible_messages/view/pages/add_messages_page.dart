import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class AddMessagesPage extends StatefulWidget {
  const AddMessagesPage({super.key});

  @override
  State<AddMessagesPage> createState() => _AddMessagesPageState();
}

class _AddMessagesPageState extends State<AddMessagesPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final pageCenterSpacing = height * 0.4;
    final iconSize = height * 0.03;
    final titleFontSize = height * 0.035;
    final textFontSize = height * 0.017;
    final buttonFontSize = height * 0.02;
    final buttonPadding = height * 0.015;

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
              const Spacer(),
              Text(
                "Aqui você pode criar novas mensagens e abençoar os irmãos através da palavra, ou gerar uma nova mensagem bíblica automática. Após a criação, sua mensagem poderá ser compartilhada.",
                style: TextStyle(fontSize: textFontSize, height: 0),
              ),
              SizedBox(height: pageCenterSpacing),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton(
                    showBorder: true,
                    primaryColor: AppThemes.primaryColor1,
                    widget: Icon(Icons.email_outlined, color: AppThemes.primaryColor1, size: iconSize),
                    fontSize: buttonFontSize,
                    text: "Gerar Mensagem",
                    onTap: () => Modular.to.pushNamed('./message_generation'),
                  ),
                  SizedBox(height: buttonPadding),
                  AppButton(
                    primaryColor: Colors.white,
                    backgroundColor: AppThemes.primaryColor1,
                    widget: Icon(Icons.note_add_outlined, color: Colors.white, size: iconSize),
                    fontSize: buttonFontSize,
                    text: "Criar Mensagem",
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 2),
    );
  }
}
