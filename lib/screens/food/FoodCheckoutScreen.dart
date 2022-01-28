import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'FoodFeedbackScreen.dart';

class FoodCheckoutScreen extends StatefulWidget {
  @override
  _FoodCheckoutScreenState createState() => _FoodCheckoutScreenState();
}

class _FoodCheckoutScreenState extends State<FoodCheckoutScreen> {
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
                appBar: AppBar(
                  elevation: 0,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(MdiIcons.chevronLeft,
                        size: MySize.size24,
                        color: themeData.appBarTheme.iconTheme!.color),
                  ),
                  title: Text(
                    "Checkout",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size8!),
                          child: Text(
                            "Saved Address",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size16!),
                            child: savedAddressWidget()),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          child: Text(
                            "Add Address",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size16!),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Address",
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    prefixIcon: Icon(
                                      MdiIcons.mapMarkerOutline,
                                      size: MySize.size22,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size16!),
                                child: TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      letterSpacing: 0.1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                    hintText: "Delivery note",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                themeData.colorScheme.surface,
                                            width: 1.2)),
                                    prefixIcon: Icon(
                                      MdiIcons.informationOutline,
                                      size: MySize.size22,
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          child: Text(
                            "Payment Method",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size8!),
                          child: paymentMethodWidget(),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size24!,top: MySize.size16!),
                          child: Text(
                            "Order amount : \$39.99",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size4!)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(20),
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
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
                                              FoodFeedbackScreen()));
                                },
                                child: Text(
                                  "Place Order".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary),
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
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
