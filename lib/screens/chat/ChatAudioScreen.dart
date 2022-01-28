import 'dart:async';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatAudioScreen extends StatefulWidget {
  @override
  _ChatAudioScreenState createState() => _ChatAudioScreenState();
}

class _ChatAudioScreenState extends State<ChatAudioScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  late Timer _timer;
  int _nowTime = 0;
  String timeText = "00 : 00";

  bool isAudioOn = false, isVideoOn = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          _nowTime = _nowTime + 1;
          timeText = Generator.getTextFromSeconds(time: _nowTime);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: topWidget(),
                  ),
                  Expanded(
                    child: Container(
                      padding: Spacing.all(24),
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: [
                          singleCall(
                              name: "You",
                              image: './assets/images/avatar-1.jpg',
                              cameraOn: isVideoOn,
                              micOn: isAudioOn),
                          singleCall(
                              name: "Zaine Sumner",
                              image: './assets/images/avatar-2.jpg',
                              micOn: true),
                          singleCall(
                              name: "Kaja Langley",
                              image: './assets/images/avatar-3.jpg',
                              cameraOn: true),
                          singleCall(
                              name: "Clifford Carey",
                              image: './assets/images/avatar-4.jpg',
                              cameraOn: true,
                              micOn: true),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: bottomWidget(),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget singleCall(
      {required String name,
      required String image,
      bool micOn = false,
      bool cameraOn = false}) {
    return Container(
      width: (MySize.safeWidth! - 74) / 2,
      height: MySize.getScaledSizeHeight(180),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(
            Radius.circular(MySize.size4!),
          ),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor.withAlpha(160),
                blurRadius: MySize.size4!)
          ],
          border: Border.all(color: customAppTheme.bgLayer4, width: 1.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size34)),
            child: Image(
              image: AssetImage(image),
              height: MySize.size68,
              width: MySize.size68,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              name,
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Container(
            margin: Spacing.top(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  micOn ? MdiIcons.microphoneOutline : MdiIcons.microphoneOff,
                  color: micOn
                      ? themeData.colorScheme.onBackground
                      : themeData.colorScheme.onBackground.withAlpha(180),
                  size: MySize.size22,
                ),
                Container(
                  margin: Spacing.left(8),
                  child: Icon(
                      cameraOn
                          ? MdiIcons.videoOutline
                          : MdiIcons.videoOffOutline,
                      color: cameraOn
                          ? themeData.colorScheme.onBackground
                          : themeData.colorScheme.onBackground.withAlpha(180),
                      size: MySize.size22),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topWidget() {
    return Container(
      height: MySize.size60,
      decoration: BoxDecoration(
        color: customAppTheme.bgLayer1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MySize.size16!),
          bottomRight: Radius.circular(MySize.size16!),
        ),
        border: Border.all(width: 1, color: customAppTheme.bgLayer4),
      ),
      padding: Spacing.fromLTRB(24, 0, 24, 0),
      child: Center(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                size: MySize.size24,
                color: themeData.colorScheme.onBackground,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Group Call",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Text(
                      timeText,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color: themeData.colorScheme.onBackground),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(
                MdiIcons.accountPlusOutline,
                color: themeData.colorScheme.onBackground,
                size: MySize.size22,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomWidget() {
    return Container(
      height: MySize.size68,
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MySize.size16!),
            topRight: Radius.circular(MySize.size16!),
          ),
          border: Border.all(width: 1, color: customAppTheme.bgLayer4),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor, blurRadius: MySize.size4!)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isAudioOn = !isAudioOn;
              });
            },
            child: Container(
              padding: Spacing.all(12),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.primary
                      .withAlpha(isAudioOn ? 40 : 0),
                  shape: BoxShape.circle),
              child: Icon(
                isAudioOn ? MdiIcons.microphoneOutline : MdiIcons.microphoneOff,
                color: isAudioOn
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground.withAlpha(200),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isVideoOn = !isVideoOn;
              });
            },
            child: Container(
              padding: Spacing.all(12),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.primary
                      .withAlpha(isVideoOn ? 40 : 0),
                  shape: BoxShape.circle),
              child: Icon(
                isVideoOn ? MdiIcons.videoOutline : MdiIcons.videoOffOutline,
                color: isVideoOn
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground.withAlpha(200),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: Spacing.all(12),
              decoration: BoxDecoration(
                  color: customAppTheme.colorError, shape: BoxShape.circle),
              child: Icon(
                MdiIcons.phoneHangupOutline,
                color: customAppTheme.onError,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
