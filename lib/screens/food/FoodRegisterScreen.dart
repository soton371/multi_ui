import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/food/FoodFullApp.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'FoodLoginScreen.dart';

class FoodRegisterScreen extends StatefulWidget {
  @override
  _FoodRegisterScreenState createState() => _FoodRegisterScreenState();
}

class _FoodRegisterScreenState extends State<FoodRegisterScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int selectedAddress = 0;
  int? paymentMethod = 0;

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
            home: Scaffold(
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                              './assets/icons/food-outline.png',
                              color: themeData.colorScheme.primary,
                              width: 36,
                              height: 36,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size24!),
                            child: Text(
                              "Create account".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.background,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size16!))),
                                  padding: EdgeInsets.all(MySize.size12!),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(MySize.size6!),
                                        decoration: BoxDecoration(
                                            color:
                                                themeData.colorScheme.primary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8!))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size8!),
                                          child: Icon(
                                            MdiIcons.accountOutline,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: MySize.size20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16!),
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
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size16!))),
                                  padding: EdgeInsets.all(MySize.size12!),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(MySize.size6!),
                                        decoration: BoxDecoration(
                                            color:
                                                themeData.colorScheme.primary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8!))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size8!),
                                          child: Icon(
                                            MdiIcons.emailOutline,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: MySize.size20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16!),
                                          child: TextFormField(
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                letterSpacing: 0.1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                            decoration: InputDecoration(
                                              hintText: "Email Address",
                                              hintStyle: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle2,
                                                  letterSpacing: 0.1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size16!))),
                                  padding: EdgeInsets.all(MySize.size12!),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(MySize.size6!),
                                        decoration: BoxDecoration(
                                            color:
                                                themeData.colorScheme.primary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8!))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size8!),
                                          child: Icon(
                                            MdiIcons.lockOutline,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: MySize.size20,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16!),
                                          child: TextFormField(
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                letterSpacing: 0.1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                            decoration: InputDecoration(
                                              hintText: "Password",
                                              hintStyle: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle2,
                                                  letterSpacing: 0.1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(0),
                                            ),
                                            keyboardType: TextInputType.text,
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
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size12!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.primaryColor.withAlpha(24),
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodFullApp()));
                              },
                              child: Text(
                                "Register".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary,
                                    letterSpacing: 0.5),
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodLoginScreen()));
                              },
                              child: Text(
                                "I have already an account",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))));
      },
    );
  }

  Widget savedAddressWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAddress = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedAddress == 0
                      ? themeData.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                  border: Border.all(
                      color: themeData.colorScheme.primary, width: 0.8)),
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size5!,
                  bottom: MySize.size5!),
              child: Text(
                "Home",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: selectedAddress == 0
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: 500),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedAddress = 1;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              decoration: BoxDecoration(
                  color: selectedAddress == 1
                      ? themeData.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                  border: Border.all(
                      color: themeData.colorScheme.primary, width: 0.8)),
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size5!,
                  bottom: MySize.size5!),
              child: Text(
                "Office",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: selectedAddress == 1
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: 500),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedAddress = 2;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              decoration: BoxDecoration(
                  color: selectedAddress == 2
                      ? themeData.colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                  border: Border.all(
                      color: themeData.colorScheme.primary, width: 0.8)),
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size5!,
                  bottom: MySize.size5!),
              child: Text(
                "Other",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: selectedAddress == 2
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: 500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentMethodWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 0;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: paymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "G Pay",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 1;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: paymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Paypal",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 2;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: paymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Credit card",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                paymentMethod = 3;
              });
            },
            child: Row(
              children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: paymentMethod,
                  onChanged: (int? value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                Text(
                  "Cash on Delivery",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
