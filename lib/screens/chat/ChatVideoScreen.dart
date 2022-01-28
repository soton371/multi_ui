import 'dart:async';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatVideoScreen extends StatefulWidget {
  @override
  _ChatVideoScreenState createState() => _ChatVideoScreenState();
}

class _ChatVideoScreenState extends State<ChatVideoScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  late Timer _timer;
  int _nowTime = 0;
  String timeText="00 : 00";

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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('./assets/images/chat/video-bg-1.jpg'),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: MySize.size48,
                    left: MySize.size24,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: Spacing.all(8),
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1.withAlpha(120),
                            borderRadius: BorderRadius.all(
                              Radius.circular(MySize.size8!),
                            ),
                            border: Border.all(
                                width: 1, color: customAppTheme.bgLayer1)),
                        child: Icon(
                          MdiIcons.chevronLeft,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MySize.size48,
                    right: MySize.size24,
                    child: secondCall(),
                  ),
                  Positioned(
                    bottom: MySize.size0,
                    left: MySize.size0,
                    right: MySize.size0,
                    child: Container(
                      margin: Spacing.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          timeWidget(),
                          bottomWidget(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget secondCall() {
    return Container(
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer4.withAlpha(130),
          borderRadius: BorderRadius.all(
            Radius.circular(MySize.size4!),
          ),
          border: Border.all(color: Colors.transparent, width: MySize.size3)),
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(
            Radius.circular(MySize.size4!),
          ),
          child: Stack(
            children: <Widget>[
              Image(
                image: AssetImage(
                  './assets/images/chat/video-bg-2.jpg',
                ),
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
              Positioned(
                right: MySize.size8,
                top: MySize.size8,
                child: Icon(
                  MdiIcons.arrowTopRight,
                  size: MySize.size20,
                  color: themeData.colorScheme.primary,
                ),
              )
            ],
          )),
    );
  }

  Widget bottomWidget() {
    return Center(
      child: Container(
        padding: Spacing.all(12),
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1.withAlpha(236),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size64!)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: Spacing.bottom(8),
              padding: Spacing.all(10),
              decoration: BoxDecoration(
                  color: customAppTheme.bgLayer1,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.shadowColor,
                        blurRadius: MySize.size6!,
                        spreadRadius: 1,
                        offset: Offset(0, MySize.size2))
                  ]),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isAudioOn = !isAudioOn;
                  });
                },
                child: Icon(
                  isAudioOn
                      ? MdiIcons.microphoneOutline
                      : MdiIcons.microphoneOff,
                  size: MySize.size26,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
            ),
            Container(
              padding: Spacing.all(10),
              margin: Spacing.vertical(8),
              decoration: BoxDecoration(
                  color: customAppTheme.bgLayer1,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.shadowColor,
                        blurRadius: MySize.size6!,
                        spreadRadius: 1,
                        offset: Offset(0, MySize.size2))
                  ]),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVideoOn = !isVideoOn;
                  });
                },
                child: Icon(
                  isVideoOn ? MdiIcons.videoOutline : MdiIcons.videoOffOutline,
                  color: themeData.colorScheme.onBackground,
                  size: MySize.size26,
                ),
              ),
            ),
            Container(
              padding: Spacing.all(10),
              margin: Spacing.top(8),
              decoration: BoxDecoration(
                  color: customAppTheme.colorError,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.colorError.withAlpha(100),
                        blurRadius: MySize.size6!,
                        spreadRadius: 1,
                        offset: Offset(0, MySize.size2))
                  ]),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.phoneHangupOutline,
                  color: customAppTheme.onError,
                  size: MySize.size26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeWidget(){
    return Container(
      padding: Spacing.fromLTRB(16,12,16,12),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(70),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size32!))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MySize.size8,
            height: MySize.size8,
            decoration: BoxDecoration(
                color: customAppTheme.colorError,
                shape: BoxShape.circle
            ),
          ),
          Container(
            margin: Spacing.left(12),
            child: Text(
              timeText,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: Colors.white, letterSpacing: 0.4,fontWeight: 600),
            ),
          ),
        ],
      ),
    );
  }
}
