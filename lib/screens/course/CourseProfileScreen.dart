import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseProfileScreen extends StatefulWidget {
  @override
  _CourseProfileScreenState createState() => _CourseProfileScreenState();
}

class _CourseProfileScreenState extends State<CourseProfileScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late String _upgradeText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _upgradeText = Generator.getDummyText(12);

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
                        padding: Spacing.top(24),
                        children: <Widget>[
                          Container(
                            margin: Spacing.horizontal(24),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!)),
                                      child: Image(
                                        image: AssetImage(
                                            './assets/images/avatar-3.jpg'),
                                        width: MySize.size48,
                                        height: MySize.size48,
                                      )),
                                ),
                                Container(
                                  margin: Spacing.left(16),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Denise Andrew",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                      Text(
                                        "Regular profile",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            muted: true,
                                            fontWeight: 600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          upgradeWidget(),
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: Text(
                              "Progress",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  muted: true,
                                  letterSpacing: 0.25),
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: Column(
                              children: <Widget>[
                                progressWidget(
                                    title: "Download - Flutter Lesson 1",
                                    progress: 48,
                                    iconData: MdiIcons.play),
                                Container(
                                  margin: Spacing.top(16),
                                  child: progressWidget(
                                      title: "Download - Flutter Lesson 2"
                                          "",
                                      progress: 64,
                                      iconData: MdiIcons.pause),
                                ),
                                Container(
                                  margin: Spacing.top(16),
                                  child: progressWidget(
                                      title: "Download - Flutter Lesson 3"
                                          "",
                                      progress: 0,
                                      iconData: MdiIcons.download),
                                ),
                              ],
                            ),
                          )
                        ],
                      )))),
        );
      },
    );
  }

  Widget upgradeWidget() {
    return Container(
      margin: Spacing.fromLTRB(24, 24, 24, 0),
      decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: [
            BoxShadow(
                color: themeData.colorScheme.primary.withAlpha(60),
                blurRadius: MySize.size6!,
                spreadRadius: MySize.size2,
                offset: Offset(0, MySize.size2))
          ]),
      padding: Spacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Upgrade\nYour Account",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                  fontWeight: 700, color: themeData.colorScheme.onPrimary),
            ),
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              _upgradeText,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onPrimary.withAlpha(160),
                  height: 1.2),
            ),
          ),
          Container(
            margin: Spacing.top(16),
            padding: Spacing.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: customAppTheme.colorInfo,
              borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
            ),
            child: Text(
              "Upgrade",
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: customAppTheme.onInfo),
            ),
          ),
        ],
      ),
    );
  }

  Widget progressWidget({required String title, required int progress, IconData? iconData}) {
    return Container(
      padding: Spacing.all(16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor, blurRadius: MySize.size10!)
          ]),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(8),
                    child: Row(
                      children: <Widget>[
                        Generator.buildProgress(
                            progress: progress.toDouble(),
                            activeColor: customAppTheme.colorInfo,
                            inactiveColor: customAppTheme.bgLayer3,
                            width: MediaQuery.of(context).size.width * 0.5),
                        Container(
                          margin: Spacing.left(16),
                          child: Text(
                            progress.toString() + "%",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.onBackground,
                                muted: true,
                                fontWeight: 600,
                                letterSpacing: 0.5),
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
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onPrimary,
              size: MySize.size20,
            ),
          )
        ],
      ),
    );
  }
}

