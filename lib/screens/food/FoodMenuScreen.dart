
import 'package:UIKit/screens/food/FoodProductScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class FoodMenuScreen extends StatefulWidget {
  @override
  _FoodMenuScreenState createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  List<bool> _dataExpansionPanel = [false, false, true, false, false];

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24!) / ((width / 2 - MySize.size24!) + 50);
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
                  leading: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(
                    "Menu",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      children: <Widget>[
                        ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _dataExpansionPanel[index] = !isExpanded;
                            });
                          },
                          animationDuration: Duration(milliseconds: 500),
                          children: <ExpansionPanel>[
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text("Pizza",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: isExpanded
                                                ? themeData.colorScheme.primary
                                                : themeData
                                                    .colorScheme.onBackground,
                                            fontWeight:
                                                isExpanded ? 700 : 600)),
                                  );
                                },
                                body: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      left: MySize.size16!,
                                      right: MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      singleMenuItem(
                                          image: './assets/food/food-1.jpg',
                                          name: 'Peperoni pizza',
                                          price: 25.99,
                                          rate: 4.5),
                                      singleMenuItem(
                                          image: './assets/food/food-2.jpg',
                                          name: 'Meat Pizza',
                                          price: 21.99,
                                          rate: 3.5),
                                      singleMenuItem(
                                          image: './assets/food/food-3.jpg',
                                          name: 'Margherita',
                                          price: 24.79,
                                          rate: 4),
                                      singleMenuItem(
                                          image: './assets/food/food-4.jpg',
                                          name: 'Hawaiian Pizza',
                                          price: 29.80,
                                          rate: 5),
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[0]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text("Pasta",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: isExpanded
                                                ? themeData.colorScheme.primary
                                                : themeData
                                                    .colorScheme.onBackground,
                                            fontWeight:
                                                isExpanded ? 700 : 600)),
                                  );
                                },
                                body: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      left: MySize.size16!,
                                      right: MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      singleMenuItem(
                                          image: './assets/food/pasta-1.jpg',
                                          name: 'Peperoni pizza',
                                          price: 25.99,
                                          rate: 4.5),
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[1]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text("Burger",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: isExpanded
                                                ? themeData.colorScheme.primary
                                                : themeData
                                                    .colorScheme.onBackground,
                                            fontWeight:
                                                isExpanded ? 700 : 600)),
                                  );
                                },
                                body: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      left: MySize.size16!,
                                      right: MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      singleMenuItem(
                                          image: './assets/food/burger-1.jpg',
                                          name: 'Peperoni pizza',
                                          price: 25.99,
                                          rate: 4.5),
                                      singleMenuItem(
                                          image: './assets/food/burger-2.jpg',
                                          name: 'Meat Pizza',
                                          price: 21.99,
                                          rate: 3.5),
                                      singleMenuItem(
                                          image: './assets/food/burger-3.jpg',
                                          name: 'Margherita',
                                          price: 24.79,
                                          rate: 4),
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[2]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text(
                                        "Beverage",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            color: isExpanded
                                                ? themeData.colorScheme.primary
                                                : themeData
                                                    .colorScheme.onBackground,
                                            fontWeight:
                                                isExpanded ? 700 : 600)),
                                  );
                                },
                                body: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      left: MySize.size16!,
                                      right: MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      singleMenuItem(
                                          image: './assets/food/beverage-1.jpg',
                                          name: 'Peperoni pizza',
                                          price: 25.99,
                                          rate: 4.5),
                                      singleMenuItem(
                                          image: './assets/food/beverage-2.jpg',
                                          name: 'Meat Pizza',
                                          price: 21.99,
                                          rate: 3.5),
                                      singleMenuItem(
                                          image: './assets/food/beverage-3.jpg',
                                          name: 'Margherita',
                                          price: 24.79,
                                          rate: 4),
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[3]),
                            ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text("Dessert",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: isExpanded
                                                ? themeData.colorScheme.primary
                                                : themeData
                                                    .colorScheme.onBackground,
                                            fontWeight:
                                                isExpanded ? 700 : 600)),
                                  );
                                },
                                body: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MySize.size16!,
                                      left: MySize.size16!,
                                      right: MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      singleMenuItem(
                                          image: './assets/food/dessert-1.jpg',
                                          name: 'Peperoni pizza',
                                          price: 25.99,
                                          rate: 4.5),
                                      singleMenuItem(
                                          image: './assets/food/dessert-2.jpg',
                                          name: 'Meat Pizza',
                                          price: 21.99,
                                          rate: 3.5),
                                      singleMenuItem(
                                          image: './assets/food/dessert-3.jpg',
                                          name: 'Margherita',
                                          price: 24.79,
                                          rate: 4),
                                      singleMenuItem(
                                          image: './assets/food/dessert-4.jpg',
                                          name: 'Hawaiian Pizza',
                                          price: 29.80,
                                          rate: 5),
                                    ],
                                  ),
                                ),
                                isExpanded: _dataExpansionPanel[4]),
                          ],
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleMenuItem(
      {required String image, required String name, required double rate, double? price}) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: MySize.size16!),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              child: Image(
                image: AssetImage(image),
                height: MySize.size64,
                width: MySize.size64,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size8!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      name,
                      style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: MySize.size4!),
                        child: Generator.buildRatingStar(
                            rating: rate,
                            inactiveColor: themeData.colorScheme.onBackground,
                            size: MySize.size18)),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size4!),
                      child: Text(
                        "\$" + price.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MySize.size12!,
                  right: MySize.size12!,
                  top: MySize.size4!,
                  bottom: MySize.size4!),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: themeData.colorScheme.onBackground.withAlpha(120),
                      width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
              child: Text("Add",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontSize: 12,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600)),
            )
          ],
        ),
      ),
    );
  }
}
