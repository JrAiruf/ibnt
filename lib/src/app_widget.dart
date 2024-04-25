import 'app_imports.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: AppThemes.primaryColor1,
        floatingActionButtonTheme:  FloatingActionButtonThemeData(
          sizeConstraints: BoxConstraints(
            minHeight:height * 0.08,
            minWidth: width * 0.25,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
