/*
* File : Positioned FAB
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class PositionedFABWidget extends StatefulWidget {
  @override
  _PositionedFABWidgetState createState() => _PositionedFABWidgetState();
}

class _PositionedFABWidgetState extends State<PositionedFABWidget> {
  late ThemeData themeData;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _radioValue = 1;
  int fabEndDocked = 1,
      fabEndFloat = 2,
      fabCenterDocked = 3,
      fabCenterFloat = 4,
      fabEndTop = 5,
      fabMiniStartTop = 6,
      fabStartTop = 7;

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  _handleValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 1:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
        case 2:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endFloat;
          });
          break;
        case 3:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerDocked;
          });
          break;
        case 4:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.centerFloat;
          });
          break;
        case 5:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endTop;
          });
          break;
        case 6:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.miniStartTop;
          });
          break;
        case 7:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.startTop;
          });
          break;
        default:
          setState(() {
            _fabLocation = FloatingActionButtonLocation.endDocked;
          });
          break;
      }
    });
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
                backgroundColor: themeData.colorScheme.background,
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading:IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Positioned FAB",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 700)),
                ),
                extendBody: true,
                key: _scaffoldKey,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    /* Click listener */
                  },
                  child: Icon(Icons.add),
                  backgroundColor: themeData.colorScheme.primary,
                ),
                floatingActionButtonLocation: _fabLocation,
                bottomNavigationBar: new BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  color: themeData.cardTheme.color,
                  clipBehavior: Clip.none,
                  notchMargin: 4,
                  elevation: 4,
                  child: Container(
                    height: 70,
                  ),
                ),
                body: Container(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabEndDocked);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 16, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabEndDocked);
                                  },
                                  groupValue: _radioValue,
                                  value: fabEndDocked,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("End Docked",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabEndFloat);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabEndFloat);
                                  },
                                  groupValue: _radioValue,
                                  value: fabEndFloat,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("End Float",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabCenterDocked);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabCenterDocked);
                                  },
                                  groupValue: _radioValue,
                                  value: fabCenterDocked,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("Center Docked",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabCenterFloat);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabCenterFloat);
                                  },
                                  groupValue: _radioValue,
                                  value: fabCenterFloat,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("Center Float",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabEndTop);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabEndTop);
                                  },
                                  groupValue: _radioValue,
                                  value: fabEndTop,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("End Top",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabMiniStartTop);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabMiniStartTop);
                                  },
                                  groupValue: _radioValue,
                                  value: fabMiniStartTop,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("Mini Top",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _handleValueChange(fabStartTop);
                          },
                          child: Card(
                            margin: EdgeInsets.only(
                                top: 8, left: 16, right: 16, bottom: 8),
                            elevation: 3,
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  onChanged: (dynamic value) {
                                    _handleValueChange(fabStartTop);
                                  },
                                  groupValue: _radioValue,
                                  value: fabStartTop,
                                  activeColor: themeData.colorScheme.primary,
                                ),
                                Text("Start Top",
                                    style: themeData.textTheme.subtitle2!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
