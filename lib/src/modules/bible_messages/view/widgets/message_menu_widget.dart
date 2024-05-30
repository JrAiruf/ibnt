// ignore_for_file: must_be_immutable
import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

class MessageMenuWidget extends StatefulWidget {
  MessageMenuWidget({required this.getMemberMessagesBloc, super.key});

  GetMemberMessagesBloc getMemberMessagesBloc;
  @override
  State<MessageMenuWidget> createState() => _MessageMenuWidgetState();
}

int _currentIndex = 0;
int _initialPage = 0;
int _seccondPage = 1;

late String _memberId;

Future<void> _setUserData() async {
  final preferences = await SharedPreferences.getInstance();
  final userJson = preferences.getString("user");
  if (userJson != null) {
    final userMap = jsonDecode(userJson);
    _memberId = userMap["id"];
  }
}

PageController controller = PageController(initialPage: _initialPage);

class _MessageMenuWidgetState extends State<MessageMenuWidget> {
  @override
  void initState() {
    super.initState();
    _currentIndex = _initialPage;
    _setUserData().then((value) {
      widget.getMemberMessagesBloc.add(GetMemberMessagesEvent(_memberId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final buttonFontSize = height * 0.025;
    final buttonInnerPadding = height * 0.0041;
    final buttonRowPadding = height * 0.04;

    final cubit = context.read<BibleMessagesFilterCubit>();

    bool firstPageSelected = _currentIndex == _initialPage;
    bool seccondPageSelected = _currentIndex == _seccondPage;
    int transitionDuration = 200;
    Color allMessagesColor = firstPageSelected ? AppThemes.primaryColor1 : Colors.white;
    Color allMessagesTextColor = firstPageSelected ? Colors.white : AppThemes.primaryColor1;
    Color createdMessagesColor = seccondPageSelected ? AppThemes.primaryColor1 : Colors.white;
    Color createdMessagesTextColor = seccondPageSelected ? Colors.white : AppThemes.primaryColor1;
    double radius = 5;
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: buttonRowPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(top: buttonInnerPadding),
                      backgroundColor: allMessagesColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = _initialPage;
                      });
                      controller.animateToPage(
                        _initialPage,
                        duration: Duration(milliseconds: transitionDuration),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Todas",
                      style: TextStyle(
                        fontFamily: "Karma",
                        height: 0,
                        fontSize: buttonFontSize,
                        color: allMessagesTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.01),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(top: buttonInnerPadding),
                      backgroundColor: createdMessagesColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: createdMessagesColor),
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _currentIndex = _seccondPage;
                      });
                      controller.animateToPage(
                        _seccondPage,
                        duration: Duration(milliseconds: transitionDuration),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Criadas",
                      style: TextStyle(fontFamily: "Karma", height: 0, fontSize: buttonFontSize, color: createdMessagesTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder(
            bloc: widget.getMemberMessagesBloc,
            builder: (context, blocState) {
              if (blocState is GetMemberMessagesLoadingState) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (blocState is GetMemberMessagesFailureState) {
                return Center(child: Text(blocState.exception));
              }
              if (blocState is GetMemberMessagesSuccessState) {
                return Expanded(
                  child: BlocBuilder<BibleMessagesFilterCubit, List<BibleMessageEntity>>(
                    bloc: cubit,
                    builder: (context, state) {
                      final messagesList = state.isEmpty ? blocState.messages : state;
                      final createdMessagesList = state.isEmpty
                          ? blocState.messages.where(
                                (message) => message.type == BibleMessageType.created,
                              )
                              .toList()
                          : state
                              .where(
                                (message) => message.type == BibleMessageType.created,
                              )
                              .toList();
                      return Column(
                        children: [
                          AppSearchWidget(
                            onChanged: (value) {
                              cubit.filterBibleMessages(value, blocState.messages);
                            },
                          ),
                          Expanded(
                            child: PageView(
                              controller: controller,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                cubit.loading
                                    ? Container()
                                    : SizedBox(
                                        child: RefreshIndicator(
                                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                                          onRefresh: () async {
                                            widget.getMemberMessagesBloc.add(GetMemberMessagesEvent(_memberId));
                                          },  
                                          child: ListView.builder(
                                            itemCount: messagesList.length,
                                            itemBuilder: (_, i) {
                                              final bibleMessageEntity = messagesList[i];
                                              final bibleMessage = HomeMessageEntity(
                                                title: bibleMessageEntity.title,
                                                content: bibleMessageEntity.content,
                                                messageType: bibleMessageEntity.type,
                                              );
                                              return BibleMessageWidget(
                                                message: bibleMessage,
                                                onTap: () {
                                                  Modular.to.pushNamed('./message', arguments: {"message": bibleMessageEntity});
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                cubit.loading
                                    ? Container()
                                    : SizedBox(
                                        child: RefreshIndicator(
                                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                                          onRefresh: () async {
                                            widget.getMemberMessagesBloc.add(GetMemberMessagesEvent(_memberId));
                                          },  
                                          child: ListView.builder(
                                            itemCount: createdMessagesList.length,
                                            itemBuilder: (_, i) {
                                              final bibleMessageEntity = createdMessagesList[i];
                                              final bibleMessage = HomeMessageEntity(
                                                title: bibleMessageEntity.title,
                                                content: bibleMessageEntity.content,
                                                messageType: bibleMessageEntity.type,
                                              );
                                              return BibleMessageWidget(
                                                message: bibleMessage,
                                                onTap: () {
                                                  Modular.to.pushNamed('./message', arguments: {"message": bibleMessageEntity});
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
