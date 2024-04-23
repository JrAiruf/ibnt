// ignore_for_file: must_be_immutable
import 'package:ibnt/src/app_imports.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key, required this.authBloc});
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
            padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: height * 0.2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    onTap: () {},
                    title: const Row(
                      children: [
                        Icon(Icons.person_2_outlined, size: 35),
                        SizedBox(width: 20),
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    onTap: () {},
                    title: const Row(
                      children: [
                        Icon(Icons.file_copy_outlined, size: 35),
                        SizedBox(width: 20),
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
                    title: const Row(
                      children: [
                        Icon(Icons.workspaces_outline, size: 35),
                        SizedBox(width: 20),
                        Text(
                          "Escalas",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => authBloc.add(SignOutEvent()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sair do App",
                        style: TextStyle(fontSize: 25, color: Colors.black),
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
