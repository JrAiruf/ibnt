import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pagePadding = width * 0.035;
    final titleFontSize = height * 0.035;
    final buttonFontSize = height * 0.025;
    final buttonInnerPadding = height * 0.01;
    double radius = 5;
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
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selected ? AppThemes.primaryColor1 : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius),
                        ),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: buttonInnerPadding),
                          child: Text(
                            "Todas",
                            style: TextStyle(
                              fontFamily: "Karma",
                              height: 0,
                              fontSize: buttonFontSize,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.01),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppThemes.primaryColor1),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: buttonInnerPadding),
                          child: Text(
                            "Criadas",
                            style: TextStyle(
                              fontFamily: "Karma",
                              height: 0,
                              fontSize: buttonFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_messages'),
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 2),
    );
  }
}
