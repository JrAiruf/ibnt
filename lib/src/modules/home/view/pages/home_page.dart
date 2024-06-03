import 'package:ibnt/src/modules/home/blocs/home_bloc/home_bloc.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final homeBloc = context.read<HomeBloc>();
    homeBloc.add(FetchTimelineEvent());
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final homeBloc = context.read<HomeBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.035;
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
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Início",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              BlocBuilder(
                bloc: homeBloc,
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  if (state is HomeSuccessState) {
                    final timeLine = state.timelineEntity.timeline;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: timeLine.length,
                        itemBuilder: (_, i) {
                          var timeLineData = timeLine[i];
                          if (timeLineData.type == EntityType.event) {
                            final event = timeLineData as EventEntity;
                            return EventTypeWidget(event: event);
                          }
                          if (timeLineData.type == EntityType.message) {
                            final message = timeLineData as MessageEntity;
                            return MessageTypeWidget(message: message);
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child: Container(height: height * 0.15, color: AppThemes.secondaryColor1),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.025),
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
