/*
* File : Login
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class Login1Screen extends StatefulWidget {
  @override
  _Login1ScreenState createState() => _Login1ScreenState();
}

class _Login1ScreenState extends State<Login1Screen> {
  bool _passwordVisible = false;

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
                body: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 3 / 10,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.background,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(MySize.size96))),
                      ),
                      Positioned(
                        top: 30,
                        left: 10,
                        child: BackButton(
                          color: themeData.colorScheme.onBackground,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 40,
                        child: Text("LOGIN",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 600)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MySize.size16!,
                      right: MySize.size16!,
                      top: MySize.size16!),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MySize.size12!,
                          left: MySize.size16!,
                          right: MySize.size16!,
                          bottom: MySize.size12!),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              prefixIcon: Icon(MdiIcons.emailOutline),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0.1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                prefixIcon: Icon(MdiIcons.lockOutline),
                                suffixIcon: IconButton(
                                  icon: Icon(_passwordVisible
                                      ? MdiIcons.eyeOutline
                                      : MdiIcons.eyeOffOutline),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _passwordVisible,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            alignment: Alignment.centerRight,
                            child: Text("Forgot Password ?",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight:500)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(MySize.size24!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                onPressed: () {},
                                child: Text("LOGIN",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.button,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary,
                                        letterSpacing: 0.5))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Center(
                    child: Text("OR",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 500)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: themeData.colorScheme.primary,
                          child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor: themeData.colorScheme.primary,
                            // inkwell color
                            child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Icon(
                                  MdiIcons.facebook,
                                  color: themeData.colorScheme.onPrimary,
                                  size: 30,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ClipOval(
                        child: Material(
                          color: themeData.colorScheme.primary,
                          child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor: themeData.colorScheme.primary,
                            child: SizedBox(
                                width: 52,
                                height: 52,
                                child: Icon(
                                  MdiIcons.google,
                                  color: themeData.colorScheme.onPrimary,
                                  size: 30,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
      },
    );
  }
}
