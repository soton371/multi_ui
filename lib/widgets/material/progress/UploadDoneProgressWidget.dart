/*
* File : Upload File
* Version : 1.0.0
* */


import 'dart:async';
import 'dart:ui';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class UploadDoneProgressWidget extends StatefulWidget {
  @override
  _UploadDoneProgressWidgetState createState() =>
      _UploadDoneProgressWidgetState();
}

class _UploadDoneProgressWidgetState extends State<UploadDoneProgressWidget>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData themeData;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    startTimer();
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    controller.repeat();

    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              controller.stop(),
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
          return _UploadDoneDialog();
        });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.stop();
    controller.dispose();
    super.dispose();

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
                  title: Text("Upload File",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
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
                                      Container(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            themeData.colorScheme.primary,
                                          ),
                                          value: animation.value,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 16),
                                        child: Text(
                                          "Uploading...",
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
                                          "Upload File",
                                          style: themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData.colorScheme
                                                      .onSecondary)),
                                        )),
                                  ))))));
      },
    );
  }
}

class _UploadDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
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
                MdiIcons.cloudCheckOutline,
                size: 40,
                color: themeData.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Success!",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                  child: Text("Your file upload successful",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 600))),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Center(
                  child: Text("Now you can check your file",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontWeight:500))),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: ElevatedButton(

                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("GO",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600,
                            color: themeData.colorScheme.onPrimary))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
