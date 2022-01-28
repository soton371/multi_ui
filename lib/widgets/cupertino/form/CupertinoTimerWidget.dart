/*
* File : Cupertino Timer
* Version : 1.0.0
* */


import 'package:UIKit/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoTimerPickerWidget extends StatefulWidget {
  @override
  _CupertinoTimerPickerWidgetState createState() =>
      _CupertinoTimerPickerWidgetState();
}

class _CupertinoTimerPickerWidgetState
    extends State<CupertinoTimerPickerWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text("Timer",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: Container(
                  color: themeData.backgroundColor,
                  child: Container(
                    child: CupertinoTimerPicker(
                      onTimerDurationChanged: (Duration value) {},
                      mode: CupertinoTimerPickerMode.hms,
                    ),
                  ))),
        );
      },
    );
  }
}
