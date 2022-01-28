/*
* File : Grocery App
* Version : 1.0.0
* */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../AppTheme.dart';
import 'grocery_cart_screen.dart';
import 'grocery_home_screen.dart';
import 'grocery_profile_screen.dart';
import 'grocery_search_screen.dart';

class GroceryFullApp extends StatefulWidget {
  @override
  _GroceryFullAppState createState() => _GroceryFullAppState();
}

class _GroceryFullAppState extends State<GroceryFullApp>
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
    super.initState();

    FxTextStyle.changeFontFamily(GoogleFonts.libreFranklin);
    // FxTextStyle.changeDefaultFontWeight({
    //   100: FontWeight.w100,
    //   200: FontWeight.w200,
    //   300: FontWeight.w300,
    //   400: FontWeight.w400,
    //   500: FontWeight.w500,
    //   600: FontWeight.w600,
    //   700: FontWeight.w700,
    //   800: FontWeight.w800,
    //   900: FontWeight.w900,
    // });

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

  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: <Widget>[
                GroceryHomeScreen(
                  rootContext: context,
                ),
                GrocerySearchScreen(
                  rootContext: context,
                ),
                GroceryCartScreen(
                  rootContext: context,
                ),
                GroceryProfileScreen(rootContext: context)
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: FxSpacing.all(16),
                child: PhysicalModel(
                  color: AppTheme.customTheme.groceryBg1.withAlpha(160),
                  elevation: 12,
                  // borderRadius: Shape.circular(8),
                  shadowColor: AppTheme.customTheme.shadowColor.withAlpha(140),
                  shape: BoxShape.rectangle,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.customTheme.groceryBg1.withAlpha(160),
                      // borderRadius: Shape.circular(16)
                    ),
                    padding: FxSpacing.vertical(12),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppTheme.customTheme.groceryPrimary,
                      tabs: <Widget>[
                        Container(
                          child: (_currentIndex == 0)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    FxText.b2("Home",
                                        color:
                                            AppTheme.customTheme.groceryPrimary,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                    Container(
                                      margin: FxSpacing.top(6),
                                      decoration: BoxDecoration(
                                          color:
                                              AppTheme.customTheme.groceryPrimary,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2.5))),
                                      height: 5,
                                      width: 5,
                                    )
                                  ],
                                )
                              : Icon(
                                  FeatherIcons.home,
                                  size: 20,
                                  color: AppTheme.theme.colorScheme.onBackground,
                                ),
                        ),
                        Container(
                            child: (_currentIndex == 1)
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FxText.b2("Search",
                                          color:
                                              AppTheme.customTheme.groceryPrimary,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                      Container(
                                        margin: FxSpacing.top(6),
                                        decoration: BoxDecoration(
                                            color: AppTheme
                                                .customTheme.groceryPrimary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.5))),
                                        height: 5,
                                        width: 5,
                                      )
                                    ],
                                  )
                                : Icon(
                                    FeatherIcons.search,
                                    size: 20,
                                    color:
                                        AppTheme.theme.colorScheme.onBackground,
                                  )),
                        Container(
                            child: (_currentIndex == 2)
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FxText.b2("Cart",
                                          color:
                                              AppTheme.customTheme.groceryPrimary,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                      Container(
                                        margin: FxSpacing.top(6),
                                        decoration: BoxDecoration(
                                            color: AppTheme
                                                .customTheme.groceryPrimary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.5))),
                                        height: 5,
                                        width: 5,
                                      )
                                    ],
                                  )
                                : Icon(
                                    FeatherIcons.shoppingCart,
                                    size: 20,
                                    color:
                                        AppTheme.theme.colorScheme.onBackground,
                                  )),
                        Container(
                            child: (_currentIndex == 3)
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      FxText.b2("Profile",
                                          color:
                                              AppTheme.customTheme.groceryPrimary,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                      Container(
                                        margin: FxSpacing.top(6),
                                        decoration: BoxDecoration(
                                            color: AppTheme
                                                .customTheme.groceryPrimary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.5))),
                                        height: 5,
                                        width: 5,
                                      )
                                    ],
                                  )
                                : Icon(
                                    FeatherIcons.user,
                                    size: 20,
                                    color:
                                        AppTheme.theme.colorScheme.onBackground,
                                  )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
