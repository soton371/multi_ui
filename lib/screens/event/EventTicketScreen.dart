import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/event/EventTicketDialog.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class EventTicketScreen extends StatefulWidget {
  @override
  _EventTicketScreenState createState() => _EventTicketScreenState();
}

class _EventTicketScreenState extends State<EventTicketScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int selectedCategory = 0;

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
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Image(
                          image: AssetImage('./assets/design/pattern-1.png'),
                          fit: BoxFit.cover,
                          width: MySize.safeWidth,
                          height: MySize.getScaledSizeHeight(240),
                        ),
                        Positioned(
                          child: Container(
                            margin: Spacing.fromLTRB(24, 48, 24, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: Spacing.all(8),
                                    decoration: BoxDecoration(
                                      color: customAppTheme.bgLayer1,
                                      border: Border.all(
                                          color: customAppTheme.bgLayer4,
                                          width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!)),
                                    ),
                                    child: Icon(MdiIcons.chevronLeft,
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(220),
                                        size: MySize.size20),
                                  ),
                                ),
                                Container(
                                  padding: Spacing.all(8),
                                  decoration: BoxDecoration(
                                    color: customAppTheme.bgLayer1,
                                    border: Border.all(
                                        color: customAppTheme.bgLayer4,
                                        width: 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size8!)),
                                  ),
                                  child: Icon(MdiIcons.shareOutline,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(220),
                                      size: MySize.size20),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: Spacing.vertical(16),
                      children: [
                        Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Widgets of the Week - Flutter',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontSize: 22,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                padding: Spacing.all(8),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(24)
                                        .withAlpha(20),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size8!))),
                                child: Icon(MdiIcons.heartOutline,
                                    size: MySize.size18,
                                    color: themeData.colorScheme.primary),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: Spacing.all(8),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(24),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8!))),
                                    child: Icon(
                                      MdiIcons.calendar,
                                      size: MySize.size18,
                                      color: themeData.colorScheme.primary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: Spacing.left(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Friday",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                color: themeData
                                                    .colorScheme.onBackground),
                                          ),
                                          Container(
                                            margin: Spacing.top(2),
                                            child: Text(
                                              "8:30 - 11:30 AM",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 12,
                                                  fontWeight: 500,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  xMuted: true),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: Spacing.fromLTRB(16, 4, 4, 4),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(28),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size32!))),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Add to Reminder",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              letterSpacing: 0,
                                              fontSize: 12,
                                              color:
                                                  themeData.colorScheme.primary,
                                              fontWeight: 400),
                                        ),
                                        Container(
                                          padding: Spacing.all(8),
                                          margin: Spacing.left(8),
                                          decoration: BoxDecoration(
                                              color:
                                                  themeData.colorScheme.primary,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            MdiIcons.plus,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: MySize.size18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: Row(
                            children: [
                              Generator.buildOverlaysProfile(
                                  images: [
                                    './assets/images/avatar-2.jpg',
                                    './assets/images/avatar-1.jpg',
                                    './assets/images/avatar-3.jpg',
                                    './assets/images/avatar-4.jpg',
                                  ],
                                  size: MySize.size36!,
                                  leftFraction: 0.7,
                                  overlayBorderThickness: 2.5,
                                  enabledOverlayBorder: true,
                                  overlayBorderColor: customAppTheme.bgLayer1),
                              Container(
                                child: Text(
                                  "+42 Participant",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 500),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 24, 24, 0),
                          child: Text(
                            "About This Event",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 12, 24, 0),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: Generator.getDummyText(20),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData.colorScheme.onBackground,
                                      muted: true,letterSpacing: 0.3,
                                      fontWeight: 500)),
                              TextSpan(
                                  text: "Read More",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,letterSpacing: 0.3,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 600))
                            ]),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 24, 24, 0),
                          child: Text(
                            "Location",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8!)),
                            child: Image(
                              image:
                                  AssetImage('./assets/other/map-md-snap.png'),
                              height: MySize.getScaledSizeHeight(200),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          child: ElevatedButton(

                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      EventTicketDialog());
                            },
                            child: Text(
                              "Show my Ticket",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onPrimary),
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }
}
