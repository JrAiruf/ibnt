import 'package:ibnt/src/modules/home/home_imports.dart';

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.06,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Column(
              children: [
                Icon(Icons.front_hand_sharp),
                SizedBox(height: 5),
                Text("Glória"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Column(
              children: [
                Icon(Icons.waving_hand_sharp),
                SizedBox(height: 5),
                Text("Aleluia"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Column(
              children: [
                Icon(Icons.sunny),
                SizedBox(height: 5),
                Text("Benção"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
