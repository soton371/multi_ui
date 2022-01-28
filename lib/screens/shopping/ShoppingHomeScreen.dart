/*
* File : Shopping Home
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingProductScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingHomeScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin<ShoppingHomeScreen> {
  late ThemeData themeData;



  @override
  bool get wantKeepAlive => true;

  bool _grocery = false, _cloth = true, _liquor = false, _food = true;

  Widget build(BuildContext context) {
    super.build(context);
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  backgroundColor: themeData.backgroundColor,
                  body: ListView(
                    padding: EdgeInsets.all(MySize.size16!),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: themeData.colorScheme.surface),
                          color: themeData.cardTheme.color,
                          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(18),
                              blurRadius: 4,
                              offset:
                                  Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _grocery = !_grocery;
                                  });
                                },
                                child: _CategoryWidget(
                                  iconData: MdiIcons.cartOutline,
                                  actionText: "Grocery",
                                  isSelected: _grocery,
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _cloth = !_cloth;
                                  });
                                },
                                child: _CategoryWidget(
                                  iconData: MdiIcons.hanger,
                                  actionText: "Cloth",
                                  isSelected: _cloth,
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _liquor = !_liquor;
                                  });
                                },
                                child: _CategoryWidget(
                                  iconData: MdiIcons.glassWine,
                                  actionText: "Liquor",
                                  isSelected: _liquor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _food = !_food;
                                  });
                                },
                                child: _CategoryWidget(
                                    iconData: MdiIcons.food,
                                    isSelected: _food,
                                    actionText: "Food"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: MySize.size24!),
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
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Colorful sandal",
                          image:
                              './assets/images/shopping/product/product-8.jpg',
                          shopName: 'Lee Shop',
                          star: 3.8,
                          price: 14780,
                          buildContext: context,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Yellow cake",
                          image:
                              './assets/images/shopping/product/product-1.jpg',
                          shopName: 'Agus Bakery',
                          buildContext: context,
                          star: 4,
                          price: 15000,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Toffees",
                          image:
                              './assets/images/shopping/product/product-2.jpg',
                          shopName: 'Toffee Bakery',
                          buildContext: context,
                          star: 5,
                          price: 12500,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        child: Text("Recommended",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Sweet Gems",
                          image:
                              './assets/images/shopping/product/product-5.jpg',
                          shopName: 'El Primo',
                          buildContext: context,
                          star: 3,
                          price: 14700,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Lipsticks",
                          image:
                              './assets/images/shopping/product/product-4.jpg',
                          shopName: 'Bee Lipstore',
                          buildContext: context,
                          star: 4,
                          price: 14785,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: _ProductListWidget(
                          name: "Candies",
                          image:
                              './assets/images/shopping/product/product-3.jpg',
                          shopName: 'Bee Lipstore',
                          buildContext: context,
                          star: 4,
                          price: 14785,
                        ),
                      ),
                    ],
                  )),
            ));
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
    return InkWell(
      onTap: () {
        Navigator.push(widget.buildContext,
            MaterialPageRoute(builder: (context) => ShoppingProductScreen(heroTag: key,image: widget.image,)));
      },
      child: Container(
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
        padding: EdgeInsets.all(MySize.size16!),
        child: Row(
          children: <Widget>[
            Hero(
              tag: key,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                child: Image.asset(
                  widget.image,
                  height: MySize.size90,
                  fit: BoxFit.fill,
                ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.name,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                        Icon(
                          MdiIcons.heart,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(80),
                          size: 22,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Generator.buildRatingStar(
                            rating: widget.star,
                            size: MySize.size16,
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size4!),
                          child: Text(widget.star.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
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
                              size: MySize.size20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size4!),
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
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;
  final bool isSelected;

  const _CategoryWidget(
      {Key? key,
      required this.iconData,
      required this.actionText,
      this.isSelected = false})
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
              color: isSelected
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.primary.withAlpha(20),
              child: SizedBox(
                  width: MySize.size52,
                  height: MySize.size52,
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.primary,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size8!),
            child: Text(
              actionText,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600, letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }
}
