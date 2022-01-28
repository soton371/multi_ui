/*
* File : Company Profile
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class CompanyProfileScreen extends StatefulWidget {
  @override
  _CompanyProfileScreenState createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  late ThemeData themeData;

  List<String> _skillList = [
    "Photoshop",
    "Adobe XD",
    "Dart",
    "Flutter",
    "Java",
    "OOP",
  ];

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: FxSpacing.top(32),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          MdiIcons.chevronLeft,
                          color: themeData.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Container(
                        width: MySize.size100,
                        height: MySize.size100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('./assets/images/avatar-2.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Martyn Rankin",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 600),
                              ),
                              Text(
                                "UX Designer",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                              ),
                              onPressed: () {},
                              child: Text(
                                "Follow",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    letterSpacing: 0.3,
                                    color: themeData.colorScheme.onPrimary),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Container(
                        padding: EdgeInsets.all(MySize.size16!),
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size4!)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 7.0,
                                  color: themeData.cardTheme.shadowColor!
                                      .withOpacity(0.10)),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "210+",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text("Project",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 600,
                                          letterSpacing: 0)),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "486",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                    "Followers",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "58",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                    "Following",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Text(
                        "Skill",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Wrap(
                        children: _buildChoiceList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
                      child: Text("Project",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                    ),
                    Container(
                      padding: EdgeInsets.only(),
                      child: ProjectsWidget(),
                    )
                  ],
                )));
      },
    );
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    _skillList.forEach((item) {
      choices.add(Container(
        padding:  EdgeInsets.only(left: MySize.size2, right: MySize.size2, top: MySize.size4!, bottom: MySize.size4!),
        child: Chip(
          backgroundColor: themeData.colorScheme.background,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Text(
            item,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2),
          ),
        ),
      ));
    });
    return choices;
  }
}

class ProjectsWidget extends StatefulWidget {
  @override
  _ProjectsWidgetState createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  int _currentStep = 1;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Stepper(
      physics: ClampingScrollPhysics(),
      // controlsBuilder: (BuildContext context,
      //     {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
      //   return SizedBox.shrink();
      // },
      currentStep: _currentStep,
      onStepTapped: (pos) {
        setState(() {
          _currentStep = pos;
        });
      },
      steps: <Step>[
        Step(
            state: StepState.indexed,
            title: Text(
              'Upcoming',
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  fontWeight: 700),
            ),
            subtitle: Text(
              'Start at 20, dec',
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600, letterSpacing: 0),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 500, letterSpacing: 0),
              ),
            )),
        Step(
          isActive: true,
          title: Text(
            'Flutter UIKit',
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                fontWeight: 700),
          ),
          subtitle: Text(
            'Complete at 18, jan',
            style: AppTheme.getTextStyle(themeData.textTheme.caption,
                fontWeight: 600, letterSpacing: 0),
          ),
          state: StepState.editing,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 500, letterSpacing: 0),
            ),
          ),
        ),
        Step(
          isActive: true,
          state: StepState.complete,
          title: Text(
            'Finished',
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                fontWeight: 700),
          ),
          subtitle: Text(
            'Project no. 2',
            style: AppTheme.getTextStyle(themeData.textTheme.caption,
                fontWeight: 600, letterSpacing: 0),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 500, letterSpacing: 0),
            ),
          ),
        ),
      ],
    );
  }
}
