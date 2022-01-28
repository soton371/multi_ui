/*
* File : Cupertino Date & Time Picker
* Version : 1.0.0
* */


import 'package:UIKit/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoDateTimePickerWidget extends StatefulWidget {
  @override
  _CupertinoDateTimePickerWidgetState createState() =>
      _CupertinoDateTimePickerWidgetState();
}

class _CupertinoDateTimePickerWidgetState
    extends State<CupertinoDateTimePickerWidget> {
  late ThemeData themeData;

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
              title: Text("Date \& Time",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                child: Container(
                  child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      onDateTimeChanged: (dateTime) {
                      }),
                ))),
      );
    });
  }
}
