/*
* File : Slider
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  double _starValue = 10;
  double _endValue = 80;

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          key: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Sliders",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Slider",
                                style: AppTheme.getTextStyle(themeData
                                    .textTheme
                                    .subtitle1,fontWeight: 600,letterSpacing: 0.2)),
                          ),
                          Container(
                            child: Slider(
                              value: _sliderValue1,
                              onChanged: (value) {
                                setState(() {
                                  _sliderValue1 = value;
                                });
                              },
                              min: 0,
                              max: 100,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Labeled Slider",
                                style: AppTheme.getTextStyle(themeData
                                    .textTheme
                                    .subtitle1,fontWeight: 600,letterSpacing: 0.2)),
                          ),
                          Container(
                            child: Slider(
                              value: _sliderValue2,
                              min: 0,
                              max: 100,
                              divisions: 100,
                              label: _sliderValue2.floor().toString(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    _sliderValue2 = value;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Range Slider",
                                style: AppTheme.getTextStyle(themeData
                                    .textTheme
                                    .subtitle1,fontWeight: 600,letterSpacing: 0.2)),
                          ),
                          Container(
                            child: RangeSlider(
                              values: RangeValues(_starValue, _endValue),
                              min: 0.0,
                              max: 100.0,
                              onChanged: (values) {
                                setState(() {
                                  _starValue = values.start.roundToDouble();
                                  _endValue = values.end.roundToDouble();
                                });
                              },
                              activeColor:
                                  themeData.sliderTheme.activeTrackColor,
                              inactiveColor: themeData
                                  .sliderTheme.inactiveTrackColor,
                            ),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData
              .textTheme
              .subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
