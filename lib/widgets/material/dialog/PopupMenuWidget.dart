/*
* File : Popup Menu with Icon
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class PopupMenuWidget extends StatefulWidget {
  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  late ThemeData themeData;
  final GlobalKey _textIconMenuKey = new GlobalKey();
  final GlobalKey _simpleMenuKey = new GlobalKey();

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

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
                  title: Text("Popup with icons",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PopupMenuButton(
                        key: _simpleMenuKey,
                        itemBuilder: (BuildContext context) {
                          return _simpleChoice.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: Text(choice,
                                  style: TextStyle(letterSpacing: 0.15).merge(
                                      themeData.textTheme.bodyText2!.merge(
                                          TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0.2)))),
                            );
                          }).toList();
                        },
                        color: themeData.backgroundColor,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(20),
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ElevatedButton(

                              onPressed: () {
                                dynamic state = _simpleMenuKey.currentState;
                                state.showButtonMenu();
                              },
                              child: Text("Popup Menu",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 500))),
                        ),
                      ),
                      PopupMenuButton(
                        key: _textIconMenuKey,
                        itemBuilder: (BuildContext context) {
                          return _textIconChoice.map((TextIconItem choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: Row(
                                children: <Widget>[
                                  Icon(choice.iconData,
                                      size: 18,
                                      color:
                                          themeData.colorScheme.onBackground),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(choice.text,
                                        style: TextStyle(letterSpacing: 0.15)
                                            .merge(
                                                themeData.textTheme.bodyText2)
                                            .merge(TextStyle(
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0.15))),
                                  )
                                ],
                              ),
                            );
                          }).toList();
                        },
                        color: themeData.backgroundColor,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(20),
                                blurRadius: 2,
                                offset:
                                    Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ElevatedButton(

                              onPressed: () {
                                dynamic state = _textIconMenuKey.currentState;
                                state.showButtonMenu();
                              },
                              child: Text("Text with icon menu",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 500))),
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
