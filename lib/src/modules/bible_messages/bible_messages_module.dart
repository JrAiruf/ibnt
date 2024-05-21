import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class BibleMessagesModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const MessagesPage()));
    r.child('/add_messages', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const AddMessagesPage()));
    r.child('/message', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const MessagePage()));
    r.child('/new_message', child: (_) => BlocProvider(create: (context) => Modular.get<AuthBloc>(), child: const NewMessagePage()));
  }
}