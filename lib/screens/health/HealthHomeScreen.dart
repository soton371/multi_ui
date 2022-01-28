import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/health/HealthNewActivityScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HealthHomeScreen extends StatefulWidget {
  @override
  _HealthHomeScreenState createState() => _HealthHomeScreenState();
}

class _HealthHomeScreenState extends State<HealthHomeScreen> {
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
            home: Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: themeData.colorScheme.primary,
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HealthNewActivityScreen()));
                    },
                    label: Row(
                      children: [
                        Icon(
                          MdiIcons.plus,
                          color: themeData.colorScheme.onPrimary,size: MySize.size18,
                        ),
                        Container(
                          margin: Spacing.left(4),
                          child: Text(
                            "Activity",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onPrimary,
                                fontWeight: 500),
                          ),
                        ),
                      ],
                    )),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.top(48),
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 0, 24, 0),
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          child: Image(
                            image: AssetImage('./assets/images/avatar-1.jpg'),
                            width: MySize.size44,
                            height: MySize.size44,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 0, 0),
                        child: Text(
                          "Hello",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              xMuted: true,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: Spacing.left(24),
                        child: Text(
                          "Seymour!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline4,
                              letterSpacing: -0.5,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        padding: Spacing.horizontal(12),
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1,
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8!)),
                            boxShadow: [
                              BoxShadow(
                                color: customAppTheme.shadowColor,
                                spreadRadius: 2,
                                blurRadius: MySize.size10!,
                                offset: Offset(0, MySize.size8!),
                              ),
                            ]),
                        child: Row(
                          children: [
                            Icon(
                              MdiIcons.magnify,
                              color:
                                  themeData.colorScheme.primary.withAlpha(200),
                              size: MySize.size16,
                            ),
                            Expanded(
                              child: Container(
                                margin: Spacing.left(12),
                                child: TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    fillColor: customAppTheme.bgLayer1,
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true,
                                        fontWeight: 500),
                                    hintText: "Find Events...",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 36, 24, 0),
                        padding: Spacing.all(24),
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size12!)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Stay Home!",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 600),
                                ),
                                Icon(
                                  MdiIcons.close,
                                  color: themeData.colorScheme.onPrimary
                                      .withAlpha(200),
                                  size: MySize.size16,
                                )
                              ],
                            ),
                            Container(
                              margin: Spacing.top(8),
                              width: MySize.safeWidth! * 0.6,
                              child: Text(
                                Generator.getDummyText(12),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: 400,
                                    muted: true),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        child: Text(
                          "How we can help you?",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              letterSpacing: -0.15,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              muted: true),
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.doctor, title: "Doctor"),
                            singleHelpWidget(
                                iconData: MdiIcons.hospitalBuilding,
                                title: "Hospital"),
                            singleHelpWidget(
                                iconData: MdiIcons.pill, title: "Medicine")
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleHelpWidget(
                                iconData: MdiIcons.ambulance,
                                title: "Ambulance"),
                            singleHelpWidget(
                                iconData: MdiIcons.phonePlus,
                                title: "Consultation"),
                            singleHelpWidget(
                                iconData: MdiIcons.needle, title: "Shots")
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleHelpWidget({IconData? iconData, required String title, Color? color}) {
    return Container(
      width: (MySize.safeWidth! - MySize.getScaledSizeWidth(96)) / 3,
      padding: Spacing.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
          boxShadow: [
            BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size6!,
                offset: Offset(0, MySize.size4!))
          ]),
      child: Column(
        children: [
          Icon(
            iconData,
            color: color == null ? themeData.colorScheme.primary : color,
            size: MySize.size30,
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  letterSpacing: 0,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600),
            ),
          )
        ],
      ),
    );
  }
}
