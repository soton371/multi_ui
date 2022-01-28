/*
* File : FAB with Tabs
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class FABWithTabsWidget extends StatefulWidget {
  @override
  _FABWithTabsWidgetState createState() => _FABWithTabsWidgetState();
}

class _FABWithTabsWidgetState extends State<FABWithTabsWidget>
    with SingleTickerProviderStateMixin {
  late ThemeData themeData;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabIndex);
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              backgroundColor: themeData.backgroundColor,
              appBar: AppBar(
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text("Tab 1",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600)),
                    ),
                    Tab(
                      child: Text("Tab 2",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600)),
                    ),
                  ],
                ),
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(MdiIcons.chevronLeft),
                ),
                title: Text("FAB with Tabs",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              floatingActionButton: _bottomButtons(),
              body: TabBarView(controller: _tabController, children: [
                Center(
                  child: Container(
                    child: Text('Tab 1'),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text('Tab 2'),
                  ),
                ),
              ]),
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
          style: themeData.textTheme.headline6!
              .merge(TextStyle(color: themeData.colorScheme.onBackground)),
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController!.index == 0
        ? FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.message,
              size: 22.0,
              color: themeData.colorScheme.onPrimary,
            ))
        : FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: null,
            child: Icon(
              Icons.edit,
              size: 22.0,
              color: themeData.colorScheme.onPrimary,
            ),
          );
  }
}
