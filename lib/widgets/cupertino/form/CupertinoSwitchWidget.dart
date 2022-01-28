/*
* File : Cupertino Switch
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  late ThemeData themeData;

  bool _switch1 = true, _switch2 = true, _switch3 = false;

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
              title: Text("Switch",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight:600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      MergeSemantics(
                        child: ListTile(
                          title: Text(
                            'Simple',
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600),
                          ),
                          trailing: CupertinoSwitch(
                            value: _switch1,
                            onChanged: (bool value) {
                              setState(() {
                                _switch1 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch1 = !_switch1;
                            });
                          },
                        ),
                      ),
                      MergeSemantics(
                        child: ListTile(
                          title: Text('Thumb Color',
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                          trailing: CupertinoSwitch(
                            activeColor: themeData.colorScheme.primary,
                            value: _switch2,
                            onChanged: (bool value) {
                              setState(() {
                                _switch2 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch2 = !_switch2;
                            });
                          },
                        ),
                      ),
                      MergeSemantics(
                        child: ListTile(
                          title: Text('Track Color',
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                          trailing: CupertinoSwitch(
                            activeColor: themeData.colorScheme.primary,
                            trackColor: themeData.colorScheme.secondary,
                            value: _switch3,
                            onChanged: (bool value) {
                              setState(() {
                                _switch3 = value;
                              });
                            },
                          ),
                          onTap: () {
                            setState(() {
                              _switch3 = !_switch3;
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
