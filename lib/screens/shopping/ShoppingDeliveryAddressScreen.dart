/*
* File : Shopping Delivery
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingPaymentScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingDeliveryAddressScreen extends StatefulWidget {
  @override
  _ShoppingDeliveryAddressScreenState createState() =>
      _ShoppingDeliveryAddressScreenState();
}

class _ShoppingDeliveryAddressScreenState
    extends State<ShoppingDeliveryAddressScreen> {
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
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Delivery Address",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(MySize.size24!),
                        decoration: BoxDecoration(
                          color: themeData.cardTheme.color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size16!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(28),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Address 1",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon:
                                    Icon(MdiIcons.mapMarkerOutline, size: MySize.size24),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            Divider(
                              height: 0,
                            ),
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Address 2",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.mapMarkerPlusOutline,
                                  size: MySize.size24,
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            Divider(
                              height: 0,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: "City",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      prefixIcon: Icon(
                                        MdiIcons.homeCityOutline,
                                        size: MySize.size24,
                                      ),
                                    ),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: MySize.size8!),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500,
                                          letterSpacing: 0.2),
                                      decoration: InputDecoration(
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            fontWeight: 500,
                                            letterSpacing: 0,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180)),
                                        hintText: "PIN",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        prefixIcon: Icon(
                                          MdiIcons.numeric,
                                          size: MySize.size24,
                                        ),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(MySize.size24!),
                        decoration: BoxDecoration(
                          color: themeData.cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size16!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(28),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon:
                                    Icon(MdiIcons.emailOutline, size: MySize.size24),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Divider(
                              height: 0,
                            ),
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Contact",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.phoneOutline,
                                  size: MySize.size24,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            Divider(
                              height: 0,
                            ),
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Delivery note",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.informationOutline,
                                  size: MySize.size24,
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size8!),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(MySize.size8!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingPaymentScreen()));
                                },
                                child: Text("NEXT",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary,
                                        letterSpacing: 0.5))),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
