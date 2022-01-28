import 'dart:async';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/chat/ChatAudioScreen.dart';
import 'package:UIKit/screens/chat/ChatVideoScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class ChatModel {
  String message, from, timestamp, seenType;

  static final String myId = "myId";
  static final String otherId = "otherId";

  ChatModel(this.message, this.from, this.timestamp, this.seenType);
}

class _ChatScreenState extends State<ChatScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool isExpanded = false, showMenu = false;

  ScrollController? _scrollController;
  TextEditingController? _chatTextController;

  List<String> _simpleChoice = ["Create shortcut", "Clear chat"];
  List<ChatModel> _chatList = [];
  List<Timer> _timers = [];

  bool isChatTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _chatTextController = TextEditingController();
    _scrollController = ScrollController();
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.myId,
        DateTime.now().millisecondsSinceEpoch.toString(), "seen"));
    _chatList.add(ChatModel(Generator.getDummyText(10), ChatModel.otherId,
        DateTime.now().millisecondsSinceEpoch.toString(), "sent"));

    _chatTextController!.addListener(() {
      setState(() {
        isChatTextEmpty = _chatTextController!.text.isEmpty;
      });

    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
    for (Timer timer in _timers) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
                  padding: FxSpacing.top(32),
              color: customAppTheme.bgLayer1,
              child: Column(
                children: [
                  Container(
                    child: appBarWidget(),
                  ),
                  Expanded(
                      child: Container(
                    margin: Spacing.horizontal(16),
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: Spacing.zero,
                      itemCount: _chatList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == 0
                              ? Spacing.only(top: 12, bottom: 6).add(
                                  _chatList[index].from.compareTo(ChatModel.myId) == 0
                                      ? EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width *
                                              0.2)
                                      : EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width *
                                              0.2))
                              : Spacing.only(top: 6, bottom: 6).add(
                                  _chatList[index].from.compareTo(ChatModel.myId) == 0
                                      ? EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.2)
                                      : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2)),
                          alignment: _chatList[index]
                                      .from
                                      .compareTo(ChatModel.myId) ==
                                  0
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: singleChat(index),
                        );
                      },
                    ),
                  )),
                  Container(
                    child: bottomBarWidget(),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget appBarWidget() {
    return Container(
      padding: Spacing.fromLTRB(16, 4, 4, 4),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          boxShadow: [
            BoxShadow(
              color: customAppTheme.shadowColor.withAlpha(160),
              blurRadius: MySize.size8!,
            )
          ],
          border: Border.all(color: customAppTheme.bgLayer3),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(MySize.size16!),
              bottomLeft: Radius.circular(MySize.size16!))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          Container(
            margin: Spacing.left(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
              child: Image(
                image: AssetImage('./assets/images/avatar-2.jpg'),
                width: MySize.size32,
                height: MySize.size32,
              ),
            ),
          ),
          Container(
            margin: Spacing.left(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Zoey Melton",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Text(
                  "Online",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.onBackground,
                      muted: true,
                      fontWeight: 600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatAudioScreen()));
                    },
                    child: Container(
                      padding: Spacing.all(4),
                      child: Icon(
                        MdiIcons.phoneOutline,
                        color: themeData.colorScheme.onBackground,
                        size: MySize.size18,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatVideoScreen()));
                    },
                    child: Container(
                      margin: Spacing.left(8),
                      padding: Spacing.all(4),
                      child: Icon(
                        MdiIcons.videoOutline,
                        color: themeData.colorScheme.onBackground,
                        size: MySize.size22,
                      ),
                    ),
                  ),
                  Container(
                    margin: Spacing.left(4),
                    child: PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return _simpleChoice.map((String choice) {
                          return PopupMenuItem(
                            value: choice,
                            child: Text(choice,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    letterSpacing: 0.15,
                                    color: themeData.colorScheme.onBackground)),
                          );
                        }).toList();
                      },
                      color: customAppTheme.bgLayer1,
                      icon: Icon(
                        MdiIcons.dotsVertical,
                        color: themeData.colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBarWidget() {
    return Container(
      padding: Spacing.fromLTRB(24, 8, 24, 8),
      decoration: BoxDecoration(
        color: customAppTheme.bgLayer1,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MySize.size16!),
            topRight: Radius.circular(MySize.size16!)),
        boxShadow: [
          BoxShadow(
            color: customAppTheme.shadowColor.withAlpha(160),
            blurRadius: MySize.size8!,
          )
        ],
        border: Border.all(color: customAppTheme.bgLayer3),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        onEnd: () {
          setState(() {
            showMenu = isExpanded;
          });
        },
        height: isExpanded ? MySize.getScaledSizeHeight(124) : MySize.size42,
        child: ListView(
          padding: Spacing.zero,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                      if (!showMenu) showMenu = true;
                    });
                  },
                  child: Container(
                    padding: Spacing.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: customAppTheme.bgLayer3, width: 1)),
                    child: Icon(
                      MdiIcons.plus,
                      color: themeData.colorScheme.onBackground.withAlpha(160),
                      size: MySize.size20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: Spacing.left(16),
                    child: TextFormField(
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                          hintText: "Type here",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size40!),
                              ),
                              borderSide: BorderSide(
                                  color: customAppTheme.bgLayer4, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size40!),
                              ),
                              borderSide: BorderSide(
                                  color: customAppTheme.bgLayer4, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size40!),
                              ),
                              borderSide: BorderSide(
                                  color: customAppTheme.bgLayer4, width: 1)),
                          isDense: true,
                          contentPadding: Spacing.fromLTRB(16, 12, 16, 12),
                          filled: true,
                          fillColor: customAppTheme.bgLayer2,
                          ),
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (message) {
                        sendMessage(message);
                      },
                      controller: _chatTextController,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                Container(
                  margin: Spacing.left(16),
                  width: MySize.size38,
                  height: MySize.size38,
                  padding: Spacing.left(isChatTextEmpty? 0 : 4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: customAppTheme.bgLayer3),
                  child: InkWell(
                    onTap: () {
                      sendMessage(_chatTextController!.text);
                    },
                    child: Icon(
                      isChatTextEmpty ? MdiIcons.microphoneOutline:MdiIcons.sendOutline,
                      color: themeData.colorScheme.onBackground.withAlpha(200),
                      size: isChatTextEmpty?  MySize.size20 : MySize.size18,
                    ),
                  ),
                )
              ],
            ),
            showMenu
                ? Container(
                    margin: Spacing.top(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        optionWidget(
                            color: Colors.blue,
                            iconData: MdiIcons.imageOutline,
                            title: "Image"),
                        optionWidget(
                            color: Colors.pink,
                            iconData: MdiIcons.mapMarkerOutline,
                            title: "Location"),
                        optionWidget(
                            color: Colors.orange,
                            iconData: MdiIcons.accountOutline,
                            title: "Contact"),
                        optionWidget(
                            color: Colors.purple,
                            iconData: MdiIcons.fileDocumentOutline,
                            title: "File"),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget optionWidget({IconData? iconData, required Color color, String title = ""}) {
    return Column(
      children: [
        Container(
          padding: Spacing.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withAlpha(40),
          ),
          child: Icon(
            iconData,
            color: color,
            size: MySize.size22,
          ),
        ),
        Container(
          margin: Spacing.top(4),
          child: Text(
            title,
            style: AppTheme.getTextStyle(themeData.textTheme.caption,
                fontSize: 12,
                color: themeData.colorScheme.onBackground,
                fontWeight: 600),
          ),
        )
      ],
    );
  }

  Widget singleChat(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      return Container(
          padding: Spacing.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            border: Border.all(color: customAppTheme.bgLayer4, width: 1),
            borderRadius: makeChatBubble(index),
          ),
          child: Text(
            _chatList[index].message,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                color: _chatList[index].seenType == "seen"
                    ? themeData.colorScheme.onBackground
                    : themeData.colorScheme.onBackground.withAlpha(150),
                letterSpacing: 0.1,
                fontWeight: _chatList[index].seenType == "seen" ? 500 : 600),
            overflow: TextOverflow.fade,
          ));
    } else {
      return Container(
          padding: Spacing.fromLTRB(16, 10, 16, 10),
          decoration: BoxDecoration(
            color: Color(0xff4d7af7),
            borderRadius: makeChatBubble(index),
          ),
          child: Text(
            _chatList[index].message,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                color: themeData.colorScheme.onPrimary, letterSpacing: 0.1),
            overflow: TextOverflow.fade,
          ));
    }
  }

  BorderRadius makeChatBubble(int index) {
    if (_chatList[index].from.compareTo(ChatModel.myId) == 0) {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) == 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(0));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(0));
      }
    } else {
      if (index != 0) {
        if (_chatList[index - 1].from.compareTo(ChatModel.myId) != 0) {
          return BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8));
        } else {
          return BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8));
        }
      } else {
        return BorderRadius.only(
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8));
      }
    }
  }

  String getStringTimeFromMilliseconds(String timestamp) {
    try {
      int time = int.parse(timestamp);
      var date = DateTime.fromMillisecondsSinceEpoch(time);
      int hour = date.hour, min = date.minute;
      if (hour > 12) {
        if (min < 10) {
          return (hour - 12).toString() + ":0" + min.toString() + " pm";
        } else {
          return (hour - 12).toString() + ":" + min.toString() + " pm";
        }
      } else {
        if (min < 10) {
          return (hour).toString() + ":0" + min.toString() + " am";
        } else {
          return (hour).toString() + ":" + min.toString() + " am";
        }
      }
    } catch (e) {
      return "";
    }
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _chatTextController!.clear();
        _chatList.add(ChatModel(message, ChatModel.myId,
            DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
        startTimer(_chatList.length - 1, message);
      });
      scrollToBottom(isDelayed: true);
    }
  }

  void startTimer(int index, String message) {
    print(index);
    const twoSec = Duration(seconds: 2);
    const threeSec = Duration(seconds: 3);

    Timer timerSeen = Timer.periodic(
        twoSec,
        (Timer timer) => {
              timer.cancel(),
              setState(() {
                _chatList[index].seenType = "seen";
              })
            });
    _timers.add(timerSeen);
    Timer timer = Timer.periodic(
        threeSec, (Timer timer) => {timer.cancel(), sentFromOther(message)});
    _timers.add(timer);
  }

  void sentFromOther(String message) {
    setState(() {
      _chatList.add(ChatModel(message, ChatModel.otherId,
          DateTime.now().millisecondsSinceEpoch.toString(), "sent"));
      scrollToBottom(isDelayed: true);
    });
  }

  scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future.delayed(Duration(milliseconds: delay), () {
      _scrollController!.animateTo(_scrollController!.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
