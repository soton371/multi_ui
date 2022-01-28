/*
* File : Shopping Onboarding
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingLoginScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:UIKit/utils/custom/onBoarding/CustomOnBoardingWidget.dart';
import 'package:UIKit/utils/custom/onBoarding/UI/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingOnboardingScreen extends StatefulWidget {
  @override
  _ShoppingOnboardingScreenState createState() =>
      _ShoppingOnboardingScreenState();
}

class _ShoppingOnboardingScreenState extends State<ShoppingOnboardingScreen> {
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
                  height: MediaQuery.of(context).size.height,
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
                                    './assets/illustration/shopping/illu-1.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text('Find lots of product\naround the world',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 700)),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 500)),
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
                                    './assets/illustration/shopping/illu-2.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                'Secure payment\nwith SSL ',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 700),
                              ),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 500))
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40!),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/shopping/illu-3.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                'Fast delivery\nat a snap',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 700),
                              ),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 500)),
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
                                  builder: (context) => ShoppingLoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size8!),
                          child: Text("DONE".toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 700,
                                  color: themeData.colorScheme.primary)),
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
                                  builder: (context) => ShoppingLoginScreen()));
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
