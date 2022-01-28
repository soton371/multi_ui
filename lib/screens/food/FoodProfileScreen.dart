import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class FoodProfileScreen extends StatefulWidget {

  final BuildContext rootContext;

  const FoodProfileScreen({Key? key, required this.rootContext}) : super(key: key);

  @override
  _FoodProfileScreenState createState() => _FoodProfileScreenState();
}

class _FoodProfileScreenState extends State<FoodProfileScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: SafeArea(
              child: Scaffold(
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      child: ListView(
                        padding: EdgeInsets.only(top: MySize.size24!),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor!
                                          .withAlpha(12),
                                      blurRadius: MySize.size16!,
                                      offset: Offset(0, MySize.size4!))
                                ]),
                            padding: EdgeInsets.all(MySize.size16!),
                            margin: EdgeInsets.only(
                                left: MySize.size24!, right: MySize.size24!),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size32!)),
                                      child: Image(
                                        image: AssetImage(
                                            './assets/images/avatar-5.jpg'),
                                        width: MySize.size64,
                                        height: MySize.size64,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: MySize.size16!),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Malia Jackson",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "Mal@son.com",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  padding: EdgeInsets.only(
                                      left: MySize.size16!,
                                      top: MySize.size8!,
                                      bottom: MySize.size8!,
                                      right: MySize.size16!),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size2))),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.informationOutline,
                                          color: themeData.colorScheme.onPrimary,
                                          size: MySize.size18),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Gold member",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: Generator.goldColor,
                                              fontWeight: 600,
                                              letterSpacing: 0.2),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Upgrade",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                                fontWeight: 600,
                                                letterSpacing: 0.2),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor!
                                          .withAlpha(12),
                                      blurRadius: MySize.size16!,
                                      offset: Offset(0, MySize.size4!))
                                ]),
                            padding: EdgeInsets.all(MySize.size16!),
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Account balance",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(220),
                                            letterSpacing: 0,
                                            fontWeight: 600),
                                      ),
                                      Text(
                                        "\$ 50.00",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: themeData.colorScheme.primary,
                                            letterSpacing: 0,
                                            fontWeight: 600),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Refer Friends",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600),
                                          ),
                                          Text(
                                            "Earn \$100",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color:
                                                    themeData.colorScheme.primary,
                                                fontWeight: 600),
                                          )
                                        ],
                                      ),
                                      Icon(
                                        MdiIcons.chevronRight,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor!
                                          .withAlpha(12),
                                      blurRadius: MySize.size16!,
                                      offset: Offset(0, MySize.size4!))
                                ]),
                            padding: EdgeInsets.all(MySize.size16!),
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.walletOutline,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Add money to wallet",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              letterSpacing: 0,
                                              fontWeight: 600),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            MdiIcons.chevronRight,
                                            size: MySize.size22,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.mapMarkerOutline,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Address setting",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              letterSpacing: 0,
                                              fontWeight: 600),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            MdiIcons.chevronRight,
                                            size: MySize.size22,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.creditCardOutline,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Payment setting",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              letterSpacing: 0,
                                              fontWeight: 600),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            MdiIcons.chevronRight,
                                            size: MySize.size22,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.faceAgent,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Customer support",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              letterSpacing: 0,
                                              fontWeight: 600),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            MdiIcons.chevronRight,
                                            size: MySize.size22,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.security,
                                        size: MySize.size22,
                                        color: themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Text(
                                          "Terms",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              letterSpacing: 0,
                                              fontWeight: 600),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            MdiIcons.chevronRight,
                                            size: MySize.size22,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                  ),
                                  onPressed: () {
                                    Navigator.pop(widget.rootContext);
                                  },
                                  child: Text(
                                    "Logout"
                                        .toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        letterSpacing: 0.5,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600),
                                  )),
                            ),
                          )
                        ],
                      ))),
            ));
      },
    );
  }
}
