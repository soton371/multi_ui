import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/food/FoodCheckoutScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'FoodProductScreen.dart';

class FoodCartScreen extends StatefulWidget {
  @override
  _FoodCartScreenState createState() => _FoodCartScreenState();
}

class _FoodCartScreenState extends State<FoodCartScreen> {
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
                    "Cart",
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
                              left: MySize.size24!, right: MySize.size24!),
                          child: Column(
                            children: <Widget>[
                              SingleCartItem(
                                  image: './assets/food/food-7.jpg',
                                  name: "Food dish",
                                  price: 15.99,
                                  qty: 4),
                              SingleCartItem(
                                  image: './assets/food/food-8.jpg',
                                  name: "Shepherd's Pie",
                                  price: 19.79,
                                  qty: 1),
                              SingleCartItem(
                                  image: './assets/food/food-9.jpg',
                                  name: "Bangers",
                                  price: 39.79,
                                  qty: 2),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Subtotal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600)),
                                  Text("\$ 39.99",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size8!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Charges \& Taxes",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600)),
                                    Text("\$ 9.00",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600)),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size8!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Total",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 700)),
                                    Text("\$ 49.99",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 700)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24!),
                          child: Center(
                            child: ElevatedButton(

                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FoodCheckoutScreen()));
                              },
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                              ),
                              child: Text(
                                "Checkout".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: 0.4,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: 600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))));
      },
    );
  }


}

class SingleCartItem extends StatefulWidget {

  final String? image,name;
  final double? price;
  final int qty;

  const SingleCartItem({Key? key, this.image, this.name, this.price, required this.qty}) : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {

  late ThemeData themeData;
  late int qty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qty = widget.qty;
  }



  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: MySize.size16!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodProductScreen()));
              },
              child: Image(
                image: AssetImage(widget.image!),
                height: MySize.size100,
                width: MySize.size100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MySize.size100,
              margin: EdgeInsets.only(left: MySize.size16!),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.name!,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size8!),
                    child: Text(
                      "\$ " + widget.price.toString(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size8!),
                    child: Text(
                      "customize",
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.caption,
                        fontSize: 12,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  qty.toString(),
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size4!),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          if(qty>1)
                            setState(() {
                              qty--;
                            });
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size6!),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.minus,
                            size: MySize.size18,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            qty++;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size6!),
                          margin: EdgeInsets.only(left: MySize.size8!),
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.plus,
                            size: MySize.size18,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

