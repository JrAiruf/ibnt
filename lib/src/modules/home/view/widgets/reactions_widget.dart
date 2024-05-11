import 'package:ibnt/src/modules/home/home_imports.dart';

class ReactionsWidget extends StatelessWidget {
  const ReactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final iconSpacing = width * 0.025;

    return SizedBox(
      height: height * 0.11,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.front_hand_sharp,
                  color: AppThemes.secondaryColor1,
                ),
                SizedBox(width: iconSpacing),
                const Text("Glória"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.waving_hand_sharp,
                  color: AppThemes.secondaryColor1,
                ),
                SizedBox(width: iconSpacing),
                const Text("Aleluia"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.brightness_low_outlined,
                  color: AppThemes.secondaryColor1,
                ),
                SizedBox(width: iconSpacing),
                const Text("Abençoado"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
