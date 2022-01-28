/*
* File : Navigation Rail widget
* Version : 1.0.0
* Description :
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class NavigationRailWidget extends StatefulWidget {
  @override
  _NavigationRailWidgetState createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {
  int _selectedIndex = 0;

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
              body: Padding(
                padding: FxSpacing.top(32),
                child: Row(
                  children: <Widget>[
                    NavigationRail(
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(MdiIcons.chevronLeft,color: themeData.colorScheme.onBackground,),
                      ),
                      selectedIndex: _selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      labelType: NavigationRailLabelType.selected,
                      /*------------- Build Tabs -------------------*/
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(Icons.favorite_border),
                          selectedIcon: Icon(Icons.favorite),
                          label: Text(
                            'First',
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 700,
                                color: themeData.colorScheme.primary),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: Icon(MdiIcons.bookOutline),
                          selectedIcon: Icon(MdiIcons.book),
                          label: Text(
                            'Second',
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 700,
                                color: themeData.colorScheme.primary),
                          ),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.star_border),
                          selectedIcon: Icon(Icons.star),
                          label: Text(
                            'Third',
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 700,
                                color: themeData.colorScheme.primary),
                          ),
                        ),
                      ],
                    ),

                    // This is the main content.
                    Expanded(
                      child: Container(
                        color: themeData.colorScheme.background,
                        child: Center(
                          child: Text(
                            'Selected : $_selectedIndex',
                            style: themeData.textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0.3)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
