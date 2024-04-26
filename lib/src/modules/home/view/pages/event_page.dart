import 'package:ibnt/src/modules/home/entities/home_event_entity.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/view/widgets/event_type_widget.dart';
import 'package:ibnt/src/shared/widgets/date/app_date_widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.04;
    final iconSize = height * 0.04;
    final labelFontSize = height * 0.025;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nome do Evento",
                    style: TextStyle(
                      fontSize: titleFontSize,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: AppThemes.primaryColor1,
                      size: iconSize,
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.02),
              EventTypeWidget(
                event: HomeEventEntity(),
                editable: true,
              ),
              const AppDateWidget(),
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
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
