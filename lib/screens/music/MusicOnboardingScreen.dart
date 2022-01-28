/*
* File : Music Onboarding
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/music/MusicLoginScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:UIKit/utils/custom/onBoarding/CustomOnBoardingWidget.dart';
import 'package:UIKit/utils/custom/onBoarding/UI/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class MusicOnboardingScreen extends StatefulWidget {
  @override
  _MusicOnboardingScreenState createState() => _MusicOnboardingScreenState();
}

class _MusicOnboardingScreenState extends State<MusicOnboardingScreen> {
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
                  height: double.infinity,
                  color: themeData.backgroundColor,
                  child: CustomOnBoardingWidget(
                    pages: <PageViewModel>[
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40!),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/music/illu-1.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text('Play lots of songs\naround the world',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight:600)),
                              SizedBox(height: MySize.size16),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: themeData.textTheme.bodyText2!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.onBackground
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
                          padding: EdgeInsets.all(MySize.size40!),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/music/illu-2.png'),
                                width:MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                'Play songs\nwith beautiful player',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600),
                              ),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: themeData.textTheme.bodyText2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor: themeData.colorScheme.secondary,
                    selectedIndicatorColor: themeData.colorScheme.primary,
                    doneWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicLoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size8!),
                          child: Text("DONE".toUpperCase(),
                              style: themeData.textTheme.subtitle2!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.primary,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.6))),
                        ),
                      ),
                    ),
                    skipWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicLoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size8!),
                          child: Text("Skip".toUpperCase(),
                              style: themeData.textTheme.subtitle2!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.secondary,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.6))),
                        ),
                      ),
                    ),
                  ))));
    });
  }
}
