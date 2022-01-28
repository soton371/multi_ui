import 'dart:async';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseVideoScreen extends StatefulWidget {
  @override
  _CourseVideoScreenState createState() => _CourseVideoScreenState();
}

class _CourseVideoScreenState extends State<CourseVideoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool isPlaying = false;

  Timer? _timer;
  int _duration = 200, repeatType = 0;
  int _position = 0;
  String _time = "0:00";

  convertTime() {
    int hour = (_position / 3600).floor();
    int minute = ((_position - 3600 * hour) / 60).floor();
    int second = (_position - 3600 * hour - 60 * minute);
    String time = "";
    if (second < 10) {
      time += minute.toString() + ":0" + second.toString();
    } else {
      time += minute.toString() + ":" + second.toString();
    }

    setState(() {
      _time = time;
    });
  }

  _onTrackDurationChange(double value) {
    setState(() {
      _position = value.floor();
    });
    convertTime();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_position >= (_duration - 1)) {
            timer.cancel();
            _position += 1;
            convertTime();
            isPlaying = false;
            _animationController.reverse();
          } else {
            _position += 1;
            convertTime();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    startTimer();
  }



  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer3,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                      size: MySize.size24,
                    ),
                  ),
                  title: Text(
                    "UI - Intro",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer3,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size16!),
                                  bottomRight: Radius.circular(MySize.size16!))),
                          padding: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!)),
                                      child: Image(
                                          image: AssetImage(
                                              './assets/images/course/class-l1.jpg'))),
                                  Positioned(
                                    bottom: MySize.size12,
                                    right: MySize.size12,
                                    child: Icon(
                                      MdiIcons.cropFree,
                                      color: Colors.white,
                                      size: MySize.size20,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: MySize.size16!),
                                        child: Text(_time,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 500))),
                                    Expanded(
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 2.5,
                                          thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: MySize.size7),
                                        ),
                                        child: Slider(
                                          value: _position.toDouble(),
                                          onChanged: _onTrackDurationChange,
                                          min: 0,
                                          max: _duration.toDouble(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: MySize.size16!),
                                        child: Text("3:20",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 500))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer2,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size16!),
                                  bottomRight: Radius.circular(MySize.size16!))),
                          padding: Spacing.fromLTRB(24, 16, 24, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "1.0 Introduction of UI Designing",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Container(
                                            margin: Spacing.top(4),
                                            child: Text(
                                              "120 Views  \u2022  20 mins ago",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  muted: true),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      MdiIcons.chevronDown,
                                      color: themeData.colorScheme.onBackground,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.thumbUp,
                                          color: themeData.colorScheme.primary,
                                          size: MySize.size22,
                                        ),
                                        Text(
                                          "16 Likes",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontSize: 12,
                                              color:
                                              themeData.colorScheme.primary,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.messageReplyText,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          size: MySize.size22,
                                        ),
                                        Text(
                                          "Comment",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500,
                                              fontSize: 12,
                                              letterSpacing: 0),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.download,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          size: MySize.size24,
                                        ),
                                        Text(
                                          "Download",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500,
                                              letterSpacing: 0),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: Spacing.fromLTRB(24, 16, 24, 0),
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Next",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                        themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.top(16),
                                  child: singleLecture(
                                      time: "6:21",
                                      title: "Intro",
                                      info: "Start intro"),
                                ),
                                Container(
                                  margin: Spacing.top(16),
                                  child: singleLecture(
                                      time: "12:15",
                                      title: "Lesson 1",
                                      info: "Question type 1"),
                                ),
                                Container(
                                  margin: Spacing.top(16),
                                  child: singleLecture(
                                      time: "10:30",
                                      title: "Lesson 2",
                                      info: "Question type 2"),
                                ),
                                Container(
                                  margin: Spacing.top(16),
                                  child: singleLecture(
                                      time: "22:48",
                                      title: "Lesson 3",
                                      info: "Question type 3"),
                                ),
                                Container(
                                  margin: Spacing.top(24),
                                  child: Center(
                                    child: Text(
                                      "show all".toUpperCase(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          fontWeight: 600),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget singleLecture({required String title, required String info, required String time}) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            padding: Spacing.all(10),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary.withAlpha(40),
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
            child: Icon(
              MdiIcons.play,
              color: themeData.colorScheme.primary,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    info,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500,
                        muted: true),
                  ),
                ],
              ),
            ),
          ),
          Text(
            time,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground,
                muted: true,
                fontWeight: 600),
          )
        ],
      ),
    );
  }
}

