/*
* File : Cupertino Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoDialogWidget extends StatefulWidget {
  @override
  _CupertinoDialogWidgetState createState() => _CupertinoDialogWidgetState();
}

class _CupertinoDialogWidgetState extends State<CupertinoDialogWidget> {
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
              title: Text("Dialog",
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
                          left: MySize.size32!,
                          top: MySize.size8!,
                          right: MySize.size32!,
                          bottom: MySize.size8!),
                      pressedOpacity: 0.5,
                      child: Text("Show",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onPrimary))),
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
            'Cupertino Simple Dialog',
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                fontWeight: 600),
          ),
          content: Container(
            margin: EdgeInsets.only(top: MySize.size16!),
            child: Text(
              'Lorem ipsum is a pseudo-Latin text used in web design, ',
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  fontWeight: 400),
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                'OK',
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary,
                    fontWeight: 700,
                    letterSpacing: 0.3),
              ),
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
