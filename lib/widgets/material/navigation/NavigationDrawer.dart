/*
* File : Navigation Drawer widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  int _selectedPage = 0;

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Text("Drawer",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                drawer: Drawer(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /*---------- Drawer Header ----------------*/
                      Expanded(
                        flex: 2,
                        child: DrawerHeader(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 8, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            new Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    image: AssetImage(
                                                        "./assets/images/avatar-2.jpg"),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    image: AssetImage(
                                                        "./assets/images/avatar-1.jpg"),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(left: 16),
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    image: AssetImage(
                                                        "./assets/images/avatar.jpg"),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Taslima Beattie",
                                          style: themeData.textTheme.headline6!
                                              .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary)
                                                  .merge(TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)))),
                                      Text("tas@gmail.com",
                                          style: themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary)
                                                  .merge(TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400))))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration:
                              BoxDecoration(color: themeData.primaryColor),
                        ),
                      ),

                      /*------------- Drawer Content -------------*/
                      Expanded(
                        flex: 6,
                        child: Container(
                          color: themeData.backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              children: <Widget>[
                                singleDrawerItem(
                                    MdiIcons.inbox, "All Inboxes", 0),
                                Divider(
                                  height: 1,
                                  color: themeData.dividerColor,
                                  thickness: 1,
                                ),
                                singleDrawerItem(
                                    MdiIcons.emailOutline, "Primary", 1),
                                singleDrawerItem(
                                    MdiIcons.accountGroupOutline, "Social", 2),
                                singleDrawerItem(
                                    MdiIcons.tagOutline, "Promotion", 3),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 12, left: 16, right: 16, bottom: 12),
                                  child: Text("ALL LABELS",
                                      style: themeData.textTheme.caption!.merge(
                                          TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.35,
                                              wordSpacing: 1.2))),
                                ),
                                singleDrawerItem(
                                    MdiIcons.starOutline, "Starred", 4),
                                singleDrawerItem(
                                    MdiIcons.clockOutline, "Snoozed", 5),
                                singleDrawerItem(MdiIcons.send, "Sent", 6),
                                singleDrawerItem(
                                    MdiIcons.fileOutline, "Drafts", 7),
                                singleDrawerItem(MdiIcons.emailMultipleOutline,
                                    "All Mail", 8),
                                singleDrawerItem(
                                    MdiIcons.alertOctagonOutline, "Spam", 9),
                                singleDrawerItem(
                                    MdiIcons.trashCanOutline, "Bin", 10),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 12, left: 16, right: 16, bottom: 12),
                                  child: Text("OTHER APPS",
                                      style: themeData.textTheme.caption!.merge(
                                          TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(240),
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.35,
                                              wordSpacing: 1.2))),
                                ),
                                singleDrawerItem(MdiIcons.calendarBlankOutline,
                                    "Calender", 11),
                                singleDrawerItem(MdiIcons.accountCircleOutline,
                                    "Contact", 12),
                                Divider(
                                  height: 1,
                                  color: themeData.dividerColor,
                                  thickness: 1,
                                ),
                                singleDrawerItem(
                                    MdiIcons.wrenchOutline, "Settings", 13),
                                singleDrawerItem(MdiIcons.helpCircleOutline,
                                    "Help and feedback", 14),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                )));
      },
    );
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(top: 0.0, left: 16, right: 16, bottom: 0),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? themeData.colorScheme.primary
              : themeData.colorScheme.onBackground.withAlpha(240)),
      title: Text(title,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(
                  fontWeight: _selectedPage == position
                      ? FontWeight.w600
                      : FontWeight.w500,
                  letterSpacing: 0.2))
              .merge(TextStyle(
                  color: _selectedPage == position
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.onBackground.withAlpha(240)))),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
