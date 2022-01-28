import 'package:UIKit/screens/food/FoodMenuScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class FoodRestaurantScreen extends StatefulWidget {
  @override
  _FoodRestaurantScreenState createState() => _FoodRestaurantScreenState();
}

class _FoodRestaurantScreenState extends State<FoodRestaurantScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool isQuick = false;

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
                              image: AssetImage('./assets/food/restaurant.jpg'),
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
                                        color: Colors.white,
                                      )),
                                ))
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size16!),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "The Disaster Café",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "London bridge",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 400),
                                  ),
                                  Generator.buildRatingStar(
                                      rating: 4.5,
                                      size: MySize.size18,
                                      spacing: 0,
                                      inactiveColor:
                                          themeData.colorScheme.onBackground,
                                      inactiveStarFilled: false)
                                ],
                              )),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(MySize.size10!),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(40),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      MdiIcons.phoneOutline,
                                      size: MySize.size22,
                                      color: themeData.colorScheme.primary,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16!),
                                    padding: EdgeInsets.all(MySize.size10!),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(40),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      MdiIcons.mapMarkerOutline,
                                      size: MySize.size22,
                                      color: themeData.colorScheme.primary,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Delivery",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "Free",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Time",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "9 AM - 7 PM",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                  ),
                                ],
                              ),
                              TextButton(

                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodMenuScreen()));
                                  },
                                  child: Text("MENU",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 600,
                                          color:
                                              themeData.colorScheme.primary))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Reviews",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              ),
                              Text(
                                "View All",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size16!),
                          child: Column(
                            children: <Widget>[
                              singleReview(
                                  rating: 4.5,
                                  image: './assets/images/avatar-2.jpg',
                                  time: "27 Jul 2020"),
                              Divider(),
                              singleReview(
                                  rating: 3.8,
                                  image: './assets/images/avatar-3.jpg',
                                  time: "25 Jul 2020"),
                              Divider(),
                              singleReview(
                                  rating: 5,
                                  image: './assets/images/avatar-4.jpg',
                                  time: "21 Jul 2020"),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24!,
                              right: MySize.size24!,
                              top: MySize.size24!),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(40),
                                blurRadius: 5,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ElevatedButton(

                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodMenuScreen()));
                            },
                            child: Text("Order Now".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: 0.4,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                            ),
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget singleReview({required String image, required double rating, required String time}) {
    return Container(
      margin: EdgeInsets.only(top: MySize.size4!, bottom: MySize.size4!),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size32!)),
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
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Generator.buildRatingStar(
                            rating: rating,
                            size: MySize.size18,
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size8!),
                          child: Text(
                            time,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600,
                                muted: true),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size4!),
                      child: Text(
                        Generator.getDummyText(12),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            letterSpacing: 0,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
