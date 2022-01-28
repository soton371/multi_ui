import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseTasksScreen extends StatefulWidget {
  @override
  _CourseTasksScreenState createState() => _CourseTasksScreenState();
}

class _CourseTasksScreenState extends State<CourseTasksScreen> {
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
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        "Tasks",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(0, 8, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: Spacing.fromLTRB(24, 16, 0, 0),
                                  child: Text(
                                    "DUE",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 700,
                                        muted: true,
                                        color:
                                        themeData.colorScheme.onBackground),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.top(8),
                                  child: singleTask(
                                    subject: "Biology",
                                    statusText: "Over due",
                                    submissionDate: "31/07/20",
                                    status: 0,
                                    task: "Lesson 1",
                                  ),
                                ),
                                singleTask(
                                    subject: "Mathematics",
                                    task: "Example 2",
                                    statusText: "Not submit",
                                    status: 1,
                                    submissionDate: "22/07/20"),
                                singleTask(
                                    subject: "History",
                                    task: "Example 2",
                                    statusText: "Not submit",
                                    status: 1,
                                    submissionDate: "20/07/20"),
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 0, 0),
                                  child: Text(
                                    "IN REVIEW",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 700,
                                        muted: true,
                                        color:
                                        themeData.colorScheme.onBackground),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.top(8),
                                  child: singleTask(
                                    subject: "Biology",
                                    statusText: "In Review",
                                    status: 2,
                                    submissionDate: "29/07/20",
                                    task: "Lesson 1",
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 0, 0),
                                  child: Text(
                                    "SUBMITTED",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 700,
                                        muted: true,
                                        color:
                                        themeData.colorScheme.onBackground),
                                  ),
                                ),
                                Container(
                                  margin: Spacing.top(8),
                                  child: singleTask(
                                    subject: "Biology",
                                    statusText: "35/40",
                                    status: 3,
                                    submissionDate: "29/07/20",
                                    task: "Lesson 1",
                                  ),
                                ),
                                singleTask(
                                  subject: "History",
                                  task: "Homework 2",
                                  statusText: "27/30",
                                  status: 3,
                                  submissionDate: "24/07/20",
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

  Widget singleTask(
      {String? subject,
        String? task,
        String? submissionDate,
        String? statusText,
        int status = 0}) {
    IconData iconData;
    Color iconBG, iconColor, statusColor;
    switch (status) {
      case 0:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
      case 1:
        iconBG = themeData.colorScheme.primary;
        iconColor = themeData.colorScheme.onPrimary;
        iconData = MdiIcons.plus;
        statusColor = themeData.colorScheme.primary;
        break;
      case 2:
        iconBG = customAppTheme.colorInfo;
        iconColor = customAppTheme.onInfo;
        iconData = MdiIcons.pencilOutline;
        statusColor = customAppTheme.colorInfo;
        break;
      case 3:
        iconBG = customAppTheme.disabledColor;
        iconColor = customAppTheme.onDisabled;
        iconData = MdiIcons.spellcheck;
        statusColor = customAppTheme.disabledColor;
        break;
      default:
        iconBG = customAppTheme.colorError;
        iconColor = customAppTheme.onError;
        iconData = MdiIcons.plus;
        statusColor = customAppTheme.colorError;
        break;
    }

    return Container(
      padding: Spacing.all(16),
      margin: Spacing.fromLTRB(24,8,24,8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: [

          ],
        border: Border.all(color: customAppTheme.bgLayer3,width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: Spacing.all(6),
            decoration:
            BoxDecoration(color: iconBG, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: iconColor,
              size: MySize.size20,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subject!,
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    child: Text(
                      task!,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground
                            .withAlpha(160),
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                submissionDate!,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    color: themeData.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 600),
              ),
              Container(
                margin: Spacing.top(2),
                child: Text(
                  statusText!,
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText2,
                      color: statusColor,
                      letterSpacing: 0,
                      fontWeight: status == 3 ? 600 : 500),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }


}

