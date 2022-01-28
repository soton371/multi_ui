import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/quiz/QuizQuestionType1Screen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class QuizCustomizeScreen extends StatefulWidget {
  @override
  _QuizCustomizeScreenState createState() => _QuizCustomizeScreenState();
}

class _QuizCustomizeScreenState extends State<QuizCustomizeScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<int?> _selected;

  @override
  void initState() {
    super.initState();
    _selected = [];
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
                  padding: Spacing.fromLTRB(16, 40, 16, 0),
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
                        child: Center(
                          child: Text(
                            "Customize",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Spacing.top(48),
                  child: Text(
                    "Customize your exam",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                Container(
                  child: Text(
                    "You can select multiple subjects",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 500),
                  ),
                ),
                Container(
                    margin: Spacing.fromLTRB(24, 48, 24, 0),
                    child: GridView.count(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 3.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: MySize.size24!,
                      mainAxisSpacing: MySize.size24!,
                      children: <Widget>[
                        subject(subject: "Physics", index: 0),
                        subject(subject: "Chemistry", index: 1),
                        subject(subject: "Mathematics", index: 2),
                        subject(subject: "Coding", index: 3),
                        subject(subject: "AP Test", index: 4),
                        subject(subject: "NSE", index: 5),
                        subject(subject: "English", index: 6),
                        subject(subject: "Art", index: 7),
                        subject(subject: "History", index: 8),
                        subject(subject: "Music", index: 9),
                      ],
                    )),
                Container(
                  margin: Spacing.fromLTRB(48, 48, 48, 0),
                  width: MySize.safeWidth,
                  child: ElevatedButton(

                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                QuizQuestionType1Screen()));
                      },
                      child: Text(
                        _selected.isEmpty
                            ? "Select at least one subject"
                            : "NEXT",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            letterSpacing: 0.3,
                            color: _selected.isEmpty
                                ? customAppTheme.onDisabled
                                : themeData.colorScheme.onPrimary),
                      )),
                )
              ],
            )));
      },
    );
  }

  Widget subject({required String subject, int? index}) {
    return InkWell(
      onTap: () {
        if (_selected.contains(index)) {
          setState(() {
            _selected.remove(index);
          });
        } else {
          setState(() {
            _selected.add(index);
          });
        }
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
            border: Border.all(
                color: _selected.contains(index)
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground,
                width: 0.8)),
        child: Stack(
          children: <Widget>[
            Center(
                child: Text(
              subject,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  color: _selected.contains(index)
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.onBackground,
                  fontWeight: _selected.contains(index) ? 600 : 500),
            )),
            _selected.contains(index)
                ? Positioned(
                    right: -1,
                    top: -1,
                    child: Container(
                      padding: Spacing.all(2),
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(MySize.size8!))),
                      child: Icon(
                        MdiIcons.check,
                        color: themeData.colorScheme.onPrimary,
                        size: MySize.size16,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
