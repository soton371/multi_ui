import 'dart:async';

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class QuizQuestionType1Screen extends StatefulWidget {
  @override
  _QuizQuestionType1ScreenState createState() =>
      _QuizQuestionType1ScreenState();
}

class _QuizQuestionType1ScreenState extends State<QuizQuestionType1Screen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int quizTimeSecond = 30;
  double remainingSecond = 30;
  int? _selectedOption = -1;
  bool isFlag = false, isFavourite = false;

  List<String> _simpleChoice = ["Report", "Quit"];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 200),
        (Timer timer) => {
              setState(() {
                if (remainingSecond > 0.200) {
                  remainingSecond = remainingSecond - 0.200;
                } else {
                  remainingSecond = 0;
                  timer.cancel();
                }
              })
            });
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
                body: Column(
              children: <Widget>[
                Container(
                  padding: Spacing.fromLTRB(16, 42, 16, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            MdiIcons.chevronLeft,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Molecular Physics",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700),
                            ),
                            Text("Question 1/20",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500))
                          ],
                        ),
                      ),
                      Container(
                        child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return _simpleChoice.map((String choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: Text(choice,
                                    style: TextStyle(letterSpacing: 0.15)
                                        .merge(themeData.textTheme.bodyText2!
                                            .merge(TextStyle(
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0.2)))),
                              );
                            }).toList();
                          },
                          color: themeData.backgroundColor,
                          icon: Icon(MdiIcons.dotsVertical,
                              color: themeData.colorScheme.onBackground),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: Spacing.fromLTRB(48, 0, 48, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "If electrical conductivity increases with the increase of temperature of a substance, then it is a?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,
                                letterSpacing: 0.2,
                                wordSpacing: 0.5,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              questionOption(option: "Conductor", index: 0),
                              questionOption(
                                  option: "Semiconductor", index: 1),
                              questionOption(option: "Insulator", index: 2),
                              questionOption(option: "Carburetor", index: 3),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              TextButton(

                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.chevronLeft,
                                        color: themeData.colorScheme.primary,
                                        size: MySize.size20,
                                      ),
                                      Container(
                                        margin: Spacing.left(8),
                                        child: Text("PREV",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                letterSpacing: 0.5,
                                                color: themeData
                                                    .colorScheme.primary,
                                                fontWeight: 600)),
                                      ),
                                    ],
                                  )),
                              TextButton(

                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          _selectedOption == -1 ? "SKIP" : "NEXT",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              letterSpacing: 0.5,
                                              color: themeData
                                                  .colorScheme.primary,
                                              fontWeight: 600)),
                                      Container(
                                        margin: Spacing.left(4),
                                        child: Icon(
                                          MdiIcons.chevronRight,
                                          color:
                                          themeData.colorScheme.primary,
                                          size: MySize.size20,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                Container(
                  color: customAppTheme.bgLayer2,
                  padding: Spacing.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFlag = !isFlag;
                          });
                        },
                        child: Container(
                          child: Icon(
                            isFlag ? MdiIcons.flag : MdiIcons.flagOutline,
                            color: isFlag
                                ? themeData.colorScheme.primary
                                : themeData.colorScheme.onBackground,
                            size: MySize.size26,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Center(
                            child: buildTimer(),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Container(
                          child: Icon(
                            isFavourite
                                ? MdiIcons.heart
                                : MdiIcons.heartOutline,
                            color: isFavourite
                                ? themeData.colorScheme.primary
                                : themeData.colorScheme.onBackground,
                            size: MySize.size26,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
      },
    );
  }

  Widget questionOption({required String option, int? index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _selectedOption == index
                ? themeData.colorScheme.primary
                : Colors.transparent,
            border: Border.all(
                color: _selectedOption == index
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
        padding: Spacing.fromLTRB(0, 12, 0, 12),
        margin: Spacing.fromLTRB(48, 0, 48, 16),
        child: Center(
          child: Text(
            option,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                color: _selectedOption == index
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
                fontWeight: 600),
          ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return Container(
      width: MySize.size48,
      height: MySize.size48,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: CircularProgressIndicator(
              valueColor: remainingSecond > 5
                  ? AlwaysStoppedAnimation<Color>(
                      themeData.colorScheme.primary,
                    )
                  : AlwaysStoppedAnimation<Color>(
                      customAppTheme.colorError,
                    ),
              value: (quizTimeSecond - remainingSecond) / quizTimeSecond,
            ),
          ),
          Container(
            child: Text(
              remainingSecond.ceil().toString(),
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          )
        ],
      ),
    );
  }
}
