// ignore_for_file: must_be_immutable
import 'package:ibnt/src/app_imports.dart';

class AppNavBarWidget extends StatefulWidget {
  AppNavBarWidget({required this.pageIndex, super.key});
  int pageIndex;

  @override
  State<AppNavBarWidget> createState() => _AppNavBarWidgetState();
}

class _AppNavBarWidgetState extends State<AppNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: AppThemes.primaryColor1,
      currentIndex: widget.pageIndex,
      unselectedIconTheme: const IconThemeData(color: AppThemes.secondaryColor1),
      unselectedItemColor: AppThemes.secondaryColor1,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(color: AppThemes.primaryColor1),
      selectedLabelStyle: const TextStyle(color: AppThemes.primaryColor1, fontWeight: FontWeight.w600),
      onTap: _setPageIndex,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Postagens",
          icon: Icon(
            Icons.add_circle,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Início",
          icon: Icon(
            Icons.home_sharp,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Mensagens",
          icon: Icon(
            Icons.menu_book_sharp,
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Avisos",
          icon: Icon(
            Icons.dataset,
          ),
        ),
      ],
    );
  }

  _setPageIndex(int value) {
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
  }

}
