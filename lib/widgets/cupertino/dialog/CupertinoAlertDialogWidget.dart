/*
* File : Cupertino Alert Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoAlertDialogWidget extends StatefulWidget {
  @override
  _CupertinoAlertDialogWidgetState createState() =>
      _CupertinoAlertDialogWidgetState();
}

class _CupertinoAlertDialogWidgetState
    extends State<CupertinoAlertDialogWidget> {
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
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
              title: Text("Alert Dialog",
                  style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                      fontWeight: 600)),
            ),
            body: Container(
                color: themeData.backgroundColor,
                child: Center(
                  child: CupertinoButton(
                      color: themeData.colorScheme.primary,
                      onPressed: () {
                        _showDialog();
                      },
                      padding: EdgeInsets.only(
                          left: MySize.size32!, top: MySize.size8!, right: MySize.size32!, bottom: MySize.size8!),
                      pressedOpacity: 0.5,
                      child: Text(
                        "Give Permission",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onPrimary),
                      )),
                ))),
      );
    });
  }

  _showDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'Allow "Maps" to access your location while you use the app?',
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                height: 1.2, fontWeight: 600),
          ),
          content: Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.',
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  height: 1.2, fontWeight: 400),
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Don\'t Allow', style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.primary,
                  fontWeight: 600,
                  letterSpacing: 0.3),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Allow', style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.primary,
                  fontWeight: 600,
                  letterSpacing: 0.3),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
