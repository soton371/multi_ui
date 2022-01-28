/*
* File : Simple Stepper
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';

class SimpleStepperWidget extends StatefulWidget {
  @override
  _SimpleStepperWidgetState createState() => _SimpleStepperWidgetState();
}

class _SimpleStepperWidgetState extends State<SimpleStepperWidget> {
  late ThemeData themeData;

  int _currentStep = 2;

  @override
  void initState() {
    super.initState();
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
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Stepper",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Stepper(
                          currentStep: _currentStep,
                          onStepContinue: () {
                            if (_currentStep >= 4) return;
                            setState(() {
                              _currentStep += 1;
                            });
                          },
                          onStepCancel: () {
                            if (_currentStep <= 0) return;
                            setState(() {
                              _currentStep -= 1;
                            });
                          },
                          onStepTapped: (pos) {
                            setState(() {
                              _currentStep = pos;
                            });
                          },
                          steps: <Step>[
                            Step(
                              isActive: true,
                              state: StepState.complete,
                              title: Text(
                                'Step 1',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600),
                              ),
                              content: SizedBox(
                                  height: 60.0,
                                  child: Text("Completed (content is here)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500))),
                            ),
                            Step(
                              isActive: true,
                              state: StepState.complete,
                              title: Text(
                                'Step 2',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600),
                              ),
                              content: SizedBox(
                                  height: 60.0,
                                  child: Text("Completed (content is here)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500))),
                            ),
                            Step(
                              isActive: true,
                              state: StepState.editing,
                              title: Text(
                                'Step 3',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600),
                              ),
                              content: SizedBox(
                                  height: 60.0,
                                  child: Text("Editing (content is here)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500))),
                            ),
                            Step(
                              isActive: true,
                              title: Text(
                                'Step 4',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600),
                              ),
                              content: SizedBox(
                                  height: 60.0,
                                  child: Text("Uncompleted (content is here)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500))),
                            ),
                            Step(
                              state: StepState.disabled,
                              title: Text(
                                'Step 5',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600),
                              ),
                              content: SizedBox(
                                  height: 60.0,
                                  child: Text("Disabled (content is here)",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500))),
                            ),
                          ],
                        ),
                      ),
                    ))));
      },
    );
  }
}
