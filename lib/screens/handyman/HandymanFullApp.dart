import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'HandymanHomeScreen.dart';
import 'HandymanPastScreen.dart';
import 'HandymanProfileScreen.dart';



class HandymanFullApp extends StatefulWidget {
  @override
  _HandymanFullAppState createState() => _HandymanFullAppState();
}

class _HandymanFullAppState extends State<HandymanFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late CustomAppTheme customAppTheme;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme  = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: Container(
                  decoration: BoxDecoration(
                    color: customAppTheme.bgLayer1,
                    border: Border(top: BorderSide(color: customAppTheme.bgLayer4,width: 1)),
                    boxShadow: [
                      BoxShadow(
                        color: customAppTheme.shadowColor.withAlpha(150),
                        blurRadius: 3,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: Spacing.only(top: 12, bottom: 12),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: themeData.colorScheme.primary,
                    tabs: <Widget>[
                      Container(
                        child: (_currentIndex == 0)
                            ? Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.home,
                                    color: themeData.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: Spacing.only(top: 4),
                                    decoration: BoxDecoration(
                                        color: themeData.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5))),
                                    height: 5,
                                    width: 5,
                                  )
                                ],
                              )
                            : Icon(
                                MdiIcons.homeOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                      ),

                      Container(
                          child: (_currentIndex == 1)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.calendar,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.calendarOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 2)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.account,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: Spacing.only(top: 4),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.accountOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                    ],
                  ),
                )),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                HandymanHomeScreen(),HandymanPastScreen(),HandymanProfileScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
