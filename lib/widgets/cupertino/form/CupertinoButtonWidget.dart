/*
* File : Cupertino Button
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class CupertinoButtonWidget extends StatefulWidget {
  @override
  _CupertinoButtonWidgetState createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget> {
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
                title: Text("Cupertino Buttons",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: Container(
                  color: themeData.backgroundColor,
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: MySize.size16!, right: MySize.size16!, top: MySize.size8!, bottom: MySize.size8!),
                      child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Padding(
                              padding:  EdgeInsets.all(MySize.size8!),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Flat Buttons",
                                      style: themeData.textTheme.subtitle2!
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(200),
                                              letterSpacing: 0.2))),
                                  Padding(
                                    padding: EdgeInsets.only(top: MySize.size8!),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        CupertinoButton(
                                            color: Colors.blue,
                                            onPressed: () {},
                                            padding: EdgeInsets.only(
                                                left: MySize.size32!,
                                                top: MySize.size8!,
                                                right: MySize.size32!,
                                                bottom: MySize.size8!),
                                            pressedOpacity: 0.5,
                                            child: Text(
                                              "Blue",
                                              style: themeData
                                                  .textTheme.bodyText2!
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onSecondary)),
                                            )),
                                        CupertinoButton(
                                            color: Colors.green,
                                            onPressed: () {},
                                            padding: EdgeInsets.only(
                                                left: MySize.size32!,
                                                top: MySize.size8!,
                                                right: MySize.size32!,
                                                bottom: MySize.size8!),
                                            child: Text(
                                              "Green",
                                              style: themeData
                                                  .textTheme.bodyText2!
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onSecondary)),
                                            )),
                                        CupertinoButton(
                                            color: Colors.red,
                                            onPressed: () {},
                                            padding: EdgeInsets.only(
                                                left: MySize.size32!,
                                                top: MySize.size8!,
                                                right: MySize.size32!,
                                                bottom: MySize.size8!),
                                            child: Text(
                                              "Red",
                                              style: themeData
                                                  .textTheme.bodyText2!
                                                  .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onSecondary)),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]))))),
        );
      },
    );
  }
}
