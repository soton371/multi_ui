import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'CourseExamScreen.dart';

class CourseExamTimeScreen extends StatefulWidget {
  @override
  _CourseExamTimeScreenState createState() => _CourseExamTimeScreenState();
}

class _CourseExamTimeScreenState extends State<CourseExamTimeScreen> {
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
                        padding: Spacing.zero,
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
                                        "Exam",
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
                                  child: Icon(
                                    MdiIcons.heartOutline,
                                    color: themeData.colorScheme.onBackground,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              children: <Widget>[
                                singleExam(
                                    subject: "Biology",
                                    date: "Today",
                                    place: "Room. 147",
                                    teacherImage:
                                    './assets/images/avatar-2.jpg',
                                    teacherName: "Elliot Haines",
                                    time: "9:00 - 13:20",
                                    type: "Open Book"),
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleExam(
                                      subject: "Science",
                                      date: "2 Aug",
                                      place: "Lab. 1",
                                      teacherImage:
                                      './assets/images/avatar-4.jpg',
                                      teacherName: "Shane Tierney",
                                      time: "12:30 - 15:00",
                                      type: "Close Book"),
                                ),
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleExam(
                                      subject: "Mathematics",
                                      date: "5 Aug",
                                      place: "Room. 24",
                                      teacherImage:
                                      './assets/images/avatar-3.jpg',
                                      teacherName: "Dustin Wilkerson",
                                      time: "8:00 - 11:00",
                                      type: "Open Book"),
                                ),
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleExam(
                                      subject: "English",
                                      date: "7 Aug",
                                      place: "Announce soon",
                                      teacherImage:
                                      './assets/images/avatar-1.jpg',
                                      teacherName: "Zakaria Navarro",
                                      time: "7:45 - 10:00",
                                      type: "On Mobile"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.top(16),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "If you have any queries about exam",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color:
                                      themeData.colorScheme.onBackground),
                                ),
                                Container(
                                  margin: Spacing.vertical(8),
                                  child: ElevatedButton(

                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Contact us".toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            fontSize: 12,
                                            letterSpacing: 0.5,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                      )),
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

  Widget singleExam(
      {required String subject,
        required String date,
        required String time,
        required String place,
        required String teacherImage,
        required String teacherName,
        required String type}) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                CourseExamScreen()));
      },
      child: Container(
        margin: Spacing.fromLTRB(24, 0, 24, 0),
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          border: Border.all(width: 1,color: customAppTheme.bgLayer4)
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: Spacing.fromLTRB(16, 16, 0, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          subject,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: Spacing.top(2),
                          child: Text(
                            date,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0,
                                fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: Spacing.fromLTRB(0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          place,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: Spacing.top(2),
                          child: Text(
                            time,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0,
                                fontWeight: 600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Container(
              margin: Spacing.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size18!)),
                      child: Image(
                        image: AssetImage(teacherImage),
                        height: MySize.size36,
                        width: MySize.size36,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: Spacing.left(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              teacherName,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                            Text(
                              "Examine",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: customAppTheme.colorInfo,
                                  fontWeight: 500),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    child: Text(
                      type,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          letterSpacing: 0,
                          color: themeData.colorScheme.primary,
                          fontWeight: 500),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

