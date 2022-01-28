/*
* File : Timeline Stepper
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class TimelineStepperWidget extends StatefulWidget {
  @override
  _TimelineStepperWidgetState createState() => _TimelineStepperWidgetState();
}

class _TimelineStepperWidgetState extends State<TimelineStepperWidget> {
  late ThemeData themeData;
  int _currentStep = 3;

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
                  title: Text("Timeline Stepper",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Text('data'),
                        // child: Stepper(
                        //   controlsBuilder: (BuildContext context,
                        //       {VoidCallback? onStepContinue,
                        //       VoidCallback? onStepCancel}) {
                        //     return Container(
                        //       margin: EdgeInsets.only(top: 8),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: <Widget>[
                        //           Container(
                        //             decoration: BoxDecoration(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(8)),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                   color: themeData.colorScheme.primary
                        //                       .withAlpha(24),
                        //                   blurRadius: 3,
                        //                   offset: Offset(0, 2),
                        //                 ),
                        //               ],
                        //             ),
                        //             child: ElevatedButton(
                        //
                        //                 onPressed: () {},
                        //                 style: ButtonStyle(
                        //                     padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                        //                 ),
                        //                 child: Text("Contact".toUpperCase(),
                        //                     style: AppTheme.getTextStyle(
                        //                         themeData.textTheme.caption,
                        //                         fontWeight: 600,
                        //                         letterSpacing: 0.4,
                        //                         color: themeData
                        //                             .colorScheme.onPrimary))),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   currentStep: _currentStep,
                        //   onStepContinue: () {
                        //     if (_currentStep >= 4) return;
                        //     setState(() {
                        //       _currentStep += 1;
                        //     });
                        //   },
                        //   onStepCancel: () {
                        //     if (_currentStep <= 0) return;
                        //     setState(() {
                        //       _currentStep -= 1;
                        //     });
                        //   },
                        //   onStepTapped: (pos) {
                        //     setState(() {
                        //       _currentStep = pos;
                        //     });
                        //   },
                        //   steps: <Step>[
                        //     Step(
                        //         isActive: true,
                        //         state: StepState.complete,
                        //         title: Text(
                        //           'Completed - 14, Apr',
                        //           style: AppTheme.getTextStyle(
                        //               themeData.textTheme.bodyText1,
                        //               fontWeight: 600),
                        //         ),
                        //         content: Container(
                        //           width: MediaQuery.of(context).size.width,
                        //           child: Column(
                        //             children: <Widget>[
                        //               Row(
                        //                 children: <Widget>[
                        //                   Container(
                        //                     width: 44,
                        //                     height: 44,
                        //                     decoration: BoxDecoration(
                        //                       shape: BoxShape.circle,
                        //                       image: new DecorationImage(
                        //                           image: AssetImage(
                        //                               "./assets/images/avatar-2.jpg"),
                        //                           fit: BoxFit.fill),
                        //                     ),
                        //                   ),
                        //                   Container(
                        //                     margin: EdgeInsets.only(left: 8),
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: <Widget>[
                        //                         Text("Assigned to",
                        //                             style:
                        //                                 AppTheme.getTextStyle(
                        //                                     themeData.textTheme
                        //                                         .caption,
                        //                                     fontWeight: 500)),
                        //                         Text("Mark Laurren",
                        //                             style:
                        //                                 AppTheme.getTextStyle(
                        //                                     themeData.textTheme
                        //                                         .bodyText1,
                        //                                     fontWeight: 600)),
                        //                       ],
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //               Container(
                        //                 margin: EdgeInsets.only(top: 8),
                        //                 child: Text(
                        //                     " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        //                     style: themeData.textTheme.caption!
                        //                         .merge(TextStyle(
                        //                             color: themeData.colorScheme
                        //                                 .onBackground))),
                        //               )
                        //             ],
                        //           ),
                        //         )),
                        //     Step(
                        //       isActive: true,
                        //       state: StepState.complete,
                        //       title: Text(
                        //         'Completed - 16, Apr',
                        //         style: AppTheme.getTextStyle(
                        //             themeData.textTheme.bodyText1,
                        //             fontWeight: 600),
                        //       ),
                        //       content: Container(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Column(
                        //           children: <Widget>[
                        //             Row(
                        //               children: <Widget>[
                        //                 Container(
                        //                   width: 44,
                        //                   height: 44,
                        //                   decoration: BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     image: new DecorationImage(
                        //                         image: AssetImage(
                        //                             "./assets/images/avatar.jpg"),
                        //                         fit: BoxFit.fill),
                        //                   ),
                        //                 ),
                        //                 Container(
                        //                   margin: EdgeInsets.only(left: 8),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: <Widget>[
                        //                       Text("Assigned to",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.caption,
                        //                               fontWeight: 500)),
                        //                       Text("Robert Downey",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.bodyText1,
                        //                               fontWeight: 600)),
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.only(top: 8),
                        //               child: Text(
                        //                   " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        //                   style: themeData.textTheme.caption!
                        //                       .merge(TextStyle(
                        //                           color: themeData.colorScheme
                        //                               .onBackground))),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Step(
                        //       state: StepState.disabled,
                        //       title: Text(
                        //         "Task Removed",
                        //         style: AppTheme.getTextStyle(
                        //             themeData.textTheme.bodyText1,
                        //             fontWeight: 500),
                        //       ),
                        //       content: Container(),
                        //     ),
                        //     Step(
                        //       isActive: true,
                        //       title: Text(
                        //         'Working (due date - 24 Apr)',
                        //         style: AppTheme.getTextStyle(
                        //             themeData.textTheme.bodyText1,
                        //             fontWeight: 600),
                        //       ),
                        //       state: StepState.editing,
                        //       content: Container(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Column(
                        //           children: <Widget>[
                        //             Row(
                        //               children: <Widget>[
                        //                 Container(
                        //                   width: 44,
                        //                   height: 44,
                        //                   decoration: BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     image: new DecorationImage(
                        //                         image: AssetImage(
                        //                             "./assets/images/avatar-2.jpg"),
                        //                         fit: BoxFit.fill),
                        //                   ),
                        //                 ),
                        //                 Container(
                        //                   margin: EdgeInsets.only(left: 8),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: <Widget>[
                        //                       Text("Assigned to",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.caption,
                        //                               fontWeight: 500)),
                        //                       Text("Mark Laurren",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.bodyText1,
                        //                               fontWeight: 600)),
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Container(
                        //               margin: EdgeInsets.only(top: 8),
                        //               child: Text(
                        //                   " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        //                   style: themeData.textTheme.caption!
                        //                       .merge(TextStyle(
                        //                           color: themeData.colorScheme
                        //                               .onBackground))),
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     Step(
                        //       isActive: true,
                        //       state: StepState.indexed,
                        //       title: Text(
                        //         'Upcoming Task',
                        //         style: AppTheme.getTextStyle(
                        //             themeData.textTheme.bodyText1,
                        //             fontWeight: 600),
                        //       ),
                        //       content: Container(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Column(
                        //           children: <Widget>[
                        //             Row(
                        //               children: <Widget>[
                        //                 Container(
                        //                   width: 44,
                        //                   height: 44,
                        //                   decoration: BoxDecoration(
                        //                     shape: BoxShape.circle,
                        //                     image: new DecorationImage(
                        //                         image: AssetImage(
                        //                             "./assets/images/avatar-1.jpg"),
                        //                         fit: BoxFit.fill),
                        //                   ),
                        //                 ),
                        //                 Container(
                        //                   margin: EdgeInsets.only(left: 8),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: <Widget>[
                        //                       Text("Assign to",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.caption,
                        //                               fontWeight: 500)),
                        //                       Text("Nat Bentlee",
                        //                           style: AppTheme.getTextStyle(
                        //                               themeData
                        //                                   .textTheme.bodyText1,
                        //                               fontWeight: 600)),
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             Container(
                        //                 margin: EdgeInsets.only(top: 8),
                        //                 child: Text(
                        //                     " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                        //                     style: AppTheme.getTextStyle(
                        //                         themeData.textTheme.caption,
                        //                         fontWeight: 500)))
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ))));
      },
    );
  }
}
