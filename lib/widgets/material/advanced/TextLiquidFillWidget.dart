/*
* File : Text Liquid Fill
* Version : 1.0.0
* */

import 'package:UIKit/utils/TextLiquidFill.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class TextLiquidFillWidget extends StatefulWidget {
  @override
  _TextLiquidFillWidgetState createState() => _TextLiquidFillWidgetState();
}

class _TextLiquidFillWidgetState extends State<TextLiquidFillWidget> {
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
                backgroundColor: Colors.black,
                body: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(MdiIcons.chevronLeft),
                        ),
                      ),
                      TextLiquidFill(
                          text: "FLUTTER",
                          loadDuration: Duration(seconds: 15),
                          waveDuration: Duration(milliseconds: 600),
                          waveColor: Colors.blue,
                          textStyle: AppTheme.getTextStyle(
                              themeData.textTheme.headline2,
                              fontWeight: 800,
                              letterSpacing: 0.5)),
                      TextLiquidFill(
                          text: "UIKIT",
                          loadDuration: Duration(seconds: 15),
                          waveDuration: Duration(milliseconds: 700),
                          waveColor: Colors.red,
                          textStyle: AppTheme.getTextStyle(
                              themeData.textTheme.headline2,
                              fontWeight: 800,
                              letterSpacing: 0.5)),
                      TextLiquidFill(
                          text: "LIQUID",
                          loadDuration: Duration(seconds: 15),
                          waveDuration: Duration(milliseconds: 800),
                          waveColor: Colors.green,
                          textStyle: AppTheme.getTextStyle(
                              themeData.textTheme.headline2,
                              fontWeight: 800,
                              letterSpacing: 0.5)),
                      TextLiquidFill(
                          text: "EFFECT",
                          loadDuration: Duration(seconds: 15),
                          waveDuration: Duration(milliseconds: 900),
                          waveColor: Colors.yellow,
                          textStyle: AppTheme.getTextStyle(
                              themeData.textTheme.headline2,
                              fontWeight: 800,
                              letterSpacing: 0.5)),
                    ],
                  ),
                )));
      },
    );
  }
}
