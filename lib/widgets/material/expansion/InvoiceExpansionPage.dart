/*
* File : Invoice Expansion
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class InvoiceExpansionPage extends StatefulWidget {
  @override
  _InvoiceExpansionPageState createState() => _InvoiceExpansionPageState();
}

class _InvoiceExpansionPageState extends State<InvoiceExpansionPage> {
  List<bool> _dataExpansionPanel = [true, false, true];

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
                  title: Text("Invoice",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 16, left: 24, right: 24, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Invoice",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600),
                                ),
                                Text("# 100457",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 500)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Date",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600),
                                ),
                                Text("8, Jun",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 500)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: themeData.backgroundColor,
                        padding: EdgeInsets.all(16),
                        child: Column(
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
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text("Personal Information",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle1,
                                                  fontWeight:
                                                      isExpanded ? 700 : 600,
                                                  letterSpacing: 0)));
                                    },
                                    body: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            bottom: 16,
                                            top: 0,
                                            left: 24,
                                            right: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Mr. Rodrigo Pierce",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    height: 1.4,
                                                    fontWeight: 500)),
                                            Text("rog_pie@gmail.com",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    height: 1.4,
                                                    fontWeight: 500,
                                                    letterSpacing: 0.3)),
                                            Text("Contact : (047) 98760235 ",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    fontWeight: 500,
                                                    height: 1.4)),
                                          ],
                                        )),
                                    isExpanded: _dataExpansionPanel[0]),
                                ExpansionPanel(
                                    canTapOnHeader: true,
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text("Address",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle1,
                                                  fontWeight:
                                                      isExpanded ? 700 : 600,
                                                  letterSpacing: 0)));
                                    },
                                    body: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            bottom: 16,
                                            top: 0,
                                            left: 24,
                                            right: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("4675  Hartland Avenue",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    fontWeight: 500,
                                                    height: 1.4)),
                                            Text("Ashwa - 54304",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    fontWeight: 500,
                                                    height: 1.4)),
                                            Text("United Kingdom ",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle2,
                                                    fontWeight: 500,
                                                    height: 1.4)),
                                          ],
                                        )),
                                    isExpanded: _dataExpansionPanel[1]),
                                ExpansionPanel(
                                    canTapOnHeader: true,
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text("Bill",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle1,
                                                  fontWeight: isExpanded
                                                      ? 700
                                                      : 600,
                                                  letterSpacing: 0)));
                                    },
                                    body: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            bottom: 16,
                                            top: 0,
                                            left: 24,
                                            right: 24),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("Subtotal",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .subtitle1,
                                                            fontWeight:600,
                                                            height: 1.4)),
                                                Text("\$  299.99",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .subtitle1,
                                                            fontWeight:600,
                                                            height: 1.4)),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text("Shipping cost",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              fontWeight:600,
                                                              height: 1.4)),
                                                  Text("\$  49",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              fontWeight:600,
                                                              height: 1.4)),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text("Taxes",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              fontWeight:600,
                                                              height: 1.4)),
                                                  Text("\$  29",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              fontWeight:600,
                                                              height: 1.4)),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text("Total",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              height: 1.4,
                                                              fontWeight:800)),
                                                  Text("\$  399",
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              height: 1.4,
                                                              fontWeight:800)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    isExpanded: _dataExpansionPanel[2])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
