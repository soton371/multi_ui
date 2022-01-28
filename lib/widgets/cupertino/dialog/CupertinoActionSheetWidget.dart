/*
* File : Cupertino Action Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoActionSheetWidget extends StatefulWidget {
  @override
  _CupertinoActionSheetWidgetState createState() =>
      _CupertinoActionSheetWidgetState();
}

class _CupertinoActionSheetWidgetState
    extends State<CupertinoActionSheetWidget> {
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showSheet());
  }

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
              title: Text("Action Sheet",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                child: Center(
                  child: CupertinoButton(
                      color: themeData.colorScheme.primary,
                      onPressed: () {
                        _showSheet();
                      },
                      padding: EdgeInsets.only(
                          left: MySize.size32!, top: MySize.size8!, right: MySize.size32!, bottom: MySize.size8!),
                      pressedOpacity: 0.5,
                      child: Text(
                        "Show",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onPrimary),
                      )),
                ))),
      );
    });
  }

  _showSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              title: Text("FlutKIT",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 700, letterSpacing: 0.5)),
              message: Text("Select any action",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 500, letterSpacing: 0.2)),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: Text("Action 1",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text("Action 2",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text("Cancel",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.errorColor,
                        fontWeight: 600)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }
}
