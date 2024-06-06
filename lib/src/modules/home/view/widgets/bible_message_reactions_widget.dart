// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:ibnt/src/modules/home/blocs/reactions_bloc/reactions_bloc.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

class BibleMessageReactionsWidget extends StatefulWidget {
  BibleMessageReactionsWidget({
    Key? key,
    required this.memberId,
    this.bibleMessageReaction,
  }) : super(key: key);

  BibleMessageReaction? bibleMessageReaction;
  final String memberId;

  @override
  State<BibleMessageReactionsWidget> createState() => _BibleMessageReactionsWidgetState();
}

class _BibleMessageReactionsWidgetState extends State<BibleMessageReactionsWidget> {
  @override
  Widget build(BuildContext context) {
    final reactionsBloc = context.read<ReactionsBloc>();

    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final titleFontSize = height * 0.012;
    final contentPadding = height * 0.007;
    return SizedBox(
      height: height * 0.05,
      width: width,
      child: BlocBuilder(
        bloc: reactionsBloc,
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Align(
                  child: InkWell(
                    splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(contentPadding),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Icon(
                              Icons.front_hand_sharp,
                              color: AppThemes.secondaryColor1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Glória",
                              style: TextStyle(
                                fontSize: titleFontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(contentPadding),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Icon(
                            Icons.waving_hand_sharp,
                            color: AppThemes.secondaryColor1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Aleluia",
                            style: TextStyle(
                              fontSize: titleFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: AppThemes.primaryColor1.withOpacity(0.4),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(contentPadding),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Icon(
                            Icons.brightness_auto_outlined,
                            color: AppThemes.secondaryColor1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Abençoado",
                            style: TextStyle(
                              fontSize: titleFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
