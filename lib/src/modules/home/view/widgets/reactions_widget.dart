import 'package:ibnt/src/modules/home/home_imports.dart';

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.11,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.front_hand_sharp,
                  color: Colors.indigo.shade700,
                ),
                const Text("Glória"),
                const Text("0"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.waving_hand_sharp,
                  color: Colors.purpleAccent.shade700,
                ),
                const Text("Aleluia"),
                const Text("0"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.sunny,
                  color: Colors.amber.shade700,
                ),
                const Text("Benção"),
                const Text("0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
