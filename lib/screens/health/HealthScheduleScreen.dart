import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HealthScheduleScreen extends StatefulWidget {
  @override
  _HealthScheduleScreenState createState() => _HealthScheduleScreenState();
}

class _HealthScheduleScreenState extends State<HealthScheduleScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int selectedDate = 1;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: themeData.colorScheme.primary,
                  child: Icon(
                    MdiIcons.plus,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.top(48),
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 0, 24, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      letterSpacing: 0,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                ),
                                Text(
                                  "13 Wed",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                              ],
                            ),
                            Container(
                              child: Icon(
                                MdiIcons.calendarOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleDateWidget(date: "12\nTue", index: 0),
                            singleDateWidget(date: "13\nWed", index: 1),
                            singleDateWidget(date: "14\nThu", index: 2),
                            singleDateWidget(date: "15\nFri", index: 3),
                            singleDateWidget(date: "16\nSat", index: 4),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        child: Text(
                          "Activity",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              color: themeData.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 600),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        child: Column(
                          children: [
                            singleActivityWidget(
                                color: Colors.blue,
                                iconData: MdiIcons.clock,
                                time: "6:00 AM",
                                title: "Wake up",
                                description: "Alarm automatic set"),
                            Container(
                              margin: Spacing.top(24),
                              child: singleActivityWidget(
                                  color: Colors.orange,
                                  iconData: MdiIcons.run,
                                  time: "7:00 AM",
                                  title: "Running",
                                  description: "3 KM at morning"),
                            ),
                            Container(
                              margin: Spacing.top(24),
                              child: singleActivityWidget(
                                  color: Colors.green,
                                  iconData: MdiIcons.pill,
                                  time: "8:00 AM",
                                  title: "Take Pill",
                                  description: "After walking"),
                            ),
                            Container(
                              margin: Spacing.top(24),
                              child: singleActivityWidget(
                                  color: Colors.purple,
                                  iconData: MdiIcons.doctor,
                                  time: "10:00 AM",
                                  title: "Appointment",
                                  description: "Dr. vivek "),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleDateWidget({String? date, required int index}) {
    if (selectedDate == index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedDate = index;
          });
        },
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
            color: themeData.colorScheme.primary,
          ),
          padding: Spacing.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              Text(
                date!,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 600,
                    color: themeData.colorScheme.onPrimary,
                    height: 1.9),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: Spacing.top(12),
                height: MySize.size8,
                width: MySize.size8,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.onPrimary,
                    shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
            color: customAppTheme.bgLayer1,
            boxShadow: [
              BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size10!,
                spreadRadius: MySize.size2,
                offset: Offset(0, MySize.size8!),
              )
            ]),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              date!,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600,
                  color: themeData.colorScheme.onBackground,
                  height: 1.9),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget singleActivityWidget(
      {required String time,
      required Color color,
      IconData? iconData,
      required String title,
      required String description}) {
    return Container(
      child: Row(
        children: [
          Container(
              width: MySize.size72,
              child: Text(
                time,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.caption,
                  muted: true,
                  letterSpacing: 0,
                ),
              )),
          Expanded(
            child: Container(
              padding: Spacing.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                  color: customAppTheme.bgLayer1,
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.shadowColor,
                        blurRadius: MySize.size8!,
                        offset: Offset(0, MySize.size8!))
                  ]),
              child: Row(
                children: [
                  Container(
                      padding: Spacing.all(8),
                      decoration: BoxDecoration(
                          color: color.withAlpha(24),
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size4!))),
                      child: Icon(
                        iconData,
                        color: color,
                        size: MySize.size30,
                      )),
                  Container(
                    margin: Spacing.left(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Text(
                          description,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontSize: 12,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              muted: true),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
