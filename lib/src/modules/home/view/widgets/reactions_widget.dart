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
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.front_hand_sharp,
                  color: AppThemes.primaryColor1,
                ),
                Text("Glória"),
                Text("0"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.waving_hand_sharp,
                  color: AppThemes.secondaryColor1,
                ),
                Text("Aleluia"),
                Text("0"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.sunny,
                  color: AppThemes.secondaryColor1,
                ),
                Text("Benção"),
                Text("0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
