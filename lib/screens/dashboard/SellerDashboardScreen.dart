/*
* File : Seller Dashboard
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SellerDashboardScreen extends StatefulWidget {
  @override
  _SellerDashboardScreenState createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  List<String> _simpleChoice = [
    "New receipt",
    "Read all",
    "Cancel",
  ];

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
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                    ),
                  ),
                  title: Text("Seller",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "OVERVIEW",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600,
                                letterSpacing: 0.3),
                          ),
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return _simpleChoice.map((String choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Text(choice,
                                      style: TextStyle(letterSpacing: 0.15)
                                          .merge(themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  letterSpacing: 0.2)))),
                                );
                              }).toList();
                            },
                            icon: Icon(
                              MdiIcons.dotsVertical,
                              color: themeData.colorScheme.onBackground,
                            ),
                          )
                        ],
                      ),
                    ),
                    _SingleOverview(
                      title: 'Today',
                      sales: 234,
                      units: 123,
                      profit: 14.545,
                    ),
                    _SingleOverview(
                      title: 'Yesterday',
                      sales: 123,
                      units: 63,
                      profit: -25.2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, top: MySize.size8!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "NEW ORDERS",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600,
                                letterSpacing: 0.3),
                          ),
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return _simpleChoice.map((String choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Text(choice,
                                      style: TextStyle(letterSpacing: 0.15)
                                          .merge(themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  letterSpacing: 0.2)))),
                                );
                              }).toList();
                            },
                            icon: Icon(
                              MdiIcons.dotsVertical,
                              color: themeData.colorScheme.onBackground,
                            ),
                          )
                        ],
                      ),
                    ),
                    _SingleOrder(
                      name: 'Item - 1',
                      image: './assets/images/avatar.jpg',
                      code: '#11D224S2SF2',
                    ),
                    _SingleOrder(
                      name: 'Item - 2',
                      image: './assets/images/avatar-2.jpg',
                      code: '#4AS1A3S6AS8',
                    ),
                    _SingleOrder(
                      name: 'Item - 3',
                      image: './assets/images/avatar-3.jpg',
                      code: '#S1D221XZX6A',
                    ),
                    _SingleOrder(
                      name: 'Item - 4',
                      image: './assets/images/avatar-4.jpg',
                      code: '#5SD1D5C1Z2X',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: MySize.size24!, bottom: MySize.size8!),
                      child: Center(
                        child: SizedBox(
                            width: MySize.size20,
                            height: MySize.size20,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    themeData.colorScheme.primary),
                                strokeWidth: 1.5)),
                      ),
                    )
                  ],
                )));
      },
    );
  }
}

class _SingleOverview extends StatelessWidget {
  final String title;
  final int units, sales;
  final double profit;

  const _SingleOverview(
      {Key? key,
      required this.title,
      required this.units,
      required this.sales,
      required this.profit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!, left: MySize.size16!, right: MySize.size16!),
      decoration: BoxDecoration(
        color: themeData.backgroundColor,
        border: Border.all(width: 1, color: themeData.colorScheme.surface),
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(16),
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: MySize.size16!, bottom: MySize.size12!),
            child: Text(
              title.toUpperCase(),
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  letterSpacing: 0.3, fontWeight: 600),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("\$",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(220),
                                  letterSpacing: 0.3,
                                  fontWeight: 500)),
                          Text(sales.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0.3,
                                  fontWeight: 600))
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: MySize.size2),
                          child: Text("Sales",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(240),
                                  letterSpacing: 0,
                                  fontWeight: 500)))
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    profit > 0
                        ? Icon(MdiIcons.arrowUp,
                            size: MySize.size18, color: themeData.colorScheme.primary)
                        : Icon(MdiIcons.arrowDown,
                            size: MySize.size20, color: themeData.errorColor),
                    Text(
                      profit.abs().toStringAsFixed(2),
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color: profit > 0
                              ? themeData.colorScheme.primary
                              : themeData.errorColor,
                          fontWeight: 500),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(units.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              color: themeData.colorScheme.onBackground,
                              letterSpacing: 0.3,
                              fontWeight: 600)),
                      Container(
                          margin: EdgeInsets.only(top: MySize.size2),
                          child: Text("Units",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(240),
                                  letterSpacing: 0,
                                  fontWeight: 500)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SingleOrder extends StatelessWidget {
  final String? name, code, image;

  const _SingleOrder({Key? key, this.name, this.code, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size10!, bottom: MySize.size10!),
      child: Row(
        children: <Widget>[
          Container(
            width: MySize.size48,
            height: MySize.size48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image!), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size8!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name!,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600,
                          letterSpacing: 0)),
                  Text(code!,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText2,
                        fontWeight: 500,
                      )),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Material(
                    color: themeData.errorColor.withAlpha(28), // button color
                    child: InkWell(
                      splashColor: themeData.errorColor.withAlpha(100),
                      highlightColor: themeData.errorColor.withAlpha(28),
                      child: SizedBox(
                          width: MySize.size40,
                          height: MySize.size40,
                          child: Icon(
                            MdiIcons.close,
                            color: themeData.errorColor,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MySize.size16!),
                  child: ClipOval(
                    child: Material(
                      color: themeData.colorScheme.primary
                          .withAlpha(28), // button color
                      child: InkWell(
                        splashColor:
                            themeData.colorScheme.primary.withAlpha(100),
                        highlightColor:
                            themeData.colorScheme.primary.withAlpha(28),
                        child: SizedBox(
                            width: MySize.size40,
                            height: MySize.size40,
                            child: Icon(
                              MdiIcons.check,
                              color: themeData.colorScheme.primary,
                            )),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
