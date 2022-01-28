import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/food/FoodProductScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FoodFavouriteScreen extends StatefulWidget {
  @override
  _FoodFavouriteScreenState createState() => _FoodFavouriteScreenState();
}

class _FoodFavouriteScreenState extends State<FoodFavouriteScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

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
        return SafeArea(
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getThemeFromThemeMode(themeType),
              home: Scaffold(
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size16!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Favourite",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      color: themeData.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      fontWeight: 600),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: GridView.count(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  bottom: MySize.size16!,
                                  left: MySize.size24!,
                                  right: MySize.size24!),
                              crossAxisCount: 2,
                              childAspectRatio: findAspectRatio(
                                  MediaQuery.of(context).size.width),
                              crossAxisSpacing: MySize.size24!,
                              mainAxisSpacing: MySize.size24!,
                              children: <Widget>[
                                singleFood(
                                    image: './assets/food/dessert-3.jpg',
                                    name: 'Dessert',
                                    price: 14.99),
                                singleFood(
                                    image: './assets/food/beverage-3.jpg',
                                    name: 'Beverage',
                                    price: 14.99),
                                singleFood(
                                    image: './assets/food/food-1.jpg',
                                    name: 'Salad dish',
                                    price: 16.59),
                                singleFood(
                                    image: './assets/food/food-2.jpg',
                                    name: 'Food dish',
                                    price: 29.99),
                                singleFood(
                                    image: './assets/food/food-9.jpg',
                                    name: 'Pasta',
                                    price: 14.99),
                                singleFood(
                                    image: './assets/food/burger-2.jpg',
                                    name: 'Burger',
                                    price: 14.99),
                                singleFood(
                                    image: './assets/food/food-3.jpg',
                                    name: 'Pan Cake',
                                    price: 24.29),
                                singleFood(
                                    image: './assets/food/food-7.jpg',
                                    name: 'Salad',
                                    price: 14.99),
                              ],
                            ),
                          ),
                        ],
                      )))),
        );
      },
    );
  }

  Widget singleFood({required String image, required String name, double? price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: AssetImage(image),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: MySize.size8!, left: MySize.size8!),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: MySize.size4!),
                          child: Text(name,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size2),
                          child: Text("\$" + price.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500,
                                  letterSpacing: 0)),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    MdiIcons.heartOutline,
                    color: themeData.colorScheme.primary,
                    size: MySize.size22,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
