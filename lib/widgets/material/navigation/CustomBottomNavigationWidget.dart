/*
* File : Custom Bottom Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/custom/navigation/CustomBottomNavigation.dart';
//import 'package:UIKit/widgets/custom/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  @override
  _CustomBottomNavigationWidgetState createState() =>
      _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState
    extends State<CustomBottomNavigationWidget> {
  int _currentIndex = 0;
  late ThemeData themeData;
  PageController? _pageController;

  var navigationBarTheme;
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
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(MdiIcons.chevronLeft),
                ),
                title: Text("Bottom Navigation",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    /*-------------- Build tab content here -----------------*/
                    Container(
                      child: Center(
                        child: Text("Item 1",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Item 2",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Item 3",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text("Item 4",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight:600)),
                      ),
                    ),
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
                  /*-------------- Build tabs here -----------------*/
                  CustomBottomNavigationBarItem(
                      title:'Item One',
                      icon: Icon(Icons.home),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: 'Item Two',
                      icon: Icon(Icons.apps),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: 'Item Three',
                      icon: Icon(Icons.chat_bubble),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: 'Item Four',
                      icon: Icon(Icons.settings),
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
