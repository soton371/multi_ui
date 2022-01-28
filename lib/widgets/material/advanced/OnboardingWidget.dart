/*
* File : Custom Onboarding
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/custom/onBoarding/CustomOnBoardingWidget.dart';
import 'package:UIKit/utils/custom/onBoarding/UI/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() =>
      _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {

  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
              body: Container(
                  child: CustomOnBoardingWidget(
                    pages: <PageViewModel>[
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Icon(
                                    MdiIcons.shoppingSearch,
                                size: MediaQuery.of(context).size.height * 0.22,
                                color: themeData
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(200),
                              )),
                              SizedBox(height: 30.0),
                              Text('Find Lots of product\naround the world',
                                  style: themeData
                                      .textTheme
                                      .bodyText1!
                                      .merge(TextStyle(
                                          color: themeData
                                              .colorScheme
                                              .onBackground
                                              .withAlpha(200),
                                          letterSpacing: 0.2,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(height: 15.0),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style:
                                    themeData.textTheme.bodyText2!.merge(
                                          TextStyle(
                                              color: themeData
                                                  .colorScheme
                                                  .onBackground
                                                  .withAlpha(200),
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w500),
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Icon(
                                    MdiIcons.creditCardOutline,
                                size: MediaQuery.of(context).size.height * 0.22,
                                color: themeData
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(190),
                              )),
                              SizedBox(height: 30.0),
                              Text(
                                'Secure payment\nwith SSL ',
                                style: themeData
                                    .textTheme
                                    .bodyText1!
                                    .merge(TextStyle(
                                        color: themeData
                                            .colorScheme
                                            .onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w600)),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: themeData
                                      .textTheme
                                      .bodyText2!
                                      .merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme
                                                .onBackground
                                                .withAlpha(200),
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500),
                                      )),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Icon(
                                    MdiIcons.truckDelivery,
                                size: MediaQuery.of(context).size.height * 0.22,
                                color: themeData
                                    .colorScheme
                                    .onBackground
                                    .withAlpha(200),
                              )),
                              SizedBox(height: 30.0),
                              Text('Fast delivery\nat a snap',
                                  style: themeData
                                      .textTheme
                                      .bodyText1!
                                      .merge(TextStyle(
                                          color: themeData
                                              .colorScheme
                                              .onBackground
                                              .withAlpha(200),
                                          letterSpacing: 0.2,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(height: 15.0),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: themeData
                                      .textTheme
                                      .bodyText2!
                                      .merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme
                                                .onBackground
                                                .withAlpha(200),
                                            letterSpacing: 0.1,
                                            fontWeight: FontWeight.w500),
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor:
                        themeData.colorScheme.secondary,
                    selectedIndicatorColor:
                        themeData.colorScheme.primary,
                    doneWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text("DONE".toUpperCase(),style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.primary,fontWeight: FontWeight.w700,letterSpacing: 0.6))),
                        ),
                      ),
                    ),
                    skipWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text("Skip".toUpperCase(),style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.secondary,fontWeight: FontWeight.w700,letterSpacing: 0.6))),
                        ),
                      ),
                    ),
                  ))));
    });
  }
}
