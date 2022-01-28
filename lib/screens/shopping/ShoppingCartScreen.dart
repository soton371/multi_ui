/*
* File : Shopping Cart
* Version : 1.0.0
* */

import 'dart:ui';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingDeliveryAddressScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingOrderStatusScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late ThemeData themeData;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  elevation: 2,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text(
                    "Cart",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600),
                  ),
                  bottom: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                          child: Text("Active",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: _currentIndex == 0
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground,
                                  fontWeight:600))),
                      Tab(
                          child: Text("Past Order",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: _currentIndex == 1
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground,
                                  fontWeight: 600))),
                    ],
                    labelColor: themeData.colorScheme.primary,
                    indicatorColor: themeData.colorScheme.primary,
                    unselectedLabelColor: themeData.colorScheme.onBackground,
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    _CartScreen(),
                    ShoppingOrderStatusScreen(),
                  ],
                )));
      },
    );
  }
}

class _CartScreen extends StatefulWidget {
  @override
  __CartScreenState createState() => __CartScreenState();
}

class __CartScreenState extends State<_CartScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.backgroundColor,
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ListView(
                        padding: EdgeInsets.all(0),
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                            child: _CartItemWidget(
                                name: "Cup Cake",
                                image:
                                    './assets/images/shopping/product/product-1.jpg',
                                price: 159,
                                count: 2),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                            child: _CartItemWidget(
                                name: "Woo Sandal",
                                image:
                                    './assets/images/shopping/product/product-8.jpg',
                                price: 299,
                                count: 1),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                            child: _CartItemWidget(
                                name: "High-Low ",
                                image:
                                    './assets/images/shopping/product/product-7.jpg',
                                price: 459,
                                count: 3),
                          ),
                          _CardBillWidget(),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size8!)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(20),
                                      blurRadius: 2,
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
                                                  ShoppingDeliveryAddressScreen()));
                                    },
                                    child: Text("CHECKOUT",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            letterSpacing: 0.5))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: MySize.size16!, horizontal: MySize.size24!),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
              ),
              Text(
                "\$  299.99",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Shipping cost",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
                Text(
                  "\$  49.59",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Taxes",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
                Text(
                  "\$  29.99",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600),
                ),
                Text(
                  "\$  399.89",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemWidget extends StatefulWidget {
  final String name, image;
  final int price, count;

  const _CartItemWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  __CartItemWidgetState createState() => __CartItemWidgetState();
}

class __CartItemWidgetState extends State<_CartItemWidget> {
  late ThemeData themeData;

  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(26),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            child: Image.asset(
              widget.image,
              height: 90.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              height: MySize.size90,
              margin: EdgeInsets.only(left: MySize.size16!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600,
                          letterSpacing: 0)),
                  Text(
                    "\$ " + widget.price.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 700, letterSpacing: 0),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: themeData.colorScheme.primary.withAlpha(28),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              if (_count> 1) {
                                setState(() {
                                  _count--;
                                  print("tapped");
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: MySize.size10!, left: MySize.size10!, top: MySize.size8!, bottom: MySize.size8!),
                              child: Icon(
                                MdiIcons.minus,
                                color: themeData.colorScheme.onPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                    child: child, scale: animation);
                              },
                              child: Text(
                                '$_count',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onPrimary),
                                key: ValueKey<int?>(_count),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _count++;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: MySize.size10!, left: MySize.size10!, top: MySize.size8!, bottom: MySize.size8!),
                              child: Icon(MdiIcons.plus,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
