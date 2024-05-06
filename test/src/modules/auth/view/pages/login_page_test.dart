import 'package:ibnt/src/modules/auth/auth_imports.dart';
import 'package:mocktail/mocktail.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {}

void main() {
  late IAuthRepository repository;
  setUp(
    () {
      repository = AuthRepositoryMock();
    },
  );
  group(
    "AuthOptionsPage should",
    () {
      testWidgets("be displayed afeter splash screen", (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
            create: (context) => AuthBloc(repository),
            child: const AuthOptionsPage(),
          ),
        ));
        await tester.pump();
        expect(find.byKey(const Key("options_page_logo_widget")), findsOneWidget);
      });
      testWidgets("contain button to redirect user to login page", (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
            create: (context) => AuthBloc(repository),
            child: const AuthOptionsPage(),
          ),
        ));
        await tester.pump();
        expect(find.byKey(const Key("login_page_redirection_button")), findsOneWidget);
      });
      testWidgets("contain button to social login", (tester) async {
        await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
            create: (context) => AuthBloc(repository),
            child: const AuthOptionsPage(),
          ),
        ));
        await tester.pump();
        expect(find.byKey(const Key("social_login_button")), findsOneWidget);
      });
    },
  );
}
