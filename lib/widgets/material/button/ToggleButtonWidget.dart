/*
* File : Toggle Button
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ToggleButtonWidget extends StatefulWidget {
  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {

  late ThemeData themeData;
  List<bool> isSelected = [false, true, false];


  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Toggle Button",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text("Simple",
                                    style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,fontWeight: 700)),
                              ),
                              ToggleButtons(
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                children: <Widget>[
                                  Icon(Icons.format_bold),
                                  Icon(Icons.format_italic),
                                  Icon(Icons.link),
                                ],
                                fillColor: Colors.transparent,
                                isSelected: isSelected,
                                onPressed: (int index) {
                                  setState(() {
                                    isSelected[index] = !isSelected[index];
                                  });
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: MySize.size8!, top: MySize.size16!),
                                child: Text("Filled",
                                    style:  AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,fontWeight: 700)),
                              ),
                              ToggleButtons(
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                color: themeData.colorScheme.onBackground,
                                fillColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                selectedBorderColor: themeData.colorScheme
                                    .primary.withAlpha(48),
                                children: <Widget>[
                                  Icon(Icons.format_bold),
                                  Icon(Icons.format_italic),
                                  Icon(Icons.link),
                                ],
                                isSelected: isSelected,
                                onPressed: (int index) {
                                  setState(() {
                                    isSelected[index] = !isSelected[index];
                                  });
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8, top: 16),
                                child: Text("Bordered",
                                    style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,fontWeight: 600)),
                              ),
                              ToggleButtons(
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                color: themeData.colorScheme.onBackground,
                                fillColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                borderWidth: 1,
                                borderColor: themeData.colorScheme.onBackground,
                                selectedBorderColor: themeData.colorScheme
                                    .primary,
                                children: <Widget>[
                                  Icon(Icons.format_bold),
                                  Icon(Icons.format_italic),
                                  Icon(Icons.link),
                                ],
                                isSelected: isSelected,
                                onPressed: (int index) {
                                  setState(() {
                                    isSelected[index] = !isSelected[index];
                                  });
                                },
                              ),

                              Container(
                                margin: EdgeInsets.only(bottom: MySize.size8!, top: MySize.size16!),
                                child: Text("Curved",
                                    style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,fontWeight: 600)),
                              ),
                              ToggleButtons(
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                color: themeData.colorScheme.onBackground,
                                fillColor: themeData.colorScheme.primary
                                    .withAlpha(48),
                                borderWidth: 1,
                                borderColor: themeData.colorScheme.onBackground,
                                selectedBorderColor: themeData.colorScheme
                                    .primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),),
                                children: <Widget>[
                                  Icon(Icons.format_bold),
                                  Icon(Icons.format_italic),
                                  Icon(Icons.link),
                                ],
                                isSelected: isSelected,
                                onPressed: (int index) {
                                  setState(() {
                                    isSelected[index] = !isSelected[index];
                                  });
                                },
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
