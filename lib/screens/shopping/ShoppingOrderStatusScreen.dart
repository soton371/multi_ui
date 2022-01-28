/*
* File : Shopping Order Status
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class ShoppingOrderStatusScreen extends StatefulWidget {
  @override
  _ShoppingOrderStatusScreenState createState() =>
      _ShoppingOrderStatusScreenState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _ShoppingOrderStatusScreenState extends State<ShoppingOrderStatusScreen> {
  int _currentStep = 3;

  late ThemeData themeData;

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Receipt", MdiIcons.receipt),
    TextIconItem("Cancel", MdiIcons.cancel)
  ];

  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      height: MySize.getScaledSizeHeight(200),
                      child: PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        controller: PageController(
                          initialPage: 0,
                          viewportFraction: 0.80,
                        ),
                        onPageChanged: (int page) {
                          setState(() {});
                        },
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MySize.size8!,
                                right: MySize.size12!,
                                top: MySize.size8!),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor!
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: MySize.size16!),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size8!,
                                  top: MySize.size16!,
                                  bottom: MySize.size16!,
                                  right: MySize.size8!),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Order No: 381478",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "Placed on april, 14,2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 400),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: PopupMenuButton(
                                          itemBuilder: (BuildContext context) {
                                            return _textIconChoice
                                                .map((TextIconItem choice) {
                                              return PopupMenuItem(
                                                value: choice,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(choice.iconData,
                                                        size: MySize.size18,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MySize.size8!),
                                                      child: Text(choice.text,
                                                          style: AppTheme
                                                              .getTextStyle(
                                                                  themeData
                                                                      .textTheme
                                                                      .bodyText2)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          },
                                          icon: Icon(
                                            MdiIcons.dotsVertical,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                          color: themeData.backgroundColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text("Paid",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 600)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Status : ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              fontWeight: 500)),
                                      Text("On the way",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: 600)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 8, right: 12, left: 12, top: 8),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor!
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: 16),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 8, top: 16, bottom: 16, right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Order No: 47856521",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "Placed on feb, 14,2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 400),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: PopupMenuButton(
                                          itemBuilder: (BuildContext context) {
                                            return _textIconChoice
                                                .map((TextIconItem choice) {
                                              return PopupMenuItem(
                                                value: choice,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(choice.iconData,
                                                        size: 18,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground),
                                                    Padding(
                                                      padding:
                                                           EdgeInsets.only(
                                                              left: MySize.size8!),
                                                      child: Text(choice.text,
                                                          style: AppTheme
                                                              .getTextStyle(
                                                                  themeData
                                                                      .textTheme
                                                                      .bodyText2)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          },
                                          icon: Icon(
                                            MdiIcons.dotsVertical,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                          color: themeData.backgroundColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text("Cash on Delivery",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 600)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Status : ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              fontWeight: 500)),
                                      Text("Delivered",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: 600)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!, left: MySize.size12!),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(MySize.size16!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor!
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text("VIEW ALL",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      letterSpacing: 0.5,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(200))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!, left: MySize.size16!, right: MySize.size16!),
                      child: Text(
                        "STATUS",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 700,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200)),
                      ),
                    ),
                    Container(
                      child: Stepper(
                        physics: ClampingScrollPhysics(),
                        // controlsBuilder: (BuildContext context,
                        //     {VoidCallback? onStepContinue,
                        //     VoidCallback? onStepCancel}) {
                        //   return Container();
                        // },
                        currentStep: _currentStep,
                        onStepTapped: (pos) {
                          setState(() {
                            _currentStep = pos;
                          });
                        },
                        steps: <Step>[
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text('Order placed - 14 April',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: Text("Order was received by seller",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500)),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text('Payment confirmed - 14 april',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 500)),
                            content: SizedBox(
                              child: Text("Pay via debit card",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text('Processing - 16 April',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  "It may be take longer time than expected",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.indexed,
                            title: Text('On the way',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  "Jenifer picked your order, you can contact her anytime",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            state: StepState.indexed,
                            title: Text('Deliver',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  "Today at 2:30 PM order has been deliver",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
