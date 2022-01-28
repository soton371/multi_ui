import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseNotificationScreen extends StatefulWidget {
  @override
  _CourseNotificationScreenState createState() =>
      _CourseNotificationScreenState();
}

class _CourseNotificationScreenState extends State<CourseNotificationScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

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
                        padding: Spacing.bottom(16),
                        children: <Widget>[
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      MdiIcons.chevronLeft,
                                      color: themeData.colorScheme.onBackground,
                                      size: MySize.size24,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        "Notification",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
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
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[

                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                                  child: singleAnnouncement(
                                      title: "Exam Reading Week",
                                      desc: Generator.getDummyText(14),
                                      date: "19 - 24 May 2021",
                                      time: "-",
                                      venue: "At Class"),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                                  child: singleAnnouncement(
                                      title: "National Science Day",
                                      desc: Generator.getDummyText(28),
                                      date: "Sunday, 28 Feb 2021",
                                      time: "8:00",
                                      venue: "At Auditorium"),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                                  child: singleAnnouncement(
                                      title: "Foundation day",
                                      desc: Generator.getDummyText(14),
                                      date: "Tuesday, 12 May 2021",
                                      time: "10:30",
                                      venue: "At Ground"),
                                )
                              ],
                            ),
                          )
                        ],
                      )))),
        );
      },
    );
  }

  Widget singleAnnouncement(
      {required String title, required String date, required String time, required String venue, required String desc}) {
    return Container(
      padding: Spacing.vertical(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          color: customAppTheme.bgLayer1,
        border: Border.all(color: customAppTheme.bgLayer4,width: 1),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size4!,
                offset: Offset(0, 1))
          ]
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: Spacing.horizontal(24),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Container(
            padding: Spacing.horizontal(24),
            margin: Spacing.top(4),
            child: Text(
              desc,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  letterSpacing: 0.3,
                  fontWeight: 500,
                  height: 1.7),
            ),
          ),
          Container(
              margin: Spacing.top(16),
              child: Divider(
                height: 0,
              )),
          Container(
            padding: Spacing.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primary),
                ),
                Text(
                  time,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.primary),
                ),
              ],
            ),
          ),
          Container(
            margin: Spacing.top(4),
            padding: Spacing.horizontal(24),
            child: Text(
              venue,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground.withAlpha(160),
                  fontWeight: 500),
            ),
          )
        ],
      ),
    );
  }


}
