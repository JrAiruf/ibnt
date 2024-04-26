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
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      selectedIconTheme: const IconThemeData(color: AppThemes.primaryColor1),
      selectedLabelStyle: const TextStyle(color: AppThemes.primaryColor1, fontWeight: FontWeight.w600),
      onTap: _setPageIndex,
      iconSize: 30,
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
          backgroundColor: Colors.white,
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
