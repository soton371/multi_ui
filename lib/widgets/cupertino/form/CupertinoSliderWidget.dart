/*
* File : Cupertino Slider
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoSliderWidget extends StatefulWidget {
  @override
  _CupertinoSliderWidgetState createState() => _CupertinoSliderWidgetState();
}

class _CupertinoSliderWidgetState extends State<CupertinoSliderWidget> {
  late ThemeData themeData;

  double _progress = 60, _progress2 = 40, _progress3 = 80;

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
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(MdiIcons.chevronLeft),
              ),
              title: Text("Cupertino Slider",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                        child: Text("Simple Slider",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ),
                      Container(
                        child: CupertinoSlider(
                          value: _progress,
                          min: 0.0,
                          max: 100.0,
                          activeColor: themeData.colorScheme.secondary,
                          onChanged: (value) {
                            setState(() {
                              _progress = value.roundToDouble();
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                        child: Text("Divisions Slider",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ),
                      Container(
                        child: CupertinoSlider(
                          value: _progress2,
                          min: 0.0,
                          max: 100.0,
                          activeColor: themeData.colorScheme.secondary,
                          divisions: 5,
                          onChanged: (value) {
                            setState(() {
                              _progress2 = value.roundToDouble();
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                        child: Text("Thumb Color",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ),
                      Container(
                        child: CupertinoSlider(
                          value: _progress3,
                          min: 0.0,
                          max: 100.0,
                          activeColor: themeData.colorScheme.primary,
                          thumbColor: themeData.colorScheme.primary,
                          onChanged: (value) {
                            setState(() {
                              _progress3 = value.roundToDouble();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ))),
      );
    });
  }
}
