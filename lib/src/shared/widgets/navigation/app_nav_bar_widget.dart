import '../../../modules/auth/auth_imports.dart';

class AppNavBarWidget extends StatefulWidget {
  AppNavBarWidget({required this.pageIndex, super.key});
  int pageIndex;

  @override
  State<AppNavBarWidget> createState() => _AppNavBarWidgetState();
}

class _AppNavBarWidgetState extends State<AppNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: PageController(initialPage: 1),
      builder: (_, c) {
        return BottomNavigationBar(
          selectedItemColor: AppThemes.primaryColor1,
          currentIndex: widget.pageIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          selectedIconTheme: const IconThemeData(color: AppThemes.primaryColor1),
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedLabelStyle: const TextStyle(color: AppThemes.primaryColor1, fontWeight: FontWeight.w600),
          onTap: (value) {
            setState(() {
              widget.pageIndex = value;
            });
            switch (value) {
              case 0:
                Modular.to.navigate('/posts/');
                break;
              case 1:
                Modular.to.navigate('/home/');
                break;
              case 2:
                Modular.to.navigate('/bible_messages/');
                break;
              case 3:
                Modular.to.navigate('/warnings/');
                break;
            }
          },
          iconSize: 30,
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label: "Postagens",
              icon: Icon(
                Icons.add_circle,
              ),
            ),
            BottomNavigationBarItem(
              label: "Início",
              icon: Icon(
                Icons.home_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: "Mensagens",
              icon: Icon(
                Icons.menu_book_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: "Avisos",
              icon: Icon(
                Icons.dataset,
              ),
            ),
          ],
        );
      },
    );
  }
}
