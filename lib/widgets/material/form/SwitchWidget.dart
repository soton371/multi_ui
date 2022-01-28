/*
* File : Switch
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late ThemeData themeData;
  bool _switch = true;

  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
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
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Switch",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(16),
                            child: Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _switch = value;
                                });
                              },
                              value: _switch,
                              activeColor: themeData.colorScheme.primary,
                            )),
                        Container(
                          margin: EdgeInsets.all(16),
                          child: ToggleButtons(
                            fillColor: themeData.colorScheme.primary,
                            color: Colors.transparent,
                            borderWidth: 0,
                            selectedBorderColor: themeData.colorScheme.primary,
                            selectedColor: themeData.colorScheme.primary,
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(0),
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Open 24 Hours',
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600,
                                      color: isSelected[0]
                                          ? themeData.colorScheme.onSecondary
                                          : themeData.colorScheme.onBackground,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Custom Hours',
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600,
                                      color: isSelected[1]
                                          ? themeData.colorScheme.onSecondary
                                          : themeData.colorScheme.onBackground,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < isSelected.length; i++) {
                                  isSelected[i] = (i == index);
                                }
                              });
                            },
                            isSelected: isSelected,
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }
}
