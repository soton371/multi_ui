/*
* File : Notification Setting
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool _showNotification = true;
  bool _allowIcon = true;
  bool _showLock = false;
  bool _reaction = true;
  bool _sound = true;
  bool _pushTip = true;
  bool _appSound = false;
  bool _appBanner = true;
  bool _appTip = false;

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
                  elevation: 0,
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  centerTitle: true,
                  title: Text("Notifications",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.all(MySize.size16!),
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Show notifications",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 600)),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _showNotification = value;
                            });
                          },
                          value: _showNotification,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Allow icon badge",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 600)),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _allowIcon = value;
                            });
                          },
                          value: _allowIcon,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8!),
                      child: Text("Push notification".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight:600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Show on Lock Screen",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Show notification when mobile is locked",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _showLock = value;
                                });
                              },
                              value: _showLock,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Reactions",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Receive notification when someone react to your message",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _reaction = value;
                                });
                              },
                              value: _reaction,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sounds",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text("Play sound for new message",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _sound = value;
                                });
                              },
                              value: _sound,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Tips \& Tricks",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Receive notification when new product feature",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _pushTip = value;
                                });
                              },
                              value: _pushTip,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: themeData.dividerColor,
                      thickness: 1,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8!),
                      child: Text("In-app notification".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "In-app sounds",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Play notification sound when using app",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _appSound = value;
                                });
                              },
                              value: _appSound,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Chat Banner Notification",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Show banner notification when new message arrive",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _appBanner = value;
                                });
                              },
                              value: _appBanner,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Tips \& Tricks",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "Receive notification when new product feature",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 400,
                                              letterSpacing: 0,
                                              height: 1))),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: themeData.dividerColor,
                              thickness: 1.2,
                            ),
                            Switch(
                              onChanged: (bool value) {
                                setState(() {
                                  _appTip = value;
                                });
                              },
                              value: _appTip,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
