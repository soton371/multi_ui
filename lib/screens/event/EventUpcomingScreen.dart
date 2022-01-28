import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/event/EventTicketScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import 'EventTicketDialog.dart';

class EventUpcomingScreen extends StatefulWidget {
  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
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
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                      size: MySize.size24,
                    ),
                  ),
                  title: Text(
                    "Upcoming",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.zero,
                    children: [
                      singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 1"),
                      Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Divider(
                            height: 0,
                          )),
                      singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 2"),
                      Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Divider(
                            height: 0,
                          )),
                      singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 3"),
                      Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Divider(
                            height: 0,
                          )),
                      singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 4"),
                      Container(
                          margin: Spacing.fromLTRB(24, 0, 24, 0),
                          child: Divider(
                            height: 0,
                          )),
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleEvent({required String image, required String name, required String date, required String time}) {
    return Container(
      margin: Spacing.all(24),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EventTicketScreen()));
        },
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                child: Image(
                  image: AssetImage(image),
                  width: MySize.getScaledSizeHeight(100),
                  height: MySize.size72,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    EventTicketDialog());
                          },
                          child: Container(
                            padding: Spacing.all(6),
                            child: Icon(
                              MdiIcons.qrcode,
                              color:
                                  themeData.colorScheme.onBackground.withAlpha(200),
                              size: MySize.size20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: Spacing.top(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    fontSize: 12,
                                    color: themeData.colorScheme.onBackground,
                                    xMuted: true),
                              ),
                              Container(
                                margin: Spacing.top(2),
                                child: Text(
                                  date,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground,
                                    fontSize: 12,
                                    xMuted: true),
                              ),
                              Container(
                                margin: Spacing.top(2),
                                child: Text(
                                  time,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              )
                            ],
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
      ),
    );
  }
}
