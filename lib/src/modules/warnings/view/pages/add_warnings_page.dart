import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class AddWarningsPage extends StatefulWidget {
  const AddWarningsPage({super.key});

  @override
  State<AddWarningsPage> createState() => _AddWarningsPageState();
}

class _AddWarningsPageState extends State<AddWarningsPage> {
  final formKey = GlobalKey<FormState>();
  final _memberId = Modular.args.params["memberId"];
  final newAnnouncement = AnnouncementEntity(
    id: "",
    title: "",
    memberId: "",
    description: "",
    dateString: "",
    fixedWarning: false,
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final labelFontSize = height * 0.025;
    final pagePadding = width * 0.035;

    final currentMonth = DateTime.now().month;
    final createAnnouncementBloc = context.read<CreateAnnouncementBloc>();

    final cubit = context.read<AnnouncementDateCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          child: ListView(
            children: [
              MonthTitleWidget(month: currentMonth),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldLabel(label: "Título", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) => newAnnouncement.title = value,
                    ),
                    TextFieldLabel(label: "Descrição", fontSize: labelFontSize),
                    AppTextField(
                      onChanged: (value) => newAnnouncement.description = value,
                    ),
                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
              const AppDateWidget(),
              const AnnouncementCheckBox(),
              SizedBox(height: height * 0.025),
              BlocConsumer(
                bloc: createAnnouncementBloc,
                listener: (context, state) {
                  if (state is CreateAnnouncementFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        margin: EdgeInsets.symmetric(vertical: height * 0.116, horizontal: 10),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppThemes.secondaryColor1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        content: Center(
                          child: Text(
                            state.exception,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is CreateAnnouncementLoadingState) {
                    Modular.to.navigate('/auth/home/warnings/$_memberId');
                  }
                },
                builder: (context, state) {
                  if (state is CreateAnnouncementLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return AppButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final day = "${cubit.state.day}";
                        final month = "${cubit.state.month}";
                        final year = "${cubit.state.year}";
                        newAnnouncement.dateString = "$year/$month/$day";
                        newAnnouncement.memberId = _memberId;

                        createAnnouncementBloc.add(CreateAnnouncementEvent(newAnnouncement));
                      }
                    },
                    height: 60,
                    width: width,
                    primaryColor: Colors.white,
                    backgroundColor: AppThemes.primaryColor1,
                    fontSize: 18,
                    text: "Adicionar",
                  );
                },
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
