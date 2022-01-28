/*
* File : Hotel Profile
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HotelProfileScreen extends StatefulWidget {
  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: themeData.backgroundColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8!)),
                    border: Border.all(
                        color: themeData.colorScheme.surface, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.cardTheme.shadowColor!.withAlpha(12),
                        blurRadius: 2,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(
                      top: MySize.size48!,
                      left: MySize.size16!,
                      right: MySize.size16!),
                  padding: EdgeInsets.all(MySize.size16!),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!)),
                        child: Image.asset(
                          "./assets/images/avatar-2.jpg",
                          height: MySize.getScaledSizeHeight(90),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: MySize.size16!),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Milton Garcia",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text("mile@gmail.com",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 400,
                                    letterSpacing: 0.2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MySize.size16!),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          border: Border.all(
                              color: themeData.colorScheme.surface, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            top: MySize.size32!,
                            left: MySize.size16!,
                            right: MySize.size16!),
                        padding: EdgeInsets.only(
                            top: MySize.size12!,
                            bottom: MySize.size16!,
                            left: MySize.size16!,
                            right: MySize.size16!),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text("My Information",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 500)),
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
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          border: Border.all(
                              color: themeData.colorScheme.surface, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                        padding: EdgeInsets.all(MySize.size16!),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text("My Booking",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 500)),
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
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          border: Border.all(
                              color: themeData.colorScheme.surface, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                        padding: EdgeInsets.all(MySize.size16!),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text("Payment Method",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 500)),
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
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          border: Border.all(
                              color: themeData.colorScheme.surface, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                        padding: EdgeInsets.all(MySize.size16!),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text("Setting",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 500)),
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
                      Container(
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          border: Border.all(
                              color: themeData.colorScheme.surface, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: themeData.cardTheme.shadowColor!
                                  .withAlpha(12),
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                        padding: EdgeInsets.all(MySize.size16!),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text("Logout",
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
                    ],
                  ),
                ),
              ],
            )));
      },
    );
  }
}
