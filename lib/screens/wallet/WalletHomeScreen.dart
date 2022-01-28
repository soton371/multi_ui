import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class WalletHomeScreen extends StatefulWidget {
  @override
  _WalletHomeScreenState createState() => _WalletHomeScreenState();
}

class _WalletHomeScreenState extends State<WalletHomeScreen> {
  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                    ),
                  ),
                  title: Text("Wallet",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  child: Icon(
                    MdiIcons.flashOutline,
                    size: MySize.size26,
                  ),
                ),
                body: ListView(
                  children: <Widget>[
                    _CardWidget(),
                    Container(
                      padding: EdgeInsets.only(
                          left: MySize.size16!,
                          right: MySize.size16!,
                          top: MySize.size16!),
                      child: Text(
                        "RECENT",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size12!),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: MySize.size8!),
                              child: ClipOval(
                                child: Material(
                                  color: themeData.colorScheme.primary,
                                  // button color
                                  child: InkWell(
                                    splashColor: Colors.white,
                                    // inkwell color
                                    child: SizedBox(
                                        width: MySize.size56,
                                        height: MySize.size56,
                                        child: Icon(
                                          MdiIcons.plus,
                                          size: MySize.size28,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        )),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                            _RecentWidget(
                              image: "./assets/images/avatar-4.jpg",
                              name: 'Mark',
                            ),
                            _RecentWidget(
                              image: "./assets/images/avatar.jpg",
                              name: 'Shannan',
                            ),
                            _RecentWidget(
                              image: "./assets/images/avatar-3.jpg",
                              name: 'Talia',
                            ),
                            _RecentWidget(
                              image: "./assets/images/avatar-2.jpg",
                              name: 'Shauna',
                            ),
                            _RecentWidget(
                              image: "./assets/images/avatar-4.jpg",
                              name: 'Paul',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size24!),
                      child: Text(
                        "LAST TRANSACTION",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 700,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: MySize.size8!, right: MySize.size8!, top: MySize.size8!),
                        child: Column(
                          children: <Widget>[
                            _TransactionWidget(
                                name: "Liana Fitzgeraldl",
                                date: "29 may 2020",
                                amount: 177,
                                isSend: false),
                            Divider(
                              height: 0,
                            ),
                            _TransactionWidget(
                                name: "Natalia Dyer",
                                date: "14 dec 2019",
                                amount: 99,
                                isSend: true),
                            Divider(
                              height: 0,
                            ),
                            _TransactionWidget(
                                name: "Talia",
                                date: "6 June 2019",
                                amount: 100,
                                isSend: true),
                            Divider(
                              height: 0,
                            ),
                            _TransactionWidget(
                                name: "Shauna Mark",
                                date: "29 dec 2019",
                                amount: 160,
                                isSend: true),
                            Divider(
                              height: 0,
                            ),
                            _TransactionWidget(
                                name: "Natalia Dyer",
                                date: "2 dec 2019",
                                amount: 19,
                                isSend: true),
                            Divider(
                              height: 0,
                            ),
                            _TransactionWidget(
                                name: "Paul Rip",
                                date: "4 dec 2019",
                                amount: 62,
                                isSend: true),
                            Container(
                              padding: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size16!),
                              child: SizedBox(
                                  width: MySize.size20,
                                  height: MySize.size20,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          themeData.colorScheme.primary),
                                      strokeWidth: 1.5)),
                            )
                          ],
                        ))
                  ],
                )));
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Quick Action",
                      style: themeData.textTheme.subtitle1!.merge(TextStyle(
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphone,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.subwayVariant,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gasCylinder,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.lightbulbOutline,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.television,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gold,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphoneAndroid,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.googlePlay,
                                      actionText: 'G play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.umbrellaOutline,
                                      actionText: 'Insurance',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _RecentWidget extends StatelessWidget {
  final String image, name;

  _RecentWidget({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: MySize.size16!),
      child: Column(
        children: <Widget>[
          Container(
            width: MySize.size56,
            height: MySize.size56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Text(name,
              style: themeData.textTheme.bodyText2!.merge(TextStyle(
                  color: themeData.colorScheme.onBackground,
                  letterSpacing: 0.15,
                  height: 1.7)))
        ],
      ),
    );
  }
}

class _TransactionWidget extends StatefulWidget {
  final bool isSend;
  final String name, date;
  final int amount;

  _TransactionWidget(
      {Key? key,
      this.isSend = false,
      required this.name,
      required this.date,
      required this.amount})
      : super(key: key);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<_TransactionWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
      child: Container(
        padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size8!, bottom: MySize.size8!),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size8!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            fontWeight: 600,
                            letterSpacing: 0)),
                    Text(widget.date,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 500)),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Text(widget.isSend ? "- " : "+ ",
                    style:
                        AppTheme.getTextStyle(themeData.textTheme.subtitle1)),
                Text("\$ " + widget.amount.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        fontWeight: 600)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: PageController(initialPage: 1, viewportFraction: 0.9),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size24!, right: MySize.size8!),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 0.7, color: themeData.colorScheme.surface),
              color: Color(0xffcdcdcd),
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              boxShadow: [
                BoxShadow(
                  color: themeData.cardTheme.shadowColor!.withAlpha(28),
                  blurRadius: 3,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Mastercard",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline5,
                        fontWeight: 700, color: Colors.black)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("END BALANCE",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.overline,
                            fontWeight: 600,
                            color: Colors.black)),
                    Text("\$ 12,000",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 700,
                            letterSpacing: 0.3,
                            color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("1457 XXXX XXXX 2145",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 600,
                            letterSpacing: 0.3,
                            color: Colors.black)),
                    Text("08/26",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 700,
                            color: Colors.black)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MySize.size8!, top: MySize.size8!, bottom: MySize.size24!, right: MySize.size8!),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 0.7, color: themeData.colorScheme.surface),
              color: Color(0xffffe681),
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              boxShadow: [
                BoxShadow(
                  color: themeData.cardTheme.shadowColor!.withAlpha(28),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Visa",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline5,
                        fontWeight: 700, color: Colors.black)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("END BALANCE",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.overline,
                            fontWeight: 600,
                            color: Colors.black)),
                    Text("\$ 28,748",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 700,
                            letterSpacing: 0.3,
                            color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("2486 XXXX XXXX 6842",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 600,
                            letterSpacing: 0.3,
                            color: Colors.black)),
                    Text("07/25",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 600,
                            color: Colors.black)),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size24!, left: MySize.size8!),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 0.7, color: themeData.colorScheme.surface),
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              boxShadow: [
                BoxShadow(
                  color: themeData.cardTheme.shadowColor!.withAlpha(28),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MdiIcons.plus,
                      color: themeData.colorScheme.onPrimary,
                    ),
                    SizedBox(
                      width: MySize.size8,
                    ),
                    Text("Add card".toUpperCase(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            letterSpacing: 0.8,
                            fontWeight: 700,
                            color: themeData.colorScheme.onPrimary)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(16),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: MySize.size52,
                    height: MySize.size52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size2),
            child: Text(
              actionText,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 700),
            ),
          )
        ],
      ),
    );
  }
}
