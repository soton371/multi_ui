/*
* File : Filter (Tags) Search
* Version : 1.0.0
* */


import 'dart:async';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FilterSearchWidget extends StatefulWidget {
  @override
  _FilterSearchWidgetState createState() => _FilterSearchWidgetState();
}

class _FilterSearchWidgetState extends State<FilterSearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData themeData;

  List<String> _tagList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  List<String> _selectedTags = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  void _onSubmit(text) {
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    _tagList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(2.0),
        child: ChoiceChip(
          selectedColor: themeData.colorScheme.primary,
          label: Text(
            item,
            style: themeData.textTheme.bodyText2!.merge(TextStyle(
                color: _selectedTags.contains(item)
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground)),
          ),
          selected: _selectedTags.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedTags.contains(item)
                  ? _selectedTags.remove(item)
                  : _selectedTags.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Column(
              children: <Widget>[
                FxSpacing.height(32),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 8, right: 12, bottom: 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    size: 24,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(240),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 8),
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Search here",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        isDense: true,
                                      ),
                                      autofocus: true,
                                      maxLines: 1,
                                      textInputAction: TextInputAction.search,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSubmitted: _onSubmit,
                                    ),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    themeData.colorScheme.secondary,
                                child: Text(
                                  "D",
                                  style: themeData.textTheme.subtitle2!.merge(
                                      TextStyle(
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 4, top: 4),
                                  child: Text("TAGS",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 700)),
                                ),
                                Wrap(
                                  children: _buildChoiceList(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _isInProgress
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                              themeData.colorScheme.primary,
                            )),
                          ),
                        )
                      : Container(
                          color: themeData.backgroundColor,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  MdiIcons.emoticonSadOutline,
                                  size: 32,
                                  color: themeData.colorScheme.onBackground,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text("No Result!",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 700)),
                                ),
                                Text("Try another keyword",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500)),
                              ],
                            ),
                          )),
                ),
              ],
            )));
      },
    );
  }
}
