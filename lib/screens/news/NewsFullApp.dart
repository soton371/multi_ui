import 'package:UIKit/screens/news/NewsFeedScreen.dart';
import 'package:UIKit/screens/news/NewsHomeScreen.dart';
import 'package:UIKit/screens/news/NewsProfileScreen.dart';
import 'package:UIKit/screens/news/NewsVideoScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:UIKit/utils/custom/navigation/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';


class NewsFullApp extends StatefulWidget {
  @override
  _NewsFullAppState createState() => _NewsFullAppState();
}

class _NewsFullAppState extends State<NewsFullApp> {
  int _currentIndex = 0;
  ThemeData? themeData;
  PageController? _pageController;

  late var navigationBarTheme;
  // late NavigationBarTheme navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        navigationBarTheme =
            AppTheme.getNavigationThemeFromMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    NewsHomeScreen(),
                    NewsFeedScreen(),
                    NewsVideoScreen(),
                    NewsProfileScreen()
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavigation(
                animationDuration: Duration(milliseconds: 350),
                selectedItemOverlayColor:
                    navigationBarTheme.selectedOverlayColor,
                backgroundColor: navigationBarTheme.backgroundColor,
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() => _currentIndex = index);
                  _pageController!.jumpToPage(index);
                },
                items: <CustomBottomNavigationBarItem>[
                  CustomBottomNavigationBarItem(
                      title: "Home",
                      icon: Icon(MdiIcons.homeOutline, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.home, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "My Feed",
                      icon: Icon(MdiIcons.bookmarkOutline, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.bookmark, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Video",
                      icon: Icon(MdiIcons.playCircleOutline, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.playCircle, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: "Profile",
                      icon: Icon(
                        MdiIcons.accountOutline,
                        size: MySize.size22,
                      ),
                      activeIcon: Icon(
                        MdiIcons.account,
                        size: MySize.size22,
                      ),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                ],
              ),
            ));
      },
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
