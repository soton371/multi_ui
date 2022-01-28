import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/food/FoodFavouriteScreen.dart';
import 'package:UIKit/screens/food/FoodHomeScreen.dart';
import 'package:UIKit/screens/food/FoodProfileScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'FoodLocationScreen.dart';

class FoodFullApp extends StatefulWidget {
  @override
  _FoodFullAppState createState() => _FoodFullAppState();
}

class _FoodFullAppState extends State<FoodFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
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
                padding: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
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
                                    MdiIcons.food,
                                    color: themeData.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: MySize.size4!),
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
                                MdiIcons.food,
                                color: themeData.colorScheme.onBackground,
                              ),
                      ),
                      Container(
                          child: (_currentIndex == 1)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.mapMarker,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius:
                                              new BorderRadius.all(
                                                  Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.mapMarkerOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 2)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.heart,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius:
                                              new BorderRadius.all(
                                                  Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  MdiIcons.heartOutline,
                                  color: themeData.colorScheme.onBackground,
                                )),
                      Container(
                          child: (_currentIndex == 3)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.account,
                                      color: themeData.colorScheme.primary,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: MySize.size4!),
                                      decoration: BoxDecoration(
                                          color: themeData.primaryColor,
                                          borderRadius:
                                              new BorderRadius.all(
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
                    ]))),
            body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            FoodHomeScreen(),
            FoodLocationScreen(rootContext: context,),
            FoodFavouriteScreen(),
            FoodProfileScreen(rootContext: context,),
          ],
            ),
          ),
        );
      },
    );
  }
}
