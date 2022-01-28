/*
* File : Payment Done
* Version : 1.0.0
* */


import 'dart:async';
import 'dart:ui';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class PaymentDoneProgressWidget extends StatefulWidget {
  @override
  _PaymentDoneProgressWidgetState createState() =>
      _PaymentDoneProgressWidgetState();
}

class _PaymentDoneProgressWidgetState extends State<PaymentDoneProgressWidget>
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
          return _PaymentDoneDialog();
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
                  title: Text("Payment",
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
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                    themeData.colorScheme.primary,
                                  ))
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData.colorScheme.primary
                                              .withAlpha(28),
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(

                                        onPressed: () {
                                          startTimer();
                                        },
                                        child: Text(
                                          "Proceed Payment",
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

class _PaymentDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
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
                  child: Text(
                "Thank You!",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    fontWeight: 700),
              )),
            ),
            Container(
              child: Center(
                  child: Text(
                "Your transaction was successful",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2),
              )),
            ),
            Divider(
              color: themeData.dividerColor,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("DATE",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2)),
                      Text("12, April 2020",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("TIME",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2)),
                      Text("8:20 PM",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("TO",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2)),
                      Text("Bronte Mcclure",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600)),
                      Text(
                        "bronte@gmail.com",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2),
                      ),
                    ],
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: AssetImage('./assets/images/avatar-3.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("AMOUNT",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2)),
                  Text("\$ 12,000",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.colorScheme.primary.withAlpha(28),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton(

                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "COMPLETE",
                        style: themeData.textTheme.caption!.merge(TextStyle(
                            color: themeData.colorScheme.onPrimary,
                            letterSpacing: 0.3)),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
