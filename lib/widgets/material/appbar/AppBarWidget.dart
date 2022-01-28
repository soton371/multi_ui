/*
* File : Appbar widget
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late ThemeData themeData;

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
              backgroundColor: themeData.scaffoldBackgroundColor,
              body: Container(
                margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                child: ListView(
                  children: <Widget>[
                    /*---------  Leading Icon Appbar ----------------*/
                    Container(
                      child: AppBar(
                        backgroundColor: themeData.appBarTheme.color,
                        leading: IconButton(
                          onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                        ),
                        title: Text("Leading Icon",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,fontWeight: 600)),
                      ),
                    ),

                    /*---------  Trailing Icon Appbar ----------------*/
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: AppBar(
                        backgroundColor: themeData.appBarTheme.color,
                        title: Text("Trailing Icons",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,fontWeight: 600)),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size16!),
                            child: Icon(
                              Icons.settings,
                              color: themeData.appBarTheme.iconTheme!.color,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size16!),
                            child: Icon(
                              Icons.code,
                              color: themeData.appBarTheme.iconTheme!.color,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /*---------  Simple Menu Appbar ----------------*/
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: AppBar(
                        backgroundColor: themeData.appBarTheme.color,
                        title: Text("Simple Menu",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,fontWeight: 600)),
                        actions: <Widget>[
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return _simpleChoice.map((String choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),
                    ),

                    /*---------  Menu with Icons Appbar ----------------*/
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: AppBar(
                        backgroundColor: themeData.appBarTheme.color,
                        title: Text("Menu with icons",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,fontWeight: 600)),
                        actions: <Widget>[
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return _textIconChoice
                                  .map((TextIconItem choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(choice.iconData,
                                          size: 18,
                                          color: themeData.popupMenuTheme
                                              .textStyle!.color),
                                      Padding(
                                        padding: EdgeInsets.only(left: MySize.size8!),
                                        child: Text(choice.text),
                                      )
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            color: themeData.backgroundColor,
                          ),
                        ],
                      ),
                    ),

                    /*---------  Full Appbar ----------------*/
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: AppBar(
                        backgroundColor: themeData.appBarTheme.color,
                        title: Text("Full app bar",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,fontWeight: 600)),
                        leading:IconButton(
                          onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                        ),
                        actions: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: MySize.size16!),
                            child: Icon(Icons.settings),
                          ),
                          Icon(Icons.code),
                          PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return _textIconChoice
                                  .map((TextIconItem choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(choice.iconData,
                                          size: 18,
                                          color: themeData
                                              .colorScheme.onBackground),
                                      Padding(
                                        padding: EdgeInsets.only(left: MySize.size8!),
                                        child: Text(choice.text,
                                            style:
                                                TextStyle(letterSpacing: 0.15)
                                                    .merge(themeData
                                                        .textTheme.bodyText2)
                                                    .merge(TextStyle(
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground))),
                                      )
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            color: themeData.backgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
