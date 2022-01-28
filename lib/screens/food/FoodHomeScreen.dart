import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/food/FoodProductScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
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
                                  "Hey hungry",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      color: themeData.colorScheme.onBackground,
                                      letterSpacing: 0,
                                      fontWeight: 600),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => NotificationDialog()));
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none, children: <Widget>[
                                      Icon(
                                        MdiIcons.bellOutline,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                      ),
                                      Positioned(
                                        right: -2,
                                        top: -2,
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          height: MySize.size14,
                                          width: MySize.size14,
                                          decoration: BoxDecoration(
                                              color:
                                                  themeData.colorScheme.primary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size40!))),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: AppTheme.getTextStyle(
                                                themeData.textTheme.overline,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                                fontSize: 9,
                                                fontWeight: 500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(MySize.size16!),
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size16!),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5,
                                  color: themeData.colorScheme.surface),
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor!
                                      .withAlpha(12),
                                  blurRadius: MySize.size16!,
                                  offset: Offset(0, MySize.size8!),
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: MySize.getScaledSizeHeight(120),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(MySize.size8!),
                                          decoration: BoxDecoration(
                                              color: customAppTheme.bgLayer3,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size4!))),
                                          child: Text(
                                            "Special",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                muted: true,
                                                letterSpacing: 0.3,
                                                fontWeight: 600),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "\$ ",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle2,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700,
                                                  letterSpacing: 0),
                                            ),
                                            Text(
                                              "59",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 12,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                  muted: true,
                                                  letterSpacing: 0,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text(
                                              " 39",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle2,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700,
                                                  letterSpacing: 0),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Chinese Nood",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size4!)),
                                    child: Image(
                                      image: AssetImage(
                                          './assets/food/food-9.jpg'),
                                      width: MySize.getScaledSizeHeight(125),
                                      height: MySize.getScaledSizeHeight(125),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!),
                            child: Text(
                              "Category",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size24!),
                                    child: singleCategory(
                                        image: './assets/food/food-5.jpg',
                                        title: "Chinese"),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size24!),
                                    child: singleCategory(
                                        image: './assets/food/food-6.jpg',
                                        title: "Italian"),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size24!),
                                    child: singleCategory(
                                        image: './assets/food/food-7.jpg',
                                        title: "American"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: MySize.size24!,
                                        right: MySize.size24!),
                                    child: singleCategory(
                                        image: './assets/food/food-8.jpg',
                                        title: "Punjabi"),
                                  ),
                                ],
                              ),
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
                                  "Recommended",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600),
                                ),
                                Text(
                                  "View all",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500),
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
                                    image: './assets/food/food-1.jpg',
                                    name: 'Salad dish',
                                    price: 16.59),
                                singleFood(
                                    image: './assets/food/food-2.jpg',
                                    name: 'Food dish',
                                    price: 29.99),
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
              margin: EdgeInsets.only(top: MySize.size4!),
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      muted: true, fontWeight: 600)),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size2),
              child: Text("\$" + price.toString(),
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      fontWeight: 500, letterSpacing: 0)),
            )
          ],
        ),
      ),
    );
  }

  Widget singleCategory({required String image, required String title}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodProductScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        child: Stack(
          children: <Widget>[
            Container(
              width: MySize.size140,
              height: MySize.size140,
              child: Image(
                image: AssetImage(image),
                width: MySize.size140,
                height: MySize.size140,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MySize.size140,
              height: MySize.size140,
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: MySize.size140,
              height: MySize.size140,
              child: Center(
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600, color: Colors.white, letterSpacing: 0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.backgroundColor,
          elevation: 0,
          title: Text("Notifications",
              style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                  fontWeight: 600)),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: MySize.size16!),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: MySize.size24,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: Container(
            color: themeData.backgroundColor,
            padding: EdgeInsets.all(MySize.size16!),
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                singleNotification(
                    iconData: MdiIcons.food,
                    time: "Just Now ",
                    text: "Your order placed successfully"),
                singleNotification(
                    iconData: MdiIcons.close,
                    time: "1 Day ago",
                    text: "Your last order cancel due to payment issue"),
                singleNotification(
                    iconData: MdiIcons.check,
                    time: "3 Day ago",
                    text: "Burger order successfully deliver"),
                singleNotification(
                    iconData: MdiIcons.emailOutline,
                    time: "1 Month ago",
                    text: "A new email from restaurant"),
                Container(
                  margin: EdgeInsets.only(top: MySize.size8!),
                  child: Center(
                    child: Text(
                      "View all",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.primary,
                          fontWeight: 500),
                    ),
                  ),
                )
              ],
            )));
  }

  Widget singleNotification({IconData? iconData, required String text, required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: MySize.size16!),
      padding: EdgeInsets.only(
          left: MySize.size16!,
          right: MySize.size16!,
          top: MySize.size8!,
          bottom: MySize.size8!),
      decoration: BoxDecoration(color: themeData.backgroundColor, boxShadow: [
        BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(12),
            blurRadius: MySize.size8!,
            offset: Offset(0, MySize.size4!))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(MySize.size12!),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onPrimary,
              size: MySize.size22,
            ),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: MySize.size18!, right: MySize.size18!),
                child: Text(text)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
