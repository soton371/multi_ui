/*
* File : Middle FAB
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class MiddleFABWidget extends StatefulWidget {
  @override
  _MiddleFABWidgetState createState() => _MiddleFABWidgetState();
}

class _MiddleFABWidgetState extends State<MiddleFABWidget> {
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
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Middle FAB",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Container(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Container(
                                  color: themeData.backgroundColor,
                                  child: Center(
                                    child: Text(
                                      "Primary Content",
                                      style: themeData.textTheme.subtitle1!
                                          .merge(TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground,
                                        letterSpacing: 0.2,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  color: themeData.colorScheme.background,
                                  child: Center(
                                    child: Text(
                                      "Secondary Content",
                                      style: themeData.textTheme.subtitle1!
                                          .merge(TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(220),
                                        letterSpacing: 0.2,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 2 - 75,
                          right: 20,
                          child: FloatingActionButton(
                            onPressed: () {
                              _showBottomSheet(context);
                            },
                            child: Icon(
                              Icons.info_outline,
                              size: 28,
                            ),
                          ),
                        )
                      ],
                    )))));
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            height: 180,
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(12.0),
                      topRight: const Radius.circular(12.0))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 24.0, right: 24.0, bottom: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.email,
                            color: themeData.colorScheme.onBackground),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("nat@gmail.com",
                              style: TextStyle(
                                      color: themeData.colorScheme.onBackground)
                                  .merge(TextStyle(letterSpacing: 0.15))),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.pin_drop,
                              color: themeData.colorScheme.onBackground),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("149  Cherry Tree Drive, Florida",
                                style: TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground)
                                    .merge(TextStyle(letterSpacing: 0.15))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.phone,
                              color: themeData.colorScheme.onBackground),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("+91 9876543210",
                                style: TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground)
                                    .merge(TextStyle(letterSpacing: 0.15))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
