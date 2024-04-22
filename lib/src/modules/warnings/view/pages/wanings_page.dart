import 'package:ibnt/src/modules/home/home_imports.dart';

class WarningsPage extends StatefulWidget {
  const WarningsPage({super.key});

  @override
  State<WarningsPage> createState() => _WarningsPageState();
}

class _WarningsPageState extends State<WarningsPage> {
  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: Drawer(
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
                onPressed: () {
                  authBloc.add(SignOutEvent());
                  if (authBloc.state is AuthSignOutState) {
                    Modular.to.navigate('/');
                    Navigator.of(context).pop();
                  }
                },
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
      ),
      appBar: AppBarWidget(preferredSize: Size(width, 80)),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.06),
        child: FloatingActionButton.large(
          onPressed: () {},
          backgroundColor: AppThemes.primaryColor1,
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: AppNavBarWidget(pageIndex: 3),
    );
  }
}
