/*
* File : LMS Dashboard
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LMSDashboardScreen extends StatefulWidget {
  @override
  _LMSDashboardScreenState createState() => _LMSDashboardScreenState();
}

class _LMSDashboardScreenState extends State<LMSDashboardScreen> {
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
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                    ),
                  ),
                  title: Text("LMS",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                top: MySize.size16!,
                                left: MySize.size16!,
                                right: MySize.size16!),
                            child: Text(
                              "PROGRESS",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  letterSpacing: 0.3),
                            )),
                        Container(
                          child: GridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 2,
                              padding: EdgeInsets.only(
                                  left: MySize.size16!,
                                  right: MySize.size16!,
                                  top: MySize.size16!),
                              mainAxisSpacing: MySize.size16!,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: MySize.size16!,
                              children: <Widget>[
                                _SingleSubject(
                                  completed: 58,
                                  subject: 'ALL',
                                  backgroundColor: Colors.blue,
                                ),
                                _SingleSubject(
                                  completed: 45,
                                  subject: 'Mathematics',
                                  backgroundColor: Colors.red,
                                ),
                                _SingleSubject(
                                  completed: 68,
                                  subject: 'Science',
                                  backgroundColor: Colors.green,
                                ),
                                _SingleSubject(
                                  completed: 32,
                                  subject: 'Other',
                                  backgroundColor: Colors.orange,
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MySize.size16!,
                              left: MySize.size16!,
                              right: MySize.size16!),
                          child: Text(
                            "SUBMISSIONS",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 600,
                                letterSpacing: 0.3),
                          ),
                        ),
                        Container(
                          child: _SubmissionWidget(),
                        )
                      ],
                    ))));
      },
    );
  }
}

class _SingleSubject extends StatelessWidget {
  final Color backgroundColor;
  final String subject;
  final int completed;

  const _SingleSubject(
      {Key? key,
      required this.backgroundColor,
      required this.subject,
      required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size8!),
      ),
      child: Container(
        color: backgroundColor,
        height: 125,
        child: Container(
          padding: EdgeInsets.only(bottom: MySize.size16!, left: MySize.size16!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subject,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 600, color: Colors.white)),
              Text(completed.floor().toString() + "% Completed",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontWeight: 500, color: Colors.white, letterSpacing: 0)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmissionWidget extends StatefulWidget {
  @override
  _SubmissionWidgetState createState() => _SubmissionWidgetState();
}

class _SubmissionWidgetState extends State<_SubmissionWidget> {

  int _currentStep = 0;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Stepper(
      physics: ClampingScrollPhysics(),
      // controlsBuilder: (BuildContext context,
      //     {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
      //   return _buildControlBuilder(_currentStep);
      // },
      currentStep: _currentStep,
      onStepTapped: (pos) {
        setState(() {
          _currentStep = pos;
        });
      },
      steps: <Step>[
        Step(
          isActive: true,
          title: Text(
            'Due - 30, Apr',
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                fontWeight: 600),
          ),
          subtitle: Text('Science (figure 2.3)',
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 500)),
          state: StepState.indexed,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                style: themeData.textTheme.caption!.merge(
                    TextStyle(color: themeData.colorScheme.onBackground))),
          ),
        ),
        Step(
          isActive: true,
          state: StepState.indexed,
          title: Text(
            'Due - 28, Apr',
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                fontWeight: 600),
          ),
          subtitle: Text('Mathematics (lesson -2)',
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 400)),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                style: themeData.textTheme.caption!.merge(
                    TextStyle(color: themeData.colorScheme.onBackground))),
          ),
        ),
        Step(
            isActive: true,
            state: StepState.complete,
            title: Text(
              'Completed - 14, Apr',
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  fontWeight: 600),
            ),
            subtitle: Text('Science (figure 2.2)',
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 400)),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                  style: themeData.textTheme.caption!.merge(
                      TextStyle(color: themeData.colorScheme.onBackground))),
            )),
        Step(
          isActive: true,
          state: StepState.complete,
          title: Text(
            'Completed - 16, Apr',
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                fontWeight: 600),
          ),
          subtitle: Text('Mathematics (lesson - 1)',
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 400)),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                  " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                  style: themeData.textTheme.caption!.merge(
                      TextStyle(color: themeData.colorScheme.onBackground))),
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildControlBuilder(int position) {
    if (position == 0 || position == 1) {
      return Container(
        margin: EdgeInsets.only(top: MySize.size8!),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              boxShadow: [
                BoxShadow(
                  color: themeData.colorScheme.primary.withAlpha(18),
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                ),
                onPressed: () {  },
                child: Text("Submit".toUpperCase(),
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onSecondary,
                        letterSpacing: 0.3,
                        fontWeight: 600))),
          ),
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            boxShadow: [
              BoxShadow(
                color: themeData.colorScheme.secondary.withAlpha(18),
                blurRadius: 3,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ElevatedButton(

              onPressed: () {},
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(Spacing.xy(16, 0))
              ),              child: Text("Submitted".toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.onSecondary,
                      letterSpacing: 0.3,
                      fontWeight: 600))),
        ),
      ),
    );
  }
}
