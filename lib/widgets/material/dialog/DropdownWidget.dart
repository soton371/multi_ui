import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<int> _cartQtyList;

  @override
  void initState() {
    super.initState();
    _cartQtyList = [5, 2, 4];
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
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer2,
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(MdiIcons.chevronLeft)),
                  title: Text(
                    "Dropdown",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight: 600),
                  ),
                ),
                key: _scaffoldKey,
                body: Container(
                  color: customAppTheme.bgLayer2,
                  child: ListView(
                    padding: EdgeInsets.only(
                        left: MySize.size24!,
                        right: MySize.size24!,
                        top: MySize.size8!),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          singleCartItem(
                              image:
                                  './assets/images/shopping/product/product-5.jpg',
                              price: 39.99,
                              name: 'Seeds',
                              index: 0),
                          singleCartItem(
                              image:
                                  './assets/images/shopping/product/product-7.jpg',
                              price: 24.99,
                              name: 'Forbes',
                              index: 1),
                          singleCartItem(
                              image:
                                  './assets/images/shopping/product/product-8.jpg',
                              price: 12.99,
                              name: 'Sandals',
                              index: 2),
                        ],
                      ),
                      Divider(
                        height: MySize.size24,
                      ),
                      _CardBillWidget(),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        child: ElevatedButton(

                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "\$ 449.89",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        letterSpacing: 0.3,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(MySize.size10!),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primaryVariant,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  MdiIcons.cartArrowRight,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size18,
                                ),
                              )
                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleCartItem({required String image, required String name, double? price, required int index}) {
    final GlobalKey _simpleMenuKey = new GlobalKey();
    List<int> _list = new List<int>.generate(5, (i) => i + 1);

    return Container(
      margin: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            child: Image.asset(
              image,
              height: MySize.screenWidth * 0.23,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              height: MySize.screenWidth * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: PopupMenuButton(
                            key: _simpleMenuKey,
                            onSelected: (dynamic item) {
                              setState(() {
                                _cartQtyList[index] = item;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return _list.map((int option) {
                                return PopupMenuItem(
                                  value: option,
                                  height: MySize.size36!,
                                  child: Text(option.toString(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground)),
                                );
                              }).toList();
                            },
                            color: themeData.backgroundColor,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size12!,
                                  right: MySize.size12!,
                                  top: MySize.size8!,
                                  bottom: MySize.size8!),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!)),
                                color: customAppTheme.bgLayer1,
                                border: Border.all(
                                    color: customAppTheme.bgLayer3, width: 1),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    _cartQtyList[index].toString(),
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size4!),
                                    child: Icon(
                                      MdiIcons.chevronDown,
                                      size: MySize.size22,
                                      color: themeData.colorScheme.onBackground,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Text(
                        "\$$price",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: MySize.size16!),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Subtotal',
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
              Text(
                "\$ 399.99",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Charges",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                  ),
                ),
                Text(
                  "+ \$ 59.59",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                  ),
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
                  "Discount",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                  ),
                ),
                Text(
                  "- \$ 9.99",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
