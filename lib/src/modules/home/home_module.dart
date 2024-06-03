import 'package:ibnt/src/modules/home/blocs/home_bloc/home_bloc.dart';
import 'package:ibnt/src/modules/home/data/home_repository.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';
import 'package:ibnt/src/modules/home/interfaces/ihome_repository.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthModule(),
      ];
  @override
  void binds(Injector i) {
    i.addSingleton<IHomeRepository>(HomeRepository.new);
    i.add(HomeBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => Modular.get<HomeBloc>()),
      ], child: const HomePage()),
    );
    r.child(
      '/add_events',
      child: (_) => const AddEventsPage(),
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
