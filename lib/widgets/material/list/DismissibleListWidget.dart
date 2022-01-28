/*
* File : Dismissible List
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class DismissibleListWidget extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _WidgetState extends State<DismissibleListWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late ThemeData themeData;
  late List<SingleMail> _mailList;

  @override
  void initState() {
    super.initState();
    _mailList = [
      SingleMail("BookMyShow", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "21 April", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "22 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "19 Feb", false),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "17 April", true),
      SingleMail("Lourensa", "#stayinhome challenge is back",
          "this is dummy mail content", "15 May", false),
      SingleMail("Codeforces", "#stayinhome challenge is back",
          "this is dummy mail content", "13 Jan", true),
      SingleMail("Flutter", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", true),
      SingleMail("Google", "#stayinhome challenge is back",
          "this is dummy mail content", "30 April", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "27 Feb", true),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "14 May", false),
    ];
  }

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
                  title: Text("Dismissible List",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _mailList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            color: themeData.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.delete,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Delete",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 500,color: themeData.colorScheme.onPrimary)),
                                )
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            color: themeData.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Archive",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight:500,color: themeData.colorScheme.onPrimary)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    MdiIcons.inboxArrowDown,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              setState(() {
                                _mailList.removeAt(index);
                                showSnackbarWithFloating("Archived");
                              });
                            } else {
                              setState(() {
                                _mailList.removeAt(index);
                                showSnackbarWithFloating("Deleted");
                              });
                            }
                          },
                          key: UniqueKey(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 12, left: 16, right: 16, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(_mailList[index].name[0]),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                    _mailList[index].name,
                                                    style: AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .subtitle2,
                                                        fontWeight:
                                                            _mailList[index]
                                                                    .isRead
                                                                ? 600
                                                                : 800))),
                                            Text(_mailList[index].date,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    fontWeight:
                                                        _mailList[index].isRead
                                                            ? 600
                                                            : 800))
                                          ],
                                        ),
                                        Text(_mailList[index].title,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2,
                                                fontWeight:
                                                    _mailList[index].isRead
                                                        ? 600
                                                        : 800)),
                                        Text(_mailList[index].message,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600))
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ))));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
