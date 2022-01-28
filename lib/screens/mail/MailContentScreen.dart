/*
* File : Mail Content
* Version : 1.0.0
* */

import 'dart:math';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class MailContentScreen extends StatefulWidget {
  @override
  _MailContentScreenState createState() => _MailContentScreenState();
}

class _MailContentScreenState extends State<MailContentScreen> {
  List<String> _simpleChoice = [
    "Move to",
    "Snooze",
    "Mark as important",
    "Mute",
    "Print",
    "Report spam",
    "Help and feedback"
  ];

  String _messageText =
      "1. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled \n\n 2. it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s \n\n 3. with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
              appBar: new AppBar(
                elevation: 0,
                backgroundColor: themeData.backgroundColor,
                leading: Material(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(MdiIcons.arrowLeft,
                            size: 28,
                            color: themeData.colorScheme.onBackground))),
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: MySize.size24!),
                    child: Material(
                        child: InkWell(
                            child: Icon(MdiIcons.packageDown,
                                size: 24,
                                color: themeData.colorScheme.onBackground))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: MySize.size24!),
                    child: Material(
                        child: InkWell(
                            child: Icon(MdiIcons.trashCanOutline,
                                size: 24,
                                color: themeData.colorScheme.onBackground))),
                  ),
                  Container(
                    child: Material(
                        child: InkWell(
                            child: Icon(MdiIcons.emailOutline,
                                size: MySize.size24,
                                color: themeData.colorScheme.onBackground))),
                  ),
                  Material(
                    child: InkWell(
                      child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return _simpleChoice.map((String choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: Text(choice,
                                    style: TextStyle(letterSpacing: 0.15).merge(
                                        AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 500))),
                              );
                            }).toList();
                          },
                          icon: Icon(MdiIcons.dotsVertical,
                              color: themeData.colorScheme.onBackground),
                          color: themeData.backgroundColor),
                    ),
                  )
                ],
              ),
              body: Container(
                color: themeData.backgroundColor,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Text(
                                "I analyzed data from 65,000 software developer, their salaries and how they code",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 600),
                              )),
                          Container(
                            child: Icon(
                              MdiIcons.starOutline,
                              color: themeData.colorScheme.onBackground,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size32!),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: MySize.size16!),
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: AssetImage(
                                      "./assets/images/avatar-2.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text("Quincy Larson",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            fontWeight: 600,
                                            letterSpacing: 0)),
                                    Container(
                                        margin: EdgeInsets.only(left: MySize.size4!),
                                        child: Text("4 day ago",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 500,
                                                letterSpacing: 0))),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text("to",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 500)),
                                    Container(
                                        margin: EdgeInsets.only(left: MySize.size2),
                                        child: Text("me",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 500))),
                                    Container(
                                        margin: EdgeInsets.only(left: MySize.size2),
                                        child: Icon(
                                          MdiIcons.chevronDown,
                                          size: 18,
                                          color: themeData
                                              .colorScheme.onBackground,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: MySize.size16!),
                                  child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationX(pi),
                                      child: Icon(
                                        MdiIcons.subdirectoryArrowLeft,
                                        size: MySize.size22,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      )),
                                ),
                                Icon(MdiIcons.dotsVertical,
                                    size: MySize.size22,
                                    color: themeData.colorScheme.onBackground)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      child: Text(_messageText,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(

                              onPressed: () {},

                              child: Row(
                                children: <Widget>[
                                  Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(pi),
                                      child: Icon(
                                        MdiIcons.shareOutline,
                                        size: MySize.size20,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size8!),
                                    child: Text("Replay",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600)),
                                  ),
                                ],
                              )),
                          TextButton(

                              onPressed: () {},

                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.shareOutline,
                                    size: MySize.size20,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size8!),
                                    child: Text("Forward",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600)),
                                  ),
                                ],
                              )),
                          TextButton(

                              onPressed: () {},

                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.shareVariant,
                                    size: MySize.size20,
                                    color: themeData.colorScheme.onBackground,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size8!),
                                    child: Text("Share",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600)),
                                  ),
                                ],
                              )),
                        ],
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
