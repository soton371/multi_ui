/*
* File : Bottom Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
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
              body: Container(
                color: themeData.backgroundColor,
                child: Center(
                  child: _currentIndex == 0
                      ? Icon(Icons.chat,
                          color: themeData.colorScheme.onBackground, size: 80)
                      : Icon(Icons.call,
                          color: themeData.colorScheme.onBackground, size: 80),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                /*----------- Build Bottom Navigation Tab here ---------------*/
                currentIndex: _currentIndex,
                backgroundColor: themeData.bottomAppBarTheme.color,
                selectedIconTheme: IconThemeData(color: themeData.primaryColor),
                selectedItemColor: themeData.primaryColor,
                unselectedIconTheme:
                    IconThemeData(color: themeData.colorScheme.onBackground),
                unselectedItemColor: themeData.colorScheme.onBackground,
                onTap: onTapped,
                items: [
                  /*----------- Build Bottom Navigation Content here ---------------*/
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.chat),

                      label: 'CHAT'),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.call),
                      label: 'CALL',)
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
