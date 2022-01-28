/*
* File : Cupertino Tabs
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoTabWidget extends StatefulWidget {
  @override
  _CupertinoTabWidgetState createState() =>
      _CupertinoTabWidgetState();
}

class _CupertinoTabWidgetState
    extends State<CupertinoTabWidget> {

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
          return MaterialApp(
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            debugShowCheckedModeBanner: false,
            home: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                activeColor: themeData.colorScheme.secondary,
                items: <BottomNavigationBarItem> [
                  BottomNavigationBarItem(icon: Icon(MdiIcons.message)),
                  BottomNavigationBarItem(icon: Icon(MdiIcons.text)),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                      navigationBar: CupertinoNavigationBar(
                        middle: Text('Page 1 of tab $index'),
                      ),
                      child: Center(
                        child: CupertinoButton(
                          child: Text('Next page'),
                          onPressed: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute<void>(
                                builder: (BuildContext context) {
                                  return CupertinoPageScaffold(
                                    navigationBar: CupertinoNavigationBar(
                                      middle: Text('Page 2 of tab $index'),
                                    ),
                                    child: Center(
                                      child: CupertinoButton(
                                        child: Text('Back'),
                                        onPressed: () { Navigator.of(context).pop(); },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
    );
  }

}
