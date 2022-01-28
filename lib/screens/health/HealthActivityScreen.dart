import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HealthActivityScreen extends StatefulWidget {
  @override
  _HealthActivityScreenState createState() => _HealthActivityScreenState();
}

class _HealthActivityScreenState extends State<HealthActivityScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Color? color1, color2, color3;

  initState() {
    super.initState();
    color1 = Colors.lightBlueAccent;
    color2 = Colors.purpleAccent;
    color3 = Colors.deepPurpleAccent;
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              color: customAppTheme.bgLayer1,
              child: ListView(
                padding: Spacing.fromLTRB(0,48,0,16),
                children: [
                  Container(
                    margin: Spacing.fromLTRB(48, 24, 48, 0),
                    child: Text(
                      "Today you have consumed 150 cal",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline5,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: Spacing.top(36),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MySize.size140,
                          height: MySize.size140,
                          child: CircularProgressIndicator(
                              backgroundColor: color1!.withAlpha(20),
                              value: 0.3,
                              valueColor: AlwaysStoppedAnimation<Color?>(color1),
                              strokeWidth: 9),
                        ),
                        Container(
                          width: MySize.getScaledSizeWidth(165),
                          height: MySize.getScaledSizeWidth(165),
                          child: CircularProgressIndicator(
                              backgroundColor: color2!.withAlpha(20),
                              value: 0.5,
                              valueColor: AlwaysStoppedAnimation<Color?>(color2),
                              strokeWidth: 9),
                        ),
                        Container(
                          width: MySize.getScaledSizeWidth(190),
                          height: MySize.getScaledSizeWidth(190),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: CircularProgressIndicator(
                              backgroundColor: color3!.withAlpha(20),
                              value: 0.7,
                              valueColor: AlwaysStoppedAnimation<Color?>(color3),
                              strokeWidth: 9),
                        ),
                        Container(
                          width: MySize.size120,
                          height: MySize.getScaledSizeWidth(60),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "50%",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline5,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 700),
                              ),
                              Text(
                                "of daily goals",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: -0.2,
                                    color: themeData.colorScheme.onBackground,
                                    xMuted: true,
                                    fontWeight: 600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(32, 48, 32, 0),
                    child: Column(
                      children: [
                        singleElement(
                            color: color1,
                            type: "Carb",
                            inGram: "150",
                            inPercentage: "40"),
                        Container(
                          margin: Spacing.top(16),
                          child: singleElement(
                              color: color2,
                              type: "Protein",
                              inGram: "120",
                              inPercentage: "34"),
                        ),
                        Container(
                          margin: Spacing.top(16),
                          child: singleElement(
                              color: color3,
                              type: "Fat",
                              inGram: "40",
                              inPercentage: "36"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 32, 24, 0),
                    child: Text(
                      "Resume Activity".toUpperCase(),
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,fontSize: 11.8,
                          muted: true,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    child: Column(
                      children: [
                        singleActivity(
                            iconData: MdiIcons.run,
                            color: color1!,
                            type: "Run",
                            time: "10 : 45"),
                        Container(
                          margin: Spacing.top(16),
                          child: singleActivity(
                              iconData: MdiIcons.weightLifter,
                              color: color2!,
                              type: "Weight Lifeting",
                              time: "4 : 18"),
                        ),
                        Container(
                          margin: Spacing.top(16),
                          child: singleActivity(
                              iconData: MdiIcons.swim,
                              color: color3!,
                              type: "Swimming",
                              time: "10 : 00"),
                        ),
                        Container(
                          margin: Spacing.top(16),
                          child: singleActivity(
                              iconData: MdiIcons.runFast,
                              color: themeData.colorScheme.primary,
                              type: "Fast Run",
                              time: "0 : 00"),
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

  Widget singleElement(
      {Color? color, required String type, required String inGram, required String inPercentage}) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MySize.size12,
            height: MySize.size12,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      type,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        inGram + " g",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        inPercentage + "%",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 600,
                            color: themeData.colorScheme.onBackground),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleActivity(
      {IconData? iconData,
      required Color color,
      required String time,
      required String type,
      bool? selected}) {
    return Container(
      padding: Spacing.all(8),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          border: Border.all(color: customAppTheme.bgLayer3, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: Row(
        children: [
          Container(
            padding: Spacing.all(6),
            decoration:  BoxDecoration(
                color: color.withAlpha(40),
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
            child: Icon(
              iconData,
              color: color,
              size: MySize.size20,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Text(
                type,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground, fontWeight: 500),
              ),
            ),
          ),
          Text(
            time,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground, fontWeight: 600),
          ),
          Container(
            margin: Spacing.left(16),
            child: Icon(
              MdiIcons.play,
              color: themeData.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
