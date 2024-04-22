import 'package:ibnt/src/app_imports.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key, required super.preferredSize}) : super(child: Container());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset("assets/images/logo_image.jpg"),
            const SizedBox(width: 15),
            const Text(
              "IBNT",
              style: TextStyle(
                fontFamily: 'Karma',
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => Modular.to.pushNamed('./notifications'),
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
        ),
      ],
    );
  }
}
