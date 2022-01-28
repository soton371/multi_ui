/*
* File : Radio
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class RadioWidget extends StatefulWidget {
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _radioValue = 1;

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
                  title: Text("Radio Button",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("Radio 1",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600)),
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              leading: Radio(
                                value: 1,
                                activeColor: themeData.colorScheme.primary,
                                groupValue: _radioValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text("Radio 2",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600)),
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              leading: Radio(
                                value: 2,
                                activeColor: themeData.colorScheme.primary,
                                groupValue: _radioValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text("Radio 3",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight:600)),
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              leading: Radio(
                                value: 3,
                                activeColor: themeData.colorScheme.primary,
                                groupValue: _radioValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))));
      },
    );
  }
}
