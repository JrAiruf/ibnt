// ignore_for_file: must_be_immutable
import 'package:ibnt/src/app_imports.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key, required this.authBloc});
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final menuFontSize = height * 0.045;
    final menuHorizontalPadding = height * 0.01;
    final verticalDrawerPdding = height * 0.07;
    final horizontalDrawerPdding = width * 0.035;
    final verticalTilePadding = width * 0.045;
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthSignOutState) {
          Modular.to.navigate('/');
        }
      },
      builder: (context, state) {
        return Drawer(
          backgroundColor: Colors.white,
          width: width * 0.75,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: verticalDrawerPdding, horizontal: horizontalDrawerPdding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalTilePadding,horizontal: menuHorizontalPadding),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: menuFontSize,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
                  child: ListTile(
                    onTap: () {},
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person_2_outlined, size: 35),
                        Text(
                          "Perfil",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalTilePadding),
                  child: ListTile(
                    onTap: () {},
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.file_copy_outlined, size: 35),
                        Text(
                          "Departamentos",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.workspaces_outline, size: 35),
                    title: const Text(
                      "Escalas",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  // onPressed: () => authBloc.add(SignOutEvent()),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sair do App",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
