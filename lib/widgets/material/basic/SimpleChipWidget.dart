/*
* File : Simple Chip 
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SimpleChipWidget extends StatefulWidget {
  @override
  _SimpleChipWidgetState createState() => _SimpleChipWidgetState();
}

class _SimpleChipWidgetState extends State<SimpleChipWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Simple Chip",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    color: themeData.backgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Chip(
                            backgroundColor: themeData.colorScheme.background,
                            label: Text(
                              'Simple',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            backgroundColor: themeData.colorScheme.background,
                            avatar: CircleAvatar(
                              backgroundColor: themeData.colorScheme.primary,
                              child: Text(
                                'L',
                                style: themeData.textTheme.subtitle1!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onSecondary)),
                              ),
                            ),
                            label: Text(
                              'Leading',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            deleteIconColor: themeData.colorScheme.secondary,
                            backgroundColor: themeData.colorScheme.background,
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text(
                              'Trailing',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            deleteIconColor: themeData.colorScheme.secondary,
                            backgroundColor: themeData.colorScheme.background,
                            avatar: CircleAvatar(
                              backgroundColor: themeData.colorScheme.primary,
                              child: Text(
                                'S',
                                style: themeData.textTheme.subtitle1!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onPrimary)),
                              ),
                            ),
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text('Small',
                                style: themeData.textTheme.subtitle1!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ),
                          Chip(
                            padding: EdgeInsets.all(8),
                            deleteIconColor: themeData.colorScheme.secondary,
                            backgroundColor: themeData.colorScheme.background,
                            avatar: CircleAvatar(
                              backgroundColor: themeData.colorScheme.primary,
                              child: Text(
                                'M',
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onPrimary)),
                              ),
                            ),
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text(
                              'Medium',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            padding: EdgeInsets.all(8),
                            deleteIcon: Icon(MdiIcons.delete),
                            backgroundColor: themeData.colorScheme.background,
                            deleteIconColor: themeData.colorScheme.secondary,
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text(
                              'Custom Icon',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            deleteButtonTooltipMessage: "Custom Message",
                            padding: EdgeInsets.all(8),
                            avatar: CircleAvatar(
                              backgroundColor: themeData.colorScheme.primary,
                              child: Text(
                                'H',
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onPrimary)),
                              ),
                            ),
                            deleteIconColor: themeData.colorScheme.secondary,
                            backgroundColor: themeData.colorScheme.background,
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text(
                              'Hold Delete',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                          Chip(
                            padding: EdgeInsets.all(8),
                            elevation: 10,
                            avatar: CircleAvatar(
                              backgroundColor: themeData.colorScheme.primary,
                              child: Text(
                                'E',
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onPrimary)),
                              ),
                            ),
                            deleteIconColor: themeData.colorScheme.secondary,
                            backgroundColor: themeData.colorScheme.background,
                            onDeleted: () {
                              showSimpleSnackbar("Delete pressed");
                            },
                            label: Text(
                              'Elevated',
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            ),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }

  void showSimpleSnackbar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
    );
  }
}
