/*
* File : History Search
* Version : 1.0.0
* */

import 'dart:async';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class HistorySearchWidget extends StatefulWidget {
  @override
  _HistorySearchWidgetState createState() => _HistorySearchWidgetState();
}

class _HistorySearchWidgetState extends State<HistorySearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData themeData;

  void _onSubmit(text) {
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
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
                                    color: themeData
                                        .colorScheme
                                        .onBackground
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
                                  "A",
                                  style: themeData
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                          color: themeData
                                              .colorScheme
                                              .onSecondary)),
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          _suggestionWidget(
                            'Suggestion 1'
                          ),
                          _suggestionWidget(
                            'Suggestion 2'
                          ),
                          _suggestionWidget(
                            'Suggestion 3'
                          ),
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
                                      fontWeight:700)),
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

  Widget _suggestionWidget(String suggestion){
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Icon(
            MdiIcons.history,
            size: 22,
            color: themeData.colorScheme.onBackground.withAlpha(220),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: Text(
                  suggestion,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,fontWeight:500)
                )),
          )
        ],
      ),
    );
  }
}

