import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';
import 'package:ibnt/src/modules/bible_messages/view/pages/create_message_page.dart';

class BibleMessagesModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addSingleton<IBibleMessagesRepository>(BibleMessagesRepository.new);
    i.add(BibleMessagesBloc.new);
    i.add(BibleBookCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/:memberId',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<AuthBloc>(),
              child: const MessagesPage(),
            ));
    r.child('/add_messages/:memberId',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<AuthBloc>(),
              child: const AddMessagesPage(),
            ));
    r.child('/message_generation/:memberId',
        child: (_) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => Modular.get<AuthBloc>()),
              BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
              BlocProvider(create: (context) => Modular.get<BibleBookCubit>()),
            ], child: const MessageGenerationPage()));
    r.child('/create_message/:memberId',
        child: (_) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => Modular.get<AuthBloc>()),
              BlocProvider(create: (context) => Modular.get<BibleMessagesBloc>()),
            ], child: const CreateMessagePage()));
    r.child('/message',
        child: (_) => BlocProvider(
              create: (context) => Modular.get<AuthBloc>(),
              child: MessagePage(message: r.args.data["message"]),
            ));
  }
}
