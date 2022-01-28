import 'package:UIKit/screens/news/SingleNewsScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  body: Container(
                margin: Spacing.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            child: ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size18!)),
                              child: Image(
                                image:
                                    AssetImage('./assets/images/avatar-2.jpg'),
                                height: MySize.size36,
                                width: MySize.size36,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MySize.size16,
                          ),
                          Container(
                            child: Text(
                              "19 Jan, 2020",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 400),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: Spacing.top(16),
                        child: Text(
                          "Breaking News",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline4,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 800),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleNewsScreen()));
                        },
                        child: Container(
                          margin: Spacing.top(24),
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer1,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size24!)),
                              boxShadow: [
                                BoxShadow(
                                    color: customAppTheme.shadowColor
                                        .withAlpha(120),
                                    blurRadius: MySize.size24!,
                                    spreadRadius: MySize.size4!)
                              ]),
                          child: Column(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size24!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/all/all-l2.jpg'),
                                ),
                              ),
                              Container(
                                padding: Spacing.all(16),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        "14 Passengers Banned By Nona Airlines After bad Behaviour",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.headline6,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.top(16),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size14!)),
                                            child: Image(
                                              image: AssetImage(
                                                  './assets/images/avatar-2.jpg'),
                                              height: MySize.size28,
                                              width: MySize.size28,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MySize.size16,
                                          ),
                                          Text(
                                            "John smith",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                                xMuted: true),
                                          ),
                                          Expanded(child: Container()),
                                          Text(
                                            "10 Jan, 2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500,
                                                xMuted: true),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleNewsScreen()));
                        },
                        child: Container(
                          margin: Spacing.top(24),
                          child: Row(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size16!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/all/all-l2.jpg'),
                                  width: MySize.size90,
                                  height: MySize.size72,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MySize.size16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "An illinois town fights to save its power plant",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Container(
                                      margin: Spacing.top(8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            MdiIcons.calendarOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(160),
                                            size: MySize.size20,
                                          ),
                                          SizedBox(
                                            width: MySize.size8,
                                          ),
                                          Text(
                                            "Jan 10, 2021",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0,
                                                muted: true),
                                          ),
                                          SizedBox(
                                            width: MySize.size16,
                                          ),
                                          Icon(
                                            MdiIcons.clockOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(160),
                                            size: MySize.size20,
                                          ),
                                          SizedBox(
                                            width: MySize.size8,
                                          ),
                                          Text(
                                            "10 min read",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0,
                                                muted: true),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleNewsScreen()));
                        },
                        child: Container(
                          margin: Spacing.top(24),
                          child: Row(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size16!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/all/all-l3.jpg'),
                                  width: MySize.size90,
                                  height: MySize.size72,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MySize.size16,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "An illinois town fights to save its power plant",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Container(
                                      margin: Spacing.top(8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            MdiIcons.calendarOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(160),
                                            size: MySize.size20,
                                          ),
                                          SizedBox(
                                            width: MySize.size8,
                                          ),
                                          Text(
                                            "Jan 10, 2021",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0,
                                                muted: true),
                                          ),
                                          SizedBox(
                                            width: MySize.size16,
                                          ),
                                          Icon(
                                            MdiIcons.clockOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(160),
                                            size: MySize.size20,
                                          ),
                                          SizedBox(
                                            width: MySize.size8,
                                          ),
                                          Text(
                                            "10 min read",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0,
                                                muted: true),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16!)),
                              child: Image(
                                image: AssetImage(
                                    './assets/images/all/all-l1.jpg'),
                                width: MySize.size90,
                                height: MySize.size72,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: MySize.size16,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "An illinois town fights to save its power plant",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Container(
                                    margin: Spacing.top(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          MdiIcons.calendarOutline,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(160),
                                          size: MySize.size20,
                                        ),
                                        SizedBox(
                                          width: MySize.size8,
                                        ),
                                        Text(
                                          "Jan 10, 2021",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              muted: true),
                                        ),
                                        SizedBox(
                                          width: MySize.size16,
                                        ),
                                        Icon(
                                          MdiIcons.clockOutline,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(160),
                                          size: MySize.size20,
                                        ),
                                        SizedBox(
                                          width: MySize.size8,
                                        ),
                                        Text(
                                          "10 min read",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              muted: true),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ));
      },
    );
  }
}
