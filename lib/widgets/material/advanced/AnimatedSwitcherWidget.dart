/*
* File : Animated Switcher
* Version : 1.0.0
* */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  late ThemeData themeData;

  int _count = 0;

  bool isPlaying = true;

  Timer? _timer;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1500);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          setState(() {
            _count += 1;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Animated Switcher",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 800),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Text(
                            '$_count',
                            key: ValueKey<int>(_count),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline4),
                          ),
                        ),
                        ElevatedButton(

                            onPressed: () {
                              if (isPlaying) {
                                setState(() {
                                  isPlaying = false;
                                  _timer!.cancel();
                                });
                              } else {
                                setState(() {
                                  isPlaying = true;
                                  startTimer();
                                });
                              }
                            },
                            child: Text(
                              isPlaying ? "Pause" : "Play",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onPrimary),
                            )),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
