import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class WalletCryptoScreen extends StatefulWidget {
  @override
  _WalletCryptoScreenState createState() => _WalletCryptoScreenState();
}

class _WalletCryptoScreenState extends State<WalletCryptoScreen> {
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
                  title: Text("Crypto",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                  actions: <Widget>[
                    Container(
                        margin: EdgeInsets.only(right: MySize.size16!),
                        child: Icon(
                          MdiIcons.qrcode,
                          color: themeData.colorScheme.onBackground,
                          size: 24,
                        ))
                  ],
                ),
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MySize.size36!, bottom: MySize.size36!, right: MySize.size40!, left: MySize.size40!),
                        decoration: BoxDecoration(
                          color: themeData.cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(24),
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "\$ ",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline6,
                                          letterSpacing: 0)),
                                  TextSpan(
                                      text: "3824",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          letterSpacing: 0)),
                                  TextSpan(
                                      text: ".75",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline6,
                                          letterSpacing: 0)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("+ \$ 146.25 (10.25\%) ",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                    )),
                                Icon(
                                  MdiIcons.arrowUp,
                                  color: themeData.colorScheme.primary,
                                  size: 18,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, top: MySize.size32!, right: MySize.size16!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "TODAY RATE",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600),
                          ),
                          Icon(
                            MdiIcons.refresh,
                            color: themeData.colorScheme.onBackground,
                            size: MySize.size22,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(MySize.size16!),
                      padding: EdgeInsets.all(MySize.size8!),
                      decoration: BoxDecoration(
                        color: themeData.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                        border: Border.all(
                            width: 0.7, color: themeData.colorScheme.surface),
                        boxShadow: [
                          BoxShadow(
                            color:
                                themeData.cardTheme.shadowColor!.withAlpha(28),
                            blurRadius: MySize.size4!,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          _SingleRate(
                            name: 'BTC',
                            rate: 451.14,
                            changes: 12.85,
                          ),
                          _SingleRate(
                            name: 'Ethereum',
                            rate: 148.40,
                            changes: -16.54,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, top: MySize.size16!),
                      child: Text(
                        "ACTIVITY",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(MySize.size16!),
                      padding: EdgeInsets.all(MySize.size16!),
                      decoration: BoxDecoration(
                        color: themeData.backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                        border: Border.all(
                            width: 0.7, color: themeData.colorScheme.surface),
                        boxShadow: [
                          BoxShadow(
                            color:
                                themeData.cardTheme.shadowColor!.withAlpha(28),
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          _SingleActivity(
                            title: 'Received Ethereum',
                            subtitle: 'Pending transaction',
                            activity: '+0.3785 BTC',
                            activityColor: themeData.colorScheme.primary,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          _SingleActivity(
                            title: 'Received Bitcoin',
                            subtitle: 'Pending transaction',
                            activity: '+0.3785 BTC',
                            activityColor: themeData.colorScheme.primary,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          _SingleActivity(
                            title: 'Sent Bitcoin',
                            subtitle: 'To Eliott Myers',
                            activity: '-0.7548 BTC',
                            activityColor: themeData.errorColor,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Container(
                            child: Center(
                              child: TextButton(

                                  onPressed: () {},
                                  child: Text("VIEW ALL",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          letterSpacing: 0.5,
                                          fontWeight: 600))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )));
      },
    );
  }
}

class _SingleActivity extends StatelessWidget {
  final String title, subtitle, activity;
  final Color activityColor;

  const _SingleActivity(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.activity,
      required this.activityColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!, left: MySize.size16!, right: MySize.size16!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 700)),
              Text(subtitle,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontWeight: 400)),
            ],
          ),
          Text(activity,
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  fontWeight: 600,
                  color: activityColor,
                  letterSpacing: 0)),
        ],
      ),
    );
  }
}

class _SingleRate extends StatelessWidget {
  final String name;
  final double rate, changes;

  const _SingleRate(
      {Key? key,
      required this.name,
      required this.rate,
      required this.changes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size8!, bottom: MySize.size8!),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600))),
          Text("\$ " + rate.toStringAsFixed(2),
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  fontWeight: 600)),
          Container(
            margin: EdgeInsets.only(left: MySize.size8!),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                changes > 0
                    ? Icon(MdiIcons.arrowUp,
                        size: MySize.size18, color: themeData.colorScheme.primary)
                    : Icon(MdiIcons.arrowDown,
                        size: MySize.size18, color: themeData.errorColor),
                Text(
                  changes.abs().toStringAsFixed(2),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: changes > 0
                          ? themeData.colorScheme.primary
                          : themeData.errorColor,
                      fontWeight: 500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
