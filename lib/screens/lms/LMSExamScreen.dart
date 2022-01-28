import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseExamScreen extends StatefulWidget {
  @override
  _CourseExamScreenState createState() => _CourseExamScreenState();
}

class _CourseExamScreenState extends State<CourseExamScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool isPlaying = false;

  int repeatType = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: SafeArea(
              child: Scaffold(
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      padding: Spacing.top(24),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: Spacing.fromLTRB(24, 0, 24, 8),
                            padding: Spacing.all(16),
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size4!)),
                                border: Border.all(
                                    color: customAppTheme.bgLayer4, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Scores",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin: Spacing.top(8),
                                        height: MySize.size40,
                                        width: MySize.size40,
                                        decoration: BoxDecoration(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(40),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8!))),
                                        child: Center(
                                          child: Text(
                                            "10",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                color: themeData
                                                    .colorScheme.primary,
                                                fontWeight: 700),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Time",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin: Spacing.top(8),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: MySize.size40,
                                              width: MySize.size40,
                                              decoration: BoxDecoration(
                                                  color: themeData
                                                      .colorScheme.primary
                                                      .withAlpha(40),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size8!))),
                                              child: Center(
                                                child: Text(
                                                  "6",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1,
                                                      color: themeData
                                                          .colorScheme.primary,
                                                      fontWeight: 700),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: Spacing.horizontal(8),
                                              child: Text(
                                                ":",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    fontWeight: 600),
                                              ),
                                            ),
                                            Container(

                                              height: MySize.size40,
                                              width: MySize.size40,
                                              decoration: BoxDecoration(
                                                  color: themeData
                                                      .colorScheme.primary
                                                      .withAlpha(40),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size8!))),
                                              child: Center(
                                                child: Text(
                                                  "16",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1,
                                                      color: themeData
                                                          .colorScheme.primary,
                                                      fontWeight: 700),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  margin: Spacing.fromLTRB(24, 8, 24, 0),
                                  child: Row(
                                    children: <Widget>[
                                      ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8!)),
                                          child: Image(
                                            image: AssetImage(
                                                './assets/images/course/subject-6.jpg'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.28,
                                            height: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.28,
                                          )),
                                      Container(
                                        margin: Spacing.left(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Lesson 1\nOnline Exam",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600),
                                            ),
                                            Container(
                                              margin: Spacing.top(2),
                                              child: Text(
                                                "5 Question from lesson 1",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    fontWeight: 500,
                                                    muted: true),
                                              ),
                                            ),
                                            Text(
                                              "MCQs",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  muted: true),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                                  child: Column(
                                    children: <Widget>[
                                      SingleQuestion(
                                        themeType: value.themeMode(),
                                        qNumber: 1,
                                        question:
                                            "Young's modulus is the property of?",
                                        options: [
                                          "Gas only",
                                          "Both Solid and Liquid",
                                          "Solid only",
                                          "Liquid only"
                                        ],
                                      ),
                                      Container(
                                        margin: Spacing.top(16),
                                        child: SingleQuestion(
                                          themeType: value.themeMode(),
                                          qNumber: 2,
                                          question:
                                              "Movement of cell against concentration gradient is called",
                                          options: [
                                            "osmosis",
                                            "active transport",
                                            "diffusion",
                                            "passive transport"
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: Spacing.vertical(16),
                                        child: SingleQuestion(
                                          themeType: value.themeMode(),
                                          qNumber: 3,
                                          question:
                                              "Plants receive their nutrients mainly from",
                                          options: [
                                            "chlorophyll",
                                            "atmosphere",
                                            "light",
                                            "soil"
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
            ));
      },
    );
  }
}

class SingleQuestion extends StatefulWidget {
  final int? qNumber, themeType;
  final question;
  final List<String>? options;

  const SingleQuestion(
      {Key? key,
      this.qNumber,
      this.question,
      this.options,
      required this.themeType})
      : super(key: key);

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int selectedOption = -1;

  @override
  void initState() {
    super.initState();
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    Widget buildOptions() {
      List<Widget> _list = [];
      for (int i = 0; i < widget.options!.length; i++) {
        _list.add(Container(
          margin: Spacing.bottom(12),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedOption = i;
              });
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: MySize.size22,
                  height: MySize.size22,
                  decoration: BoxDecoration(
                      color: selectedOption == i
                          ? customAppTheme.colorSuccess
                          : customAppTheme.bgLayer3,
                      borderRadius: BorderRadius.all(Radius.circular(
                        MySize.size4!,
                      ))),
                  child: Center(
                    child: selectedOption == i
                        ? Icon(
                            MdiIcons.check,
                            size: MySize.size16,
                            color: customAppTheme.onSuccess,
                          )
                        : Container(),
                  ),
                ),
                Container(
                  margin: Spacing.left(16),
                  child: Text(
                    widget.options![i],
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                  ),
                )
              ],
            ),
          ),
        ));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _list,
      );
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                color: customAppTheme.bgLayer3,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
            child: Text(
              "Q." + widget.qNumber.toString(),
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.question,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(16),
                    child: Column(
                      children: <Widget>[buildOptions()],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
