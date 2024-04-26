import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class AddWarningsPage extends StatefulWidget {
  const AddWarningsPage({super.key});

  @override
  State<AddWarningsPage> createState() => _AddWarningsPageState();
}

class _AddWarningsPageState extends State<AddWarningsPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final labelFontSize = height * 0.025;
    final pagePadding = width * 0.035;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: ListView(
            children: [
              const MonthTitleWidget(),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldLabel(label: "Título", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) {},
                    ),
                    TextFieldLabel(label: "Descrição", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) {},
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
              const AppDateWidget(),
              const AnnouncementCheckBox(),
              SizedBox(height: height * 0.025),
              AppButton(
                onTap: () {},
                height: 60,
                width: width,
                primaryColor: Colors.white,
                backgroundColor: AppThemes.primaryColor1,
                fontSize: 18,
                text: "Adicionar",
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 3),
    );
  }
}
