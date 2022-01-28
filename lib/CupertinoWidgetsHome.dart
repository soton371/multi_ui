/*
* File : Cupertino Widget Home Page
* Version : 1.0.0
* */

import 'package:UIKit/widgets/cupertino/dialog/CupertinoActionSheetWidget.dart';
import 'package:UIKit/widgets/cupertino/dialog/CupertinoAlertDialogWidget.dart';
import 'package:UIKit/widgets/cupertino/dialog/CupertinoDialogWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoButtonWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoDatePickerWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoDateTimePickerWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoPickerWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoSliderWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoSwitchWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoTextfieldWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoTimePickerWidget.dart';
import 'package:UIKit/widgets/cupertino/form/CupertinoTimerWidget.dart';
import 'package:UIKit/widgets/cupertino/navigation/CupertinoTabWidget.dart';
import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'SingleGridItem.dart';

class CupertinoWidgetsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.25,
              crossAxisSpacing: 16.0,
              children: <Widget>[
                SingleGridItem(
                  title: "Form",
                  icon: './assets/icons/reader-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Buttons",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoButtonWidget(),
                    ),
                    SinglePageItem(
                      title: "Date Picker",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoDatePickerWidget(),
                    ),
                    SinglePageItem(
                      title: "Time Picker",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoTimePickerWidget(),
                    ),
                    SinglePageItem(
                      title: "Date \& Time",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoDateTimePickerWidget(),
                    ),
                    SinglePageItem(
                      title: "Timer",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoTimerPickerWidget(),
                    ),
                    SinglePageItem(
                      title: "Cupertino Picker",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoPickerWidget(),
                    ),
                    SinglePageItem(
                      title: "Slider",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoSliderWidget(),
                    ),
                    SinglePageItem(
                      title: "Switch",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoSwitchWidget(),
                    ),
                    SinglePageItem(
                      title: "Text Field",
                      icon: './assets/icons/reader-outline.png',
                      navigation: CupertinoTextfieldWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Dialog",
                  icon: './assets/icons/albums-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Simple",
                      icon: './assets/icons/albums-outline.png',
                      navigation: CupertinoDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Alert",
                      icon: './assets/icons/albums-outline.png',
                      navigation: CupertinoAlertDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Action Sheet",
                      icon: './assets/icons/albums-outline.png',
                      navigation: CupertinoActionSheetWidget(),
                    ),
                  ],
                ),
                SinglePageItem(
                  title: "Navigation",
                  icon: './assets/icons/browsers-outline.png',
                  navigation: CupertinoTabWidget(),
                ),
              ]),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 16),
            child: Center(
              child: Text("More widgets are coming soon...",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyText2,
                    letterSpacing: 0.5,
                    fontWeight: 500,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
