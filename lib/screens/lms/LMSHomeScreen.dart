import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/course/CourseExamTimeScreen.dart';
import 'package:UIKit/screens/course/CourseSubjectScreen.dart';
import 'package:UIKit/screens/course/CourseVideoScreen.dart';
import 'package:UIKit/screens/lms/LMSNotificationScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class  LMSHomeScreen extends StatefulWidget {
  @override
  _LMSHomeScreenState createState() => _LMSHomeScreenState();
}

class _LMSHomeScreenState extends State<LMSHomeScreen> {
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
                            margin: Spacing.fromLTRB(16, 16, 16, 0),
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
                                              return LMSNotificationScreen();
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
                            margin: Spacing.fromLTRB(16, 16, 16, 0),
                            child: examWidget(),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(16, 24, 16, 0),
                            child: Text(
                              "Course Overview",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              padding: Spacing.all(16),
                              crossAxisSpacing: MySize.size16!,
                              mainAxisSpacing: MySize.size16!,
                              childAspectRatio: 0.725,
                              children: <Widget>[
                                singleMyCourse(
                                    title: "Biology",
                                    image: './assets/images/course/biology.jpg',
                                    type: "Sem - 7",
                                    status: "Running"),
                                singleMyCourse(
                                    title: "Physics",
                                    image: './assets/images/course/subject-6.jpg',
                                    type: "SEM - 7",
                                    status: "Running"),
                                singleMyCourse(
                                    title: "Arts \& Crafts",
                                    image: './assets/images/course/art.jpg',
                                    type: "UG Course",
                                    status: "Incomplete"),
                                singleMyCourse(
                                    title: "Robotics",
                                    image: './assets/images/course/robot.jpg',
                                    type: "SEM - 7",
                                    status: "Completed"),
                              ],
                            ),
                          ),
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
      required String type,
      required String status}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseSubjectScreen()));
      },
      child: Container(
        padding: Spacing.all(8),
        decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          border:Border.all(color: customAppTheme.bgLayer4,width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size8!))),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: Spacing.top(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    type,
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.primary.withAlpha(180),
                        fontWeight: 700),
                  ),
                  Text(
                    title,
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: Spacing.top(2),
                    child: Text(
                      status,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.overline,
                          color: themeData.colorScheme.onBackground,xMuted: true,
                          letterSpacing: 0,
                          fontWeight: 600),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
