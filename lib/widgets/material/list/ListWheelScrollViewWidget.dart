/*
* File : List Wheel Scroll
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ListWheelScrollViewWidget extends StatefulWidget {
  @override
  _ListWheelScrollViewWidgetState createState() =>
      _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {
  double _diameterRatio = 1;
  double _offAxisFraction = 0;
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
                  title: Text("List Wheel Scroll",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 16, top: 40),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("Diameter Ratio",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600)),
                                  Slider(
                                    value: _diameterRatio,
                                    min: 0.1,
                                    max: 2,
                                    divisions: 19,
                                    label: _diameterRatio.toStringAsFixed(1),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _diameterRatio = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Off Axis Fraction",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600)),
                                  Slider(
                                    value: _offAxisFraction,
                                    min: -2,
                                    max: 2,
                                    divisions: 40,
                                    label: _offAxisFraction.toStringAsFixed(1),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          _offAxisFraction = value;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListWheelScrollView(
                            itemExtent: 60,
                            physics: FixedExtentScrollPhysics(),
                            diameterRatio: _diameterRatio,
                            offAxisFraction: _offAxisFraction,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 1",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 2",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 3",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 4",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 5",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 6",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 7",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Item 8",
                                          style: themeData.textTheme.subtitle1!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        ),
                                      ),
                                    ),
                                    Icon(MdiIcons.faceProfile,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }
}
