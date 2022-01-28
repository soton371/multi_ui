
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class FAQQuestionScreen extends StatefulWidget {
  @override
  _FAQQuestionScreenState createState() => _FAQQuestionScreenState();
}

class _FAQQuestionScreenState extends State<FAQQuestionScreen> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;
  List<bool> _dataExpansionPanel = [false, true, false, false, false];

  late List<String> _content;

  initState() {
    super.initState();
    _content = List.generate(5, (index) =>
        Generator.getParagraphsText(
            paragraph: 2, words: 24, noOfNewLine: 2, withHyphen: true));
  }


  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("FAQ",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: MySize.size16!),
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
                                  title: Text("What is offers",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight: isExpanded
                                              ? 600
                                              : 500)),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.only(bottom: MySize.size16!,
                                    left: MySize.size16!,
                                    right: MySize.size16!), child: Center(
                                child: Text(_content[0],
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
                                  title: Text(
                                      "How do i make payment with credit card",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight: isExpanded
                                              ? 600
                                              : 500)),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.only(bottom: MySize.size16!,
                                    left: MySize.size16!,
                                    right: MySize.size16!), child: Center(
                                child: Text(_content[1],
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500)),
                              ),
                              ),
                              isExpanded: _dataExpansionPanel[1]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("How can i upgrade my membership",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight: isExpanded
                                              ? 600
                                              : 500)),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.only(bottom: MySize.size16!,
                                    left: MySize.size16!,
                                    right: MySize.size16!), child: Center(
                                child: Text(_content[2],
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500)),
                              ),
                              ),
                              isExpanded: _dataExpansionPanel[2]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("How i contact with seller",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight: isExpanded
                                              ? 600
                                              : 500)),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.only(bottom: MySize.size16!,
                                    left: MySize.size16!,
                                    right: MySize.size16!),
                                child: Center(
                                  child: Text(_content[3],
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500)),
                                ),
                              ),
                              isExpanded: _dataExpansionPanel[3]),
                          ExpansionPanel(
                              canTapOnHeader: true,
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text("Where is my order",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: isExpanded
                                              ? themeData.colorScheme.primary
                                              : themeData
                                              .colorScheme.onBackground,
                                          fontWeight: isExpanded
                                              ? 600
                                              : 500)),
                                );
                              },
                              body: Container(
                                padding: EdgeInsets.only(bottom: MySize.size16!,
                                    left: MySize.size16!,
                                    right: MySize.size16!), child: Center(
                                child: Text(_content[4],
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500)),
                              ),
                              ),
                              isExpanded: _dataExpansionPanel[4]),

                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Center(
                          child: Text("Visit our site",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),

                          ),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
