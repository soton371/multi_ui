/*
* File : Expansion Tile
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {

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
                  title: Text("Expansion Tile",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ExpansionTile(

                              initiallyExpanded: true,
                              title: Text("First tile"),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child:
                                  Center(child: Text("This is first tile")),
                                )
                              ],
                            ),
                            ExpansionTile(
                              title: Text("Second tile"),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                      child: Text("This is second content")),
                                )
                              ],
                            ),
                            ExpansionTile(
                              title: Text("Third tile"),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                      child: Text("This is third content")),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ))));
      },
    );
  }
}