import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class WalletPaymentScreen extends StatefulWidget {
  @override
  _WalletPaymentScreenState createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  late ThemeData themeData;

  int _selectedOption = 1;

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
                  title: Text("Payment",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 700)),
                ),
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!, top: MySize.size24!),
                      child: Text(
                        "RECENT PAYEE",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 700,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size20!, right: MySize.size20!, top: MySize.size24!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: MySize.size8!, left: MySize.size8!),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.background,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size16!))),
                              padding: EdgeInsets.all(MySize.size16!),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(MySize.size8!),
                                      child: Image(
                                          image: AssetImage(
                                              './assets/images/avatar-1.jpg')),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    "Carlos",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600),
                                  )),
                                  Text(
                                    "1874596",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.overline,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: MySize.size8!, left: MySize.size8!),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.background,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size16!))),
                              padding: EdgeInsets.all(MySize.size16!),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: MySize.size8!, right: MySize.size8!, bottom: MySize.size8!),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(MySize.size8!),
                                      child: Image(
                                          image: AssetImage(
                                              './assets/images/avatar-2.jpg')),
                                    ),
                                  ),
                                  Container(
                                      child: Text(
                                    "Caprice",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600),
                                  )),
                                  Text(
                                    "2589631",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.overline,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(left: MySize.size8!, right: MySize.size8!),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size16!))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(MySize.size16!),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: MySize.size8!, right: MySize.size8!, bottom: MySize.size8!),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(MySize.size8!),
                                          child: Image(
                                              image: AssetImage(
                                                  './assets/images/avatar-3.jpg')),
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                        "Jenson",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            fontWeight: 700),
                                      )),
                                      Text(
                                        "1598746",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.overline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(200),
                                            letterSpacing: 0),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(230),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size16!))),
                                  ),
                                ),
                                Text(
                                  "+5",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 700,
                                      color: themeData.colorScheme.onPrimary),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size24!),
                      child: Text(
                        "SELECT OPTION",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 700,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(220)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!, left: MySize.size20!, right: MySize.size20!),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedOption = 0;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: MySize.size4!, right: MySize.size4!),
                                  child: OptionWidget(
                                    iconData: MdiIcons.bankOutline,
                                    text: "Bank",
                                    isSelected: _selectedOption == 0,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedOption = 1;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: MySize.size4!, right: MySize.size4!),
                                  child: OptionWidget(
                                    iconData: MdiIcons.creditCardOutline,
                                    text: "Card",
                                    isSelected: _selectedOption == 1,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedOption = 2;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: MySize.size4!, right: MySize.size4!),
                                  child: OptionWidget(
                                    iconData: MdiIcons.qrcode,
                                    text: "QR",
                                    isSelected: _selectedOption == 2,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedOption = 3;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: MySize.size4!, right: MySize.size4!),
                                  child: OptionWidget(
                                    iconData: MdiIcons.mapMarkerRadiusOutline,
                                    text: "Near By",
                                    isSelected: _selectedOption == 3,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!, top: MySize.size24!),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.background,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size16!))),
                            padding: EdgeInsets.all(MySize.size12!),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(MySize.size4!),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(MySize.size8!),
                                    child: Icon(
                                      MdiIcons.accountOutline,
                                      color: themeData.colorScheme.onPrimary,
                                      size: MySize.size22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          letterSpacing: 0.1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            letterSpacing: 0.1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                        border:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(MySize.size8!),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(MySize.size8!),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(MySize.size8!),
                                            ),
                                            borderSide: BorderSide.none),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.background,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(MySize.size16!))),
                            padding: EdgeInsets.all(MySize.size12!),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(MySize.size4!),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(MySize.size8!),
                                    child: Icon(
                                      MdiIcons.currencyUsd,
                                      color: themeData.colorScheme.onPrimary,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          letterSpacing: 0.1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        hintText: "Amount",
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            letterSpacing: 0.1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                        border:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder:  OutlineInputBorder(
                                            borderRadius:
                                                 BorderRadius.all(
                                               Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(0),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.primaryColor.withAlpha(24),
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(24),
                            child: ElevatedButton(

                              onPressed: () {},
                              child: Text(
                                "Press \& Hold to Transfer Money",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary,
                                    letterSpacing: 0.3),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                              ),                            ),
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

class OptionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;

  OptionWidget(
      {Key? key,
      required this.iconData,
      required this.text,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySize.size4!, right: MySize.size4!),
      decoration: BoxDecoration(
        color: isSelected
            ? themeData.colorScheme.primary
            : themeData.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(24),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground,
            size: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8!),
            child: Text(
              text,
              style: AppTheme.getTextStyle(
                themeData.textTheme.caption,
                fontWeight: 600,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
              ),
            ),
          )
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
