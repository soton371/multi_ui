/*
* File : Checkbox
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool? _check1 = false, _check2 = true, _check3 = false, _triState;

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
                  title: Text("Checkbox",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),body: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: themeData.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _check1 = value;
                                    });
                                  },
                                  value: _check1,
                                ),
                                Text("Check 1",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _check2,
                                  activeColor: themeData.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _check2 = value;
                                    });
                                  },
                                ),
                                Text("Check 2",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _check3,
                                  activeColor: themeData.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _check3 = value;
                                    });
                                  },
                                ),
                                Text("Check 3",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _triState,
                                  tristate: true,
                                  activeColor: themeData.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _triState = value;
                                    });
                                  },
                                ),
                                Text("Tri State",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))));
      },
    );
  }
}
