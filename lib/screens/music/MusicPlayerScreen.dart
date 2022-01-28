/*
* File : Music Player
* Version : 1.0.0
* */

import 'dart:async';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;
  late ThemeData themeData;
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
  }

  _onPlay() {
    startTimer();
  }

  _onPause() {
    _timer!.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    if (_timer != null) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  centerTitle: true,
                  title: Text(
                    "Player",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600),
                  ),
                ),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        './assets/images/music/singer-1.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "My Bed on My Mind ".toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "Paul McCartney | Joaquin",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 400,
                                        letterSpacing: 0.3),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 220,
                      child: Stack(
                        children: <Widget>[
                          ClipPath(
                              clipper: _Clipper(),
                              child: Container(
                                color: themeData.colorScheme.background,
                              )),
                          Positioned(
                            bottom: 20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: MySize.size8!),
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          MySize.size28!),
                                                  side: BorderSide.none),
                                              child: InkWell(
                                                splashColor: themeData
                                                    .colorScheme.primary,
                                                child: SizedBox(
                                                    height: MySize.size48,
                                                    width: MySize.size48,
                                                    child: Icon(
                                                      MdiIcons
                                                          .skipPreviousOutline,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground,
                                                      size: MySize.size28,
                                                    )),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                        Hero(
                                          tag: 'music-fab',
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size48!),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: themeData
                                                          .colorScheme.primary
                                                          .withAlpha(42),
                                                      spreadRadius: 1,
                                                      blurRadius: 6,
                                                      offset: Offset(0, 6))
                                                ]),
                                            child: ClipOval(
                                              child: Material(
                                                elevation: 5,
                                                color: themeData
                                                    .colorScheme.primary,
                                                child: InkWell(
                                                  splashColor: Colors.white,
                                                  child: IconButton(
                                                    iconSize: 28,
                                                    icon: AnimatedIcon(
                                                      icon: AnimatedIcons
                                                          .play_pause,
                                                      progress:
                                                          _animationController,
                                                    ),
                                                    onPressed: () {
                                                      if (isPlaying) {
                                                        _animationController
                                                            .reverse();
                                                        _onPause();
                                                        setState(() {
                                                          isPlaying = false;
                                                        });
                                                      } else {
                                                        _animationController
                                                            .forward();
                                                        _onPlay();
                                                        setState(() {
                                                          isPlaying = true;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: MySize.size8!),
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(MySize.size28!),
                                                  side: BorderSide.none),
                                              child: InkWell(
                                                splashColor: themeData
                                                    .colorScheme.primary,
                                                child: SizedBox(
                                                    height: MySize.size48,
                                                    width: MySize.size48,
                                                    child: Icon(
                                                      MdiIcons.skipNextOutline,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground,
                                                      size: MySize.size28,
                                                    )),
                                                onTap: () {},
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: MySize.size16!, right: MySize.size16!, top: MySize.size12!),
                                    child: Row(
                                      children: <Widget>[
                                        ClipOval(
                                          child: Material(
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(MySize.size28!),
                                                side: BorderSide.none),
                                            child: InkWell(
                                              splashColor:
                                                  themeData.colorScheme.primary,
                                              child: SizedBox(
                                                  height: MySize.size36,
                                                  width: MySize.size36,
                                                  child: Icon(
                                                    MdiIcons.shuffle,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    size: 22,
                                                  )),
                                              onTap: () {},
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: MySize.size16!),
                                            child: Text(_time,
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontWeight:500))),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(trackHeight: 2.5),
                                            child: Slider(
                                              value: _position.toDouble(),
                                              onChanged: _onTrackDurationChange,
                                              min: 0,
                                              max: _duration.toDouble(),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(right: MySize.size16!),
                                            child: Text("3:20",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontWeight:500))),
                                        ClipOval(
                                          child: Material(
                                            color: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(MySize.size28!),
                                                side: BorderSide.none),
                                            child: InkWell(
                                              splashColor:
                                                  themeData.colorScheme.primary,
                                              child: SizedBox(
                                                  height: MySize.size36,
                                                  width: MySize.size36,
                                                  child: Icon(
                                                    repeatType == 0
                                                        ? MdiIcons.repeat
                                                        : (repeatType == 1
                                                            ? MdiIcons
                                                                .repeatOnce
                                                            : MdiIcons
                                                                .repeatOff),
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    size: MySize.size22,
                                                  )),
                                              onTap: () {
                                                setState(() {
                                                  repeatType =
                                                      (++repeatType) % 3;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: MySize.size16,
                            left: MySize.size16,
                            child: ClipOval(
                              child: Material(
                                color: themeData.colorScheme.secondary,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  // inkwell color
                                  child: SizedBox(
                                      width: MySize.size48,
                                      height: MySize.size48,
                                      child: Icon(
                                        MdiIcons.heartOutline,
                                        color:
                                            themeData.colorScheme.onSecondary,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MySize.size16,
                            right: MySize.size16,
                            child: ClipOval(
                              child: Material(
                                color: themeData.colorScheme.secondary,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  // inkwell color
                                  child: SizedBox(
                                      width: MySize.size48,
                                      height: MySize.size48,
                                      child: Icon(
                                        MdiIcons.shareOutline,
                                        color:
                                            themeData.colorScheme.onSecondary,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )));
      },
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width / 2, -40, size.width, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
