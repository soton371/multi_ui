import 'package:UIKit/screens/course/CourseProfileScreen.dart';
import 'package:UIKit/screens/course/CourseSearchScreen.dart';
import 'package:UIKit/screens/course/CourseTasksScreen.dart';
import 'package:UIKit/screens/course/CourseVideoScreen.dart';
import 'package:UIKit/screens/lms/LMSHomeScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';


class LMSFullApp extends StatefulWidget {
  @override
  _LMSFullAppState createState() => _LMSFullAppState();
}

class _LMSFullAppState extends State<LMSFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
                elevation: 0,
                shape: CircularNotchedRectangle(),
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.bottomAppBarTheme.color,
                    boxShadow: [
                      BoxShadow(
                        color: themeData.cardTheme.shadowColor!.withAlpha(40),
                        blurRadius: 3,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  padding: Spacing.vertical(12),
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
                              margin: EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: themeData.primaryColor,
                                  borderRadius: new BorderRadius.all(
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
                          margin: EdgeInsets.only(right: 24),
                          child: (_currentIndex == 1)
                              ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.magnify,
                                color: themeData.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: themeData.primaryColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                              : Icon(
                            MdiIcons.magnify,
                            color: themeData.colorScheme.onBackground,
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 24),
                          child: (_currentIndex == 2)
                              ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.chartTimelineVariant,
                                color: themeData.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: themeData.primaryColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                              : Icon(
                            MdiIcons.chartTimelineVariant,
                            color: themeData.colorScheme.onBackground,
                          )),
                      Container(
                          child: (_currentIndex == 3)
                              ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                MdiIcons.download,
                                color: themeData.colorScheme.primary,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: themeData.primaryColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                              : Icon(
                            MdiIcons.downloadOutline,
                            color: themeData.colorScheme.onBackground,
                          )),
                    ],
                  ),
                )),
            floatingActionButton: Hero(
              tag: 'course-video',
              child: Container(
                padding: Spacing.all(3),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius:
                  BorderRadius.all(Radius.circular(MySize.size32!)),
                  boxShadow: [
                    BoxShadow(
                      color: themeData.colorScheme.primary.withAlpha(50),
                      blurRadius: MySize.size5!,
                      spreadRadius: 1,
                      offset: Offset(0, MySize.size2),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: null,
                  tooltip: "Video",
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) => CourseVideoScreen()));
                  },
                  child: Icon(
                    MdiIcons.play,
                    size: MySize.size24,
                    color: themeData.colorScheme.onPrimary,
                  ),
                  backgroundColor: themeData.colorScheme.primary,
                  elevation: 0,
                ),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                LMSHomeScreen(),
                CourseSearchScreen(),
                CourseTasksScreen(),
                CourseProfileScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}

