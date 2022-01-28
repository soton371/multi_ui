/*
* File : Shopping Products Card
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ShoppingCardWidget extends StatefulWidget {
  @override
  _ShoppingCardWidgetState createState() => _ShoppingCardWidgetState();
}

class _ShoppingCardWidgetState extends State<ShoppingCardWidget> {

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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Shopping",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: ListView(
                  padding: EdgeInsets.only(left:16,right: 16),
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: _ProductListWidget(
                          name: "Cosmic bang",
                          image:
                              './assets/images/shopping/product/product-7.jpg',
                          shopName: 'Den cosmics',
                          star: 4.5,
                          price: 12000,
                          buildContext: context,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: _ProductListWidget(
                        name: "Colorful sandal",
                        image: './assets/images/shopping/product/product-8.jpg',
                        shopName: 'Lee Shop',
                        star: 3.8,
                        price: 14780,
                        buildContext: context,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: _ProductListWidget(
                        name: "Yellow cake",
                        image: './assets/images/shopping/product/product-1.jpg',
                        shopName: 'Agus Bakery',
                        buildContext: context,
                        star: 4,
                        price: 15000,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16,bottom: 16),
                      child: _ProductListWidget(
                        name: "Toffees",
                        image: './assets/images/shopping/product/product-2.jpg',
                        shopName: 'Toffee Bakery',
                        buildContext: context,
                        star: 5,
                        price: 12500,
                      ),
                    ),
                  ],
                ))));
      },
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;
  final BuildContext buildContext;

  const _ProductListWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.shopName,
      required this.star,
      required this.price,
      required this.buildContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    String key = Generator.randomString(10);
    return Container(
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(26),
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Hero(
            tag: key,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                widget.image,
                height: 90.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 700,
                              letterSpacing: 0)),
                      Icon(
                        MdiIcons.heart,
                        color: themeData.colorScheme.onBackground.withAlpha(80),
                        size: 22,
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Generator.buildRatingStar(
                          rating: widget.star,
                          size: 16,
                          inactiveColor: themeData.colorScheme.onBackground),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text(widget.star.toString(),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 700)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.storeOutline,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                            size: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              widget.shopName,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(200),
                                  fontWeight: 500),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "\$ " + widget.price.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 700),
                      )
                    ],
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
