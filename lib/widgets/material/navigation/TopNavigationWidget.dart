/*
* File : Top Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class TopNavigationWidget extends StatefulWidget {
  @override
  _TopNavigationWidgetState createState() => _TopNavigationWidgetState();
}

class _TopNavigationWidgetState extends State<TopNavigationWidget> {
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
                elevation: 0,
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(MdiIcons.chevronLeft),
                ),
                title: Text("Top Navigation",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight:600)),
              ),
              body: DefaultTabController(
                length: 3,
                initialIndex: 1,
                child: new Scaffold(
                  appBar: new AppBar(
                    flexibleSpace: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /*-------------- Build Tabs here ------------------*/
                        new TabBar(
                          tabs: [
                            Tab(
                                child: Text("Tab 1",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600))),
                            Tab(
                                child: Text("Tab 2",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600))),
                            Tab(
                                child: Text("Tab 3",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600))),
                          ],
                        )
                      ],
                    ),
                  ),

                  /*--------------- Build Tab body here -------------------*/
                  body: TabBarView(
                    children: <Widget>[
                      getTabContent('Tab 1'),
                      getTabContent('Tab 2'),
                      getTabContent('Tab 3')
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Center(
        child: Text(
          text,
          style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
              fontWeight:600),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
