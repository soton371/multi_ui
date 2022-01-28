/*
* File : Fail Progress
* Version : 1.0.0
* */


import 'dart:async';
import 'dart:ui';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FailProgressWidget extends StatefulWidget {
  @override
  _FailProgressWidgetState createState() => _FailProgressWidgetState();
}

class _FailProgressWidgetState extends State<FailProgressWidget>
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
          return _FailDialog();
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
                  title: Text("Try Again",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    color: themeData.backgroundColor,
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
                                        child: Text(
                                          "Trying...",
                                          style: themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  letterSpacing: 0.2)),
                                        ),
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
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(

                                        onPressed: () {
                                          startTimer();
                                        },
                                        child: Text(
                                          "Try This",
                                          style: themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onPrimary)),
                                        )),
                                  ))))));
      },
    );
  }
}

class _FailDialog extends StatelessWidget {
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
                MdiIcons.emoticonSadOutline,
                size: 40,
                color: themeData.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Oooops",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Something went wrong",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 600))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text(
                "Please try again!",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 500),
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
                    child: Text(
                      "TRY AGAIN",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight: 600,
                          letterSpacing: 0.4,
                          color: themeData.colorScheme.onPrimary),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
