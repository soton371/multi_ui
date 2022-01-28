/*
* File : Privacy Setting
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class PrivacySecuritySettingScreen extends StatefulWidget {
  @override
  _PrivacySecuritySettingScreenState createState() =>
      _PrivacySecuritySettingScreenState();
}

class _PrivacySecuritySettingScreenState
    extends State<PrivacySecuritySettingScreen> {
  bool _email = true;
  bool _birthDate = true;
  bool _message = false;
  bool _facebook = true;
  bool _twitter = true;
  bool _instagram = true;
  bool _google = false;
  bool _gDrive = true;
  bool _photos = false;

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
                  title: Text("Privacy \& Security",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.all(MySize.size16!),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size4!),
                      child: Text("Privacy".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Show my email address on my profile",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          value: _email,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Show my birth date on my profile",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _birthDate = value;
                            });
                          },
                          value: _birthDate,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Allow user to message you directly",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _message = value;
                            });
                          },
                          value: _message,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Divider(
                      color: themeData.dividerColor,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size4!),
                      child: Text("Social Accounts".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Facebook",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _facebook = value;
                            });
                          },
                          value: _facebook,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Twitter",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _twitter = value;
                            });
                          },
                          value: _twitter,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Instagram",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _instagram = value;
                            });
                          },
                          value: _instagram,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Google+",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              _google = value;
                            });
                          },
                          value: _google,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: themeData.colorScheme.primary,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8!),
                      child: Text("Connected apps".toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              letterSpacing: 0.3)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size4!),
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
                                    "G Drive",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      child: Text(
                                          "This is may backup your files",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 500,
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
                                  _gDrive = value;
                                });
                              },
                              value: _gDrive,
                              activeColor: themeData.colorScheme.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
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
                                    "Photos",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: MySize.size2),
                                      child: Text(
                                          "This is may backup your photos",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 500,
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
                                  _photos = value;
                                });
                              },
                              value: _photos,
                              activeColor: themeData.colorScheme.primary,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
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
