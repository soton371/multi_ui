import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/course/CourseExamTimeScreen.dart';
import 'package:UIKit/screens/course/CourseNotificationScreen.dart';
import 'package:UIKit/screens/course/CourseSubjectScreen.dart';
import 'package:UIKit/screens/course/CourseVideoScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseHomeScreen extends StatefulWidget {
  @override
  _CourseHomeScreenState createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
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
                        shrinkWrap: true,
                        padding: Spacing.zero,
                        children: <Widget>[
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "Hello, Learner",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                  ),
                                ),
                                Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(new MaterialPageRoute<Null>(
                                            builder: (BuildContext context) {
                                              return CourseNotificationScreen();
                                            },
                                            fullscreenDialog: true));
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
                                ))
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: examWidget(),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 24, 0, 0),
                            child: Text(
                              "My Course",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 0),
                            child: Column(
                              children: <Widget>[
                                singleMyCourse(
                                    title: "How to make tubes and paper crafts",
                                    image: './assets/images/course/art.jpg',
                                    subtitle: "Arts \& Crafts",
                                    progress: 0.4,
                                    status: "3 of 9 lessons"),
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleMyCourse(
                                      title: "Ardunio Robotics with mBot",
                                      image: './assets/images/course/robot.jpg',
                                      subtitle: "Robotics",
                                      progress: 0.6,
                                      status: "5 of 8 lessons"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 24, 24, 0),
                            child: Text(
                              "Up Next",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 16, 24, 16),
                            child: Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: <Widget>[
                                singleVideoLecture(
                                    subject: "Physics",
                                    title: "Chap 1",
                                    image:
                                        './assets/images/course/subject-2.jpg'),
                                singleVideoLecture(
                                    subject: "Biology",
                                    title: "Lab 1",
                                    image:
                                        './assets/images/course/biology.jpg'),
                                singleVideoLecture(
                                    subject: "Physics",
                                    title: "Chap 2",
                                    image:
                                        './assets/images/course/subject-6.jpg'),
                                singleVideoLecture(
                                    subject: "Chemistry",
                                    title: "Lab 2",
                                    image:
                                        './assets/images/course/subject-2.jpg'),
                              ],
                            ),
                          )
                        ],
                      )))),
        );
      },
    );
  }

  Widget singleVideoLecture({required String subject, required String title, required String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseVideoScreen()));
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              height: (MySize.safeWidth! - 66) / 2,
              width: (MySize.safeWidth! - 66) / 2,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size8!))),
              child: Image(
                image: AssetImage(image),
                height: (MySize.safeWidth! - 74) / 2,
                width: (MySize.safeWidth! - 74) / 2,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      subject,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: Colors.white,
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: Spacing.only(top: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.background,
                              shape: BoxShape.circle),
                          child: Icon(
                            MdiIcons.play,
                            color: themeData.colorScheme.onBackground,
                            size: MySize.size18,
                          ),
                        ),
                        Container(
                          margin: Spacing.only(left: 8),
                          child: Text(
                            title,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.background,
                                fontWeight: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget examWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseExamTimeScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer2,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            border: Border.all(color: customAppTheme.bgLayer4, width: 1)),
        padding: Spacing.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "Mock Test\n21, July",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    fontWeight: 700, color: themeData.colorScheme.onBackground),
              ),
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(
                Generator.getDummyText(8),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground.withAlpha(160),
                    height: 1.2),
              ),
            ),
            Container(
              margin: Spacing.top(16),
              padding: Spacing.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                color: customAppTheme.disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
              ),
              child: Text(
                "Time Table",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    letterSpacing: 0.3,
                    color: customAppTheme.onDisabled,
                    fontWeight: 600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleMyCourse(
      {required String image,
      required String title,
      required String subtitle,
      required String status,
      required double progress}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size8!))),
              child: Image(
                image: AssetImage(image),
                height: MySize.size60,
                width: MySize.size60,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subtitle,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.primary.withAlpha(180),
                          fontWeight: 700),
                    ),
                    Text(
                      title,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0,
                          fontWeight: 600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            status,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                muted: true),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Generator.buildProgress(
                            progress: progress,
                            height: MySize.size4,
                            activeColor: customAppTheme.colorSuccess,
                            inactiveColor: themeData.colorScheme.onBackground
                                .withAlpha(80),
                            width: MySize.size56!)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
