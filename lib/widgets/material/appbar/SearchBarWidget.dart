/*
* File : Searchbar widget
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ThemeData themeData;
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
        home: Scaffold(
          backgroundColor: themeData.scaffoldBackgroundColor,
          key: _scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(MdiIcons.chevronLeft),
          ),
          /*---------------Navigation Drawer ------------------*/
          drawer: Drawer(
              child: Container(
            color: themeData.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 0.0, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size12!),
                  child: Container(
                    margin: EdgeInsets.only(top: MySize.size36!),
                    child: Text("Mail",
                        style: themeData.textTheme.headline6!.merge(TextStyle(
                            color: themeData.colorScheme.primary,
                            letterSpacing: 0.2))),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: MySize.size8!),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 1,
                              color: themeData.dividerColor,
                              thickness: 1,
                            ),
                            singleDrawerItem(MdiIcons.inbox, "All Inboxes", 0),
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
                            singleDrawerItem(MdiIcons.fileOutline, "Drafts", 7),
                            singleDrawerItem(
                                MdiIcons.emailMultipleOutline, "All Mail", 8),
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
                            singleDrawerItem(
                                MdiIcons.calendarBlankOutline, "Calender", 11),
                            singleDrawerItem(
                                MdiIcons.accountCircleOutline, "Contact", 12),
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
                  ),
                )
              ],
            ),
          )),
          body: Container(
            child: Stack(
              clipBehavior: Clip.none, children: <Widget>[
                // Replace this container with your Map widget
                Container(
                  child: Center(
                    child: Text(
                      "Content place here",
                      style: themeData.textTheme.subtitle2!.merge(TextStyle(
                          color:
                              themeData.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0.2)),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  left: 16,
                  child: Container(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MySize.size10!),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MySize.size12!, top: MySize.size8!, right: MySize.size12!, bottom: MySize.size8!),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  MdiIcons.menu,
                                  size: 24,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(240),
                                )),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size8!),
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Search here",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        isDense: true),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: themeData.colorScheme.secondary,
                              child: Text(
                                "D",
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onSecondary)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(top: 0.0, left: MySize.size16!, right: MySize.size16!, bottom: 0),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? themeData.colorScheme.primary
              : themeData.colorScheme.onBackground.withAlpha(240)),
      title: Text(title,
          style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
              fontWeight:
                  _selectedPage == position ? 700 : 600,
              color: _selectedPage == position
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground.withAlpha(240))),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }
}
