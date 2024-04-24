import 'package:ibnt/src/modules/home/entities/entity_type.dart';
import 'package:ibnt/src/modules/home/entities/home_event_entity.dart';
import 'package:ibnt/src/modules/home/entities/home_message_entity.dart';
import 'package:ibnt/src/modules/home/entities/home_post_entity.dart';
import 'package:ibnt/src/modules/home/entities/time_line_content.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/view/widgets/event_type_widget.dart';
import 'package:ibnt/src/modules/home/view/widgets/message_type_widget.dart';
import 'package:ibnt/src/modules/home/view/widgets/post_type_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<TimeLineContent> timeline = [
  HomeEventEntity(),
  HomePostEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeMessageEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
  HomeEventEntity(),
  HomeEventEntity(),
  HomePostEntity(),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(authBloc: authBloc),
      appBar: AppBarWidget(preferredSize: Size(width, height * 0.08)),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Início",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: timeline.length,
                  itemBuilder: (_, i) {
                    var timeLineData = timeline[i];
                    if (timeLineData.type == EntityType.event) {
                      final event = timeLineData as HomeEventEntity;
                      return EventTypeWidget(event: event);
                    }
                    if (timeLineData.type == EntityType.message) {
                      final message = timeLineData as HomeMessageEntity;
                      return MessageTypeWidget(message: message);
                    }
                    if (timeLineData.type == EntityType.post) {
                      final post = timeLineData as HomePostEntity;
                      return PostTypeWidget(post: post);
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.06),
        child: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed('./add_events'),
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 1),
    );
  }
}
