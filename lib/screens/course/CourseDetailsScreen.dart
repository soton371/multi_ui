import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool isFav = false, isBookmark = false;

  late String _descText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _descText = Generator.getDummyText(24, withTab: true);
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size16!),
                                  bottomRight: Radius.circular(MySize.size16!))),
                          padding: Spacing.fromLTRB(36, 48, 36, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size24,
                                  ),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: Spacing.symmetric(vertical: 4,horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: customAppTheme.colorInfo,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size4!))),
                                      child: Text(
                                        "Trending",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: customAppTheme.onInfo,
                                            letterSpacing: 0,
                                            fontWeight: 500),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isFav = !isFav;
                                              });
                                            },
                                            child: Icon(
                                              isFav
                                                  ? MdiIcons.heart
                                                  : MdiIcons.heartOutline,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              size: MySize.size22,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: Spacing.left(24),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                isBookmark = !isBookmark;
                                              });
                                            },
                                            child: Icon(
                                              isBookmark
                                                  ? MdiIcons.bookmark
                                                  : MdiIcons.bookmarkOutline,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              size: MySize.size22,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: Text(
                                  "UI Designing",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontWeight: 700,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(8),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.star,
                                      size: MySize.size18,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                    Container(
                                      margin: Spacing.left(4),
                                      child: Text(
                                        "4.7",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: 500),
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.left(16),
                                      child: Icon(
                                        MdiIcons.accountMultiple,
                                        size: MySize.size18,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.left(4),
                                      child: Text(
                                        "7k",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: 500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: Spacing.top(40),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text("\$50",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.headline5,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: 600,
                                            letterSpacing: 0.5,
                                            height: 0)),
                                    Container(
                                      margin: Spacing.left(8),
                                      child: Text("\$70",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              fontWeight: 500,
                                              height: 0,
                                              muted: true,
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: Spacing.zero,
                              children: <Widget>[
                                Container(
                                  padding: Spacing.fromLTRB(36, 24, 36, 0),
                                  child: Text(
                                    "Description",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  padding: Spacing.fromLTRB(36, 0, 36, 0),
                                  margin: Spacing.top(16),
                                  child: Text(
                                    _descText,
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                        letterSpacing: 0.3,
                                        height: 1.4),
                                  ),
                                ),
                                Container(
                                  padding: Spacing.fromLTRB(36, 24, 36, 0),
                                  child: Text(
                                    "Content",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(36, 16, 36, 0),
                                  child: Column(
                                    children: <Widget>[
                                      singleContent(
                                          title: "Welcome to the Course",
                                          time: "4:15 mins",
                                          index: "01"),
                                      singleContent(
                                          title: "UI - Intro",
                                          time: "8:30 mins",
                                          index: "02"),
                                      singleContent(
                                          title: "UI - Process",
                                          time: "14:15 mins",
                                          enabled: false,
                                          index: "03"),
                                      singleContent(
                                          title: "UI - Finishing",
                                          time: "2:45 mins",
                                          enabled: false,
                                          index: "04"),
                                      singleContent(
                                          title: "Exam",
                                          time: "30:00 mins",
                                          enabled: false,
                                          index: "05"),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer2,
                              border:
                                  Border.all(color: customAppTheme.bgLayer3),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(MySize.size12!),
                                  topRight: Radius.circular(MySize.size12!))),
                          padding: Spacing.fromLTRB(36, 16, 36, 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: ElevatedButton(

                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Buy Now",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 600,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),

                                  ),
                                ),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                padding: Spacing.fromLTRB(16, 8, 16, 8),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(40),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16!))),
                                child: Icon(
                                  MdiIcons.shoppingOutline,
                                  size: MySize.size24,
                                  color: themeData.colorScheme.primary,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleContent(
      {required String index, required String time, required String title, bool enabled = true}) {
    return Container(
      margin: Spacing.bottom(24),
      child: Row(
        children: <Widget>[
          Text(
            index,
            style: AppTheme.getTextStyle(themeData.textTheme.headline5,
                color: themeData.colorScheme.onBackground.withAlpha(80),
                fontWeight: 600),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    time,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground, muted: true),
                  ),
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: Container(
              margin: Spacing.left(16),
              padding: Spacing.all(8),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.primary, shape: BoxShape.circle),
              child: Icon(
                MdiIcons.play,
                color: themeData.colorScheme.onPrimary,
                size: MySize.size20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
