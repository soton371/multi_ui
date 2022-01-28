/*
* File : Music Queue
* Version : 1.0.0
* */

import 'dart:async';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MusicQueueScreen extends StatefulWidget {
  @override
  _MusicQueueScreenState createState() => _MusicQueueScreenState();
}

class _MusicQueueScreenState extends State<MusicQueueScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ThemeData themeData;
  bool isPlaying = false;
  Timer? _timer;
  int _duration = 200, _position = 0;
  String _time = "0:00";

  final List<String> _queueChoice = [
    "Move to Top",
    "Move to Bottom",
    "Remove",
    "Download"
  ];

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
                  elevation: 0,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                    ),
                  ),
                  title: Text("Queue",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 700)),
                ),
                body: ListView(
                  children: <Widget>[
                    Container(
                      color: themeData.colorScheme.background,
                      padding: EdgeInsets.all(MySize.size24!),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(MySize.size4!),
                                  child: Image(
                                    image: AssetImage(
                                        './assets/images/music/singer-3.jpg'),
                                    fit: BoxFit.cover,
                                    height: MySize.size56,
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size8!),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Bed on My Mind",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            fontWeight: 600)),
                                    Text(
                                      "Paul McCartney",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size8!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: MySize.size8!),
                                  child: ClipOval(
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
                                            height: MySize.size48,
                                            width: MySize.size48,
                                            child: Icon(
                                              MdiIcons.skipPreviousOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              size: MySize.size28,
                                            )),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MySize.size48!),
                                      boxShadow: [
                                        BoxShadow(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(42),
                                            spreadRadius: 1,
                                            blurRadius: 6,
                                            offset: Offset(0, 6))
                                      ]),
                                  child: ClipOval(
                                    child: Material(
                                      elevation: 5,
                                      color: themeData.colorScheme.primary,
                                      child: InkWell(
                                        splashColor: Colors.white,
                                        child: IconButton(
                                          iconSize: MySize.size28!,
                                          icon: AnimatedIcon(
                                            icon: AnimatedIcons.play_pause,
                                            progress: _animationController,
                                          ),
                                          onPressed: () {
                                            if (isPlaying) {
                                              _animationController.reverse();
                                              _onPause();
                                              setState(() {
                                                isPlaying = false;
                                              });
                                            } else {
                                              _animationController.forward();
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
                                        splashColor:
                                            themeData.colorScheme.primary,
                                        child: SizedBox(
                                            height: MySize.size48,
                                            width: MySize.size48,
                                            child: Icon(
                                              MdiIcons.skipNextOutline,
                                              color: themeData
                                                  .colorScheme.onBackground,
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
                            padding: EdgeInsets.only(top: MySize.size8!),
                            child: Row(
                              children: <Widget>[
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    // button color
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(MySize.size28!),
                                        side: BorderSide.none),
                                    child: InkWell(
                                      splashColor:
                                          themeData.colorScheme.primary,
                                      // inkwell color
                                      child: SizedBox(
                                          height: MySize.size36,
                                          width: MySize.size36,
                                          child: Icon(
                                            MdiIcons.shuffle,
                                            color: themeData
                                                .colorScheme.onBackground,
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
                                            fontWeight: 600))),
                                Expanded(
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      trackHeight: 2.5,
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
                                    margin: EdgeInsets.only(right: MySize.size16!),
                                    child: Text("3:20",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            fontWeight: 600))),
                                ClipOval(
                                  child: Material(
                                    color: Colors.transparent,
                                    // button color
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(MySize.size28!),
                                        side: BorderSide.none),
                                    child: InkWell(
                                      splashColor:
                                          themeData.colorScheme.primary,
                                      // inkwell color
                                      child: SizedBox(
                                          height: MySize.size36,
                                          width: MySize.size36,
                                          child: Icon(
                                            MdiIcons.volumeMedium,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          )),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(MySize.size24!),
                      child: Text("Up Next",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 700)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          _SingleQueueWidget(
                            image: './assets/images/music/singer-2.jpg',
                            name: 'Queue two',
                            singer: 'Singer - 2',
                            choice: _queueChoice,
                          ),
                          Divider(),
                          _SingleQueueWidget(
                            image: './assets/images/music/singer-1.jpg',
                            name: 'Queue three',
                            singer: 'Singer - 3',
                            choice: _queueChoice,
                          ),
                          Divider(),
                          _SingleQueueWidget(
                            image: './assets/images/music/singer-4.jpg',
                            name: 'Queue four',
                            singer: 'Singer - 4',
                            choice: _queueChoice,
                          ),
                          Divider(),
                          _SingleQueueWidget(
                            image: './assets/images/music/event-1.jpg',
                            name: 'Queue five',
                            singer: 'Singer - 5',
                            choice: _queueChoice,
                          ),
                        ],
                      ),
                    )
                  ],
                )));
      },
    );
  }
}

class _SingleQueueWidget extends StatelessWidget {
  final String image, name, singer;

  final List<String> choice;

  const _SingleQueueWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.singer,
      required this.choice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size2, bottom: MySize.size2),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(MySize.size6!),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: MySize.size56,
                width: MySize.size56,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size8!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600)),
                  Text(
                    singer,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: themeData.colorScheme.primary.withAlpha(16),
                child: InkWell(
                  splashColor: themeData.colorScheme.primary.withAlpha(100),
                  // inkwell color
                  child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        MdiIcons.heartOutline,
                        color: themeData.colorScheme.primary,
                        size: 20,
                      )),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return choice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2)),
                  );
                }).toList();
              },
              icon: Icon(
                MdiIcons.dotsVertical,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
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
