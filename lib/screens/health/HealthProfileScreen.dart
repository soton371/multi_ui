import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HealthProfileScreen extends StatefulWidget {
  @override
  _HealthProfileScreenState createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
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
                body: Container(
              color: customAppTheme.bgLayer1,
              child: ListView(
                padding: Spacing.top(48),
                children: [
                  Container(
                    padding: Spacing.vertical(24),
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer1,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                      border: Border.all(
                          color: customAppTheme.bgLayer4, width: 1.5),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size32!)),
                          child: Image(
                            image: AssetImage('./assets/images/avatar-2.jpg'),
                            height: MySize.size64,
                            width: MySize.size64,
                          ),
                        ),
                        Container(
                          margin: Spacing.top(16),
                          child: Text(
                            "Pablo Hills",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Container(
                          margin: Spacing.top(8),
                          child: Text(
                            "22 years, India",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 500,
                                muted: true,
                                letterSpacing: 0),
                          ),
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Weight",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          muted: true),
                                    ),
                                    Container(
                                      child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "62",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600)),
                                          TextSpan(
                                              text: " kg",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500)),
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Height",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          muted: true),
                                    ),
                                    Container(
                                      child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "158",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600)),
                                          TextSpan(
                                              text: " cm",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500)),
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Goal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          muted: true),
                                    ),
                                    Container(
                                      child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "50",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color:
                                                      customAppTheme.colorInfo,
                                                  fontWeight: 600)),
                                          TextSpan(
                                              text: " kg",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color:
                                                      customAppTheme.colorInfo,
                                                  fontWeight: 500)),
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 36, 24, 0),
                    child: Text(
                      "Appointment".toUpperCase(),
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 11.8,
                          fontWeight: 600,
                          xMuted: true,),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    child: Column(
                      children: [
                        appointmentWidget(
                            image: './assets/images/avatar-3.jpg',
                            docName: "Dr. Kole Wilde",
                            type: "psychologist",
                            time: "3:00 PM",
                          clockColor: customAppTheme.colorSuccess
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: appointmentWidget(
                              image: './assets/images/avatar-4.jpg',
                              docName: "Dr. Siana Bolton",
                              type: "psychologist",
                              time: "6:30 PM",
                            clockColor: customAppTheme.colorInfo
                          ),
                        ),
                        Container(
                          margin: Spacing.top(24),
                          child: appointmentWidget(
                              image: './assets/images/avatar-2.jpg',
                              docName: "Dr. Jeanne Healy",
                              type: "psychologist",
                              time: "10:00 AM",
                            clockColor: customAppTheme.colorWarning
                          ),
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

  Widget appointmentWidget(
      {required String image, required String docName, required String type, required String time,Color? clockColor}) {
    return Container(
      padding: Spacing.fromLTRB(4,4,8,4),
      decoration: BoxDecoration(
        color: customAppTheme.bgLayer1,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size12!)),
        boxShadow: [
          BoxShadow(
            color: customAppTheme.shadowColor,
            blurRadius: MySize.size6!,
            offset: Offset(0,MySize.size4!)
          )
        ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size12!)),
            child: Image(
              image: AssetImage(image),
              width: MySize.size72,
              height: MySize.size72,
            ),
          ),
          Expanded(
            child: Container(
              height: MySize.size72,
              margin: Spacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    docName,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    type,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500,
                        xMuted: true),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          MdiIcons.clock,size: MySize.size16,
                          color: clockColor,
                        ),
                        Container(
                          margin: Spacing.left(4),
                          child: Text(
                            time,
                            style: AppTheme.getTextStyle(themeData.textTheme.caption,
                                muted: true,fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
                        )
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
