/*
* File : Create Account
* Version : 1.0.0
* */


import 'dart:async';
import 'dart:ui';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class CreateAccountProgressWidget extends StatefulWidget {
  @override
  _CreateAccountProgressWidgetState createState() =>
      _CreateAccountProgressWidgetState();
}

class _CreateAccountProgressWidgetState
    extends State<CreateAccountProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData themeData;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = const Duration(seconds: 2);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _CreateAccountDialog();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
                  title: Text("Account",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                            child: isInProgress
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                        themeData.colorScheme.primary,
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 16),
                                        child: Text("Creating...",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600,
                                                letterSpacing: 0.3)),
                                      )
                                    ],
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData.colorScheme.primary
                                              .withAlpha(24),
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              1),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(

                                        onPressed: () {
                                          startTimer();
                                        },
                                        child: Text("Create Account",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                                letterSpacing: 0.4))),
                                  ))))));
      },
    );
  }
}

class _CreateAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                  child: Icon(
                MdiIcons.accountCheckOutline,
                size: 40,
                color: themeData.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Thanks!",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Your account has been successfully created.",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 600, letterSpacing: 0))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text(
                "Please check your inbox, a code is sent on your email as well as your mobile no.",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 500, height: 1.15),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: ElevatedButton(

                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("VERIFY",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600,
                            letterSpacing: 0.3,
                            color: themeData.colorScheme.onPrimary))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
