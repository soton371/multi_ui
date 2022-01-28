import 'package:UIKit/screens/food/FoodCartScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'FoodFeedbackScreen.dart';

class FoodProductScreen extends StatefulWidget {
  @override
  _FoodProductScreenState createState() => _FoodProductScreenState();
}

class _FoodProductScreenState extends State<FoodProductScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool? isQuick = false;

  int selectedAddress = 0;

  int selectedSize = 0;
  bool toppingCheese = false,
      toppingTomato = true,
      toppingCorn = false,
      toppingChicken = false;

  int getPrice() {
    return 29 * (selectedSize + 1) +
        (toppingCheese ? 2 : 0) +
        (toppingTomato ? 3 : 0) +
        (toppingCorn ? 5 : 0) +
        (toppingChicken ? 10 : 0);
  }

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
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        Container(
                            child: Stack(
                          children: <Widget>[
                            Image(
                              image: AssetImage('./assets/food/food-l3.jpg'),
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                                top: MySize.size16,
                                left: MySize.size16,
                                child: SafeArea(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        MdiIcons.chevronLeft,
                                        color: Colors.black,
                                      )),
                                ))
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!, top: MySize.size24!),
                          child: Text(
                            "Customisation",
                            style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              letterSpacing: 0.3,
                              color: themeData.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 700,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24!, right: MySize.size24!),
                            child: Divider()),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!, top: MySize.size16!),
                          child: Text(
                            "Select Size",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16!),
                          child: sizeSelector(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!, top: MySize.size24!),
                          child: Text(
                            "Topping",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size8!,
                              left: MySize.size24!,
                              right: MySize.size24!),
                          child: toppingSelector(),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: Divider()),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size8!),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isQuick = !isQuick!;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Checkbox(
                                  value: isQuick,
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: themeData.colorScheme.primary,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isQuick = value;
                                    });
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: MySize.size4!),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Quick Order",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600,
                                            height: 1),
                                      ),
                                      Text(
                                        "Are you too hungry?",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            letterSpacing: 0,
                                            fontSize: 10,
                                            fontWeight: 400,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            height: 1.35),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size8!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Total \$" + getPrice().toString(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 800,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size4!)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(20),
                                      blurRadius: 4,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(

                                  onPressed: () {
                                    isQuick!
                                        ? quickOrderSheet(context)
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FoodCartScreen()));
                                  },
                                  child: Text(
                                    isQuick!
                                        ? "Order now".toUpperCase()
                                        : "Add to Cart".toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        letterSpacing: 0.5,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget sizeSelector() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedSize = 0;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size8!,
                  bottom: MySize.size8!),
              decoration: BoxDecoration(
                color: selectedSize == 0
                    ? themeData.colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                border:
                    Border.all(color: themeData.colorScheme.primary, width: 1),
              ),
              child: Text(
                "Small",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: selectedSize == 0
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: selectedSize == 0 ? 600 : 500,
                    letterSpacing: 0),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedSize = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size8!,
                  bottom: MySize.size8!),
              decoration: BoxDecoration(
                color: selectedSize == 1
                    ? themeData.colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                border:
                    Border.all(color: themeData.colorScheme.primary, width: 1),
              ),
              child: Text(
                "Medium",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: selectedSize == 1
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: selectedSize == 1 ? 600 : 500,
                    letterSpacing: 0),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedSize = 2;
              });
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size8!,
                  bottom: MySize.size8!),
              decoration: BoxDecoration(
                color: selectedSize == 2
                    ? themeData.colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size2)),
                border:
                    Border.all(color: themeData.colorScheme.primary, width: 1),
              ),
              child: Text(
                "Large",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: selectedSize == 2
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                    fontWeight: selectedSize == 2 ? 600 : 500,
                    letterSpacing: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget toppingSelector() {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                toppingCheese = !toppingCheese;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cheese",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Container(
                  height: MySize.size36,
                  width: MySize.size76,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size2)),
                    border: Border.all(
                        color: themeData.colorScheme.primary, width: 1),
                    color: toppingCheese
                        ? themeData.colorScheme.primary
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      toppingCheese ? "Added" : "Add \$2",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: toppingCheese
                              ? themeData.colorScheme.onPrimary
                              : themeData.colorScheme.onBackground),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8!),
            child: InkWell(
              onTap: () {
                setState(() {
                  toppingTomato = !toppingTomato;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tomato",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    height: MySize.size36,
                    width: MySize.size76,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size2)),
                      border: Border.all(
                          color: themeData.colorScheme.primary, width: 1),
                      color: toppingTomato
                          ? themeData.colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        toppingTomato ? "Added" : "Add \$3",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: toppingTomato
                                ? themeData.colorScheme.onPrimary
                                : themeData.colorScheme.onBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8!),
            child: InkWell(
              onTap: () {
                setState(() {
                  toppingCorn = !toppingCorn;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Corn",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    height: MySize.size36,
                    width: MySize.size76,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size2)),
                      border: Border.all(
                          color: themeData.colorScheme.primary, width: 1),
                      color: toppingCorn
                          ? themeData.colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        toppingCorn ? "Added" : "Add \$5",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: toppingCorn
                                ? themeData.colorScheme.onPrimary
                                : themeData.colorScheme.onBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8!),
            child: InkWell(
              onTap: () {
                setState(() {
                  toppingChicken = !toppingChicken;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Chicken",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    height: MySize.size36,
                    width: MySize.size76,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size2)),
                      border: Border.all(
                          color: themeData.colorScheme.primary, width: 1),
                      color: toppingChicken
                          ? themeData.colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        toppingChicken ? "Added" : "Add \$10",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: toppingChicken
                                ? themeData.colorScheme.onPrimary
                                : themeData.colorScheme.onBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void quickOrderSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: themeData.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size16!),
                        topRight: Radius.circular(MySize.size16!))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MySize.size24!,
                      left: MySize.size24!,
                      right: MySize.size24!,
                      bottom: MySize.size36!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Address",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        child: Container(
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      border: Border.all(
                                          color: themeData.colorScheme.primary,
                                          width: 0.8)),
                                  padding: EdgeInsets.only(
                                      left: MySize.size12!,
                                      right: MySize.size12!,
                                      top: MySize.size5!,
                                      bottom: MySize.size5!),
                                  child: Text(
                                    "Home",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: selectedAddress == 0
                                            ? themeData.colorScheme.onPrimary
                                            : themeData
                                                .colorScheme.onBackground,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      border: Border.all(
                                          color: themeData.colorScheme.primary,
                                          width: 0.8)),
                                  padding: EdgeInsets.only(
                                      left: MySize.size12!,
                                      right: MySize.size12!,
                                      top: MySize.size5!,
                                      bottom: MySize.size5!),
                                  child: Text(
                                    "Office",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: selectedAddress == 1
                                            ? themeData.colorScheme.onPrimary
                                            : themeData
                                                .colorScheme.onBackground,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      border: Border.all(
                                          color: themeData.colorScheme.primary,
                                          width: 0.8)),
                                  padding: EdgeInsets.only(
                                      left: MySize.size12!,
                                      right: MySize.size12!,
                                      top: MySize.size5!,
                                      bottom: MySize.size5!),
                                  child: Text(
                                    "Other",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color: selectedAddress == 2
                                            ? themeData.colorScheme.onPrimary
                                            : themeData
                                                .colorScheme.onBackground,
                                        fontWeight: 500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Food Wallet",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "Insufficient balance",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontSize: 12,
                                        color: themeData.errorColor,
                                        height: 1.1,
                                        fontWeight: 400),
                                  )
                                ],
                              ),
                            ),
                            TextButton(

                                onPressed: () {},
                                child: Text(
                                  "Add Money".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 600,
                                      letterSpacing: 0.3),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Order amount : \$39.99",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            ElevatedButton(
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
                                  "Place".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      letterSpacing: 0.3,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
