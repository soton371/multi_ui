/*
* File : Expansion Panel
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ExpansionPanelWidget extends StatefulWidget {
  @override
  _ExpansionPanelWidgetState createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {
  List<bool> _dataExpansionPanel = [false, true, false];
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
                  title: Text("Expansion Panel",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Column(
                  children: <Widget>[
                    ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _dataExpansionPanel[index] = !isExpanded;
                        });
                      },
                      animationDuration: Duration(milliseconds: 500),
                      children: <ExpansionPanel>[
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text("First panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: isExpanded
                                            ? themeData.colorScheme.primary
                                            : themeData
                                                .colorScheme.onBackground,
                                        fontWeight: isExpanded
                                            ? 700
                                            : 600)),
                              );
                            },
                            body: Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Center(
                                child: Text("Content of panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500)),
                              ),
                            ),
                            isExpanded: _dataExpansionPanel[0]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text("Second panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: isExpanded
                                            ? themeData.colorScheme.primary
                                            : themeData
                                                .colorScheme.onBackground,
                                        fontWeight: isExpanded
                                            ? 700
                                            : 600)),
                              );
                            },
                            body: Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Center(
                                child: Text("Content of panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,fontWeight: 500)),
                              ),
                            ),
                            isExpanded: _dataExpansionPanel[1]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: Text("Third panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: isExpanded
                                            ? themeData.colorScheme.primary
                                            : themeData
                                                .colorScheme.onBackground,
                                        fontWeight: isExpanded
                                            ? 700
                                            :600)),
                              );
                            },
                            body: Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Center(
                                child: Text("Content of panel",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,fontWeight: 500)),
                              ),
                            ),
                            isExpanded: _dataExpansionPanel[2])
                      ],
                    )
                  ],
                )));
      },
    );
  }
}
