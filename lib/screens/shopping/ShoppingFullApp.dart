/*
* File : Shopping App
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingCartScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingHomeScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingProfileScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingSaleScreen.dart';
import 'package:UIKit/screens/shopping/ShoppingSearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingFullApp extends StatefulWidget {
  @override
  _ShoppingFullAppPageState createState() => _ShoppingFullAppPageState();
}

class _ShoppingFullAppPageState extends State<ShoppingFullApp>
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
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 1);
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
              padding: EdgeInsets.only(top: 12, bottom: 12),
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
                              Icon(MdiIcons.store,color: themeData.colorScheme.primary,),
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
                        : Icon(MdiIcons.storeOutline,color: themeData.colorScheme.onBackground,),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 24),
                      child: (_currentIndex == 1)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.magnify,color: themeData.colorScheme.primary,),
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
                          : Icon(MdiIcons.magnify,color: themeData.colorScheme.onBackground,)),
                  Container(
                      margin: EdgeInsets.only(left: 24),
                      child: (_currentIndex == 2)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.tag,color: themeData.colorScheme.primary,),
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
                          : Icon(MdiIcons.tagOutline,color: themeData.colorScheme.onBackground,)),
                  Container(
                      child: (_currentIndex == 3)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.account,color: themeData.colorScheme.primary,),
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
                          : Icon(MdiIcons.accountOutline,color: themeData.colorScheme.onBackground,)),
                ],
              ),
            )),
            floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ShoppingCartScreen();
              }),
            );
          },
          child: Icon(
            MdiIcons.cartOutline,
            color: themeData.colorScheme.primary,
          ),
          backgroundColor: themeData.backgroundColor,
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ShoppingHomeScreen(rootContext: context,),
            ShoppingSearchScreen(rootContext: context,),
            ShoppingSaleScreen(rootContext: context,),
            ShoppingProfileScreen()
          ],
            ),
          ),
        );
      },
    );
  }
}
