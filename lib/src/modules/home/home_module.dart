import 'package:ibnt/src/modules/home/home_imports.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IHomeRepository>(HomeRepository.new);
    i.addSingleton(UserBloc.new);
    i.add(HomeBloc.new);
    i.add(EventsReactionsBloc.new);
    i.add(BibleMessagesReactionsBloc.new);
    i.add(DateCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => Modular.get<UserBloc>()),
        BlocProvider(create: (context) => Modular.get<HomeBloc>()),
        BlocProvider(create: (context) => Modular.get<EventsReactionsBloc>()),
        BlocProvider(create: (context) => Modular.get<BibleMessagesReactionsBloc>()),
      ], child: HomePage()),
    );
    r.child(
      '/add_events',
      child: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Modular.get<DateCubit>()),
        ],
        child: const AddEventsPage(),
      ),
    );
    r.child(
      '/event',
      child: (_) => const EventPage(),
    );
    r.child(
      '/notifications',
      child: (_) => const NotificationsPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      '/profile',
      child: (_) => const ProfilePage(),
    );
    r.module('/bible_messages', module: BibleMessagesModule(), transition: TransitionType.fadeIn);
    r.module('/warnings', module: WarningsModule(), transition: TransitionType.fadeIn);
    r.module('/posts', module: PostsModule(), transition: TransitionType.fadeIn);
    r.module('/departments', module: DepartmentsModule(), transition: TransitionType.fadeIn);
    r.module('/scheduling', module: SchedulingModule(), transition: TransitionType.fadeIn);
  }
}
