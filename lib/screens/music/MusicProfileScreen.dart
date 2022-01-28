import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class MusicProfileScreen extends StatefulWidget {
  @override
  _MusicProfileScreenState createState() => _MusicProfileScreenState();
}

class _MusicProfileScreenState extends State<MusicProfileScreen> {
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
              padding: EdgeInsets.fromLTRB(24,40,24,24),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: AssetImage("./assets/images/avatar-4.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Anisha Preece",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    letterSpacing: 0)),
                            Text("anisha@shopy.com",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 500,
                                    letterSpacing: 0.3)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              MdiIcons.chevronRight,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size36!),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16!),
                          margin: EdgeInsets.only(right: MySize.size12!),
                          decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8!)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor!
                                    .withAlpha(24),
                                blurRadius: 7,
                                offset: Offset(0,
                                    3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.mapMarkerOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                "Address",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16!),
                          margin: EdgeInsets.only(left: MySize.size4!,right: MySize.size4!),
                          decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8!)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor!
                                    .withAlpha(24),
                                blurRadius: 7,
                                offset: Offset(0,
                                    3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.creditCardOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                "Payment",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16!),
                          margin: EdgeInsets.only(left: MySize.size12!),
                          decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8!)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor!
                                    .withAlpha(24),
                                blurRadius: 7,
                                offset: Offset(0,
                                    3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.contentPaste,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                "History",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size36!),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.heartOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16!),
                              child: Text("Favourite",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: 22,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                MdiIcons.bellRingOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text("Notifications",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600)),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: 22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(MdiIcons.eyeOutline,
                                  size: 22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text("Appearance",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600)),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(MdiIcons.faceAgent,
                                  size: 22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text("Help \& Support",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600)),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
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
