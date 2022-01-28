/*
* File : Basic Setting
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class BasicSettingScreen extends StatefulWidget {
  @override
  _BasicSettingScreenState createState() => _BasicSettingScreenState();
}

class _BasicSettingScreenState extends State<BasicSettingScreen> {
  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  centerTitle: true,
                  title: Text("Setting",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: MySize.size16!, bottom: MySize.size24!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: themeData.colorScheme.background,
                          prefixIcon: Icon(MdiIcons.magnify,
                              size: MySize.size22,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.accountEditOutline,
                                size: 24,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Account",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              MdiIcons.bellRingOutline,
                              size: MySize.size22,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Notifications",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.eyeOutline,
                                size: 22,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Appearance",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.lockOutline,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Privacy \& Security",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: 24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.faceAgent,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Help \& Support",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.helpCircleOutline,
                                size: 24,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("About",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                    ),
                  ],
                )));
      },
    );
  }
}
