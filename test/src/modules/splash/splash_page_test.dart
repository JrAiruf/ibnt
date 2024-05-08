import 'package:ibnt/src/modules/splash/splash_imports.dart';

void main() {
  testWidgets('Should be displayed as soon as the app starts', (tester) async {
    await tester.pumpWidget(ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key("logo_widget")), findsOneWidget);
  });
}
