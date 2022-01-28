/*
* File : Forms Home Page
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/widgets/material/form/AddressFormWidget.dart';
import 'package:UIKit/widgets/material/form/CheckboxWidget.dart';
import 'package:UIKit/widgets/material/form/DatePickerWidget.dart';
import 'package:UIKit/widgets/material/form/FeedbackFormWidget.dart';
import 'package:UIKit/widgets/material/form/FormWidget.dart';
import 'package:UIKit/widgets/material/form/PersonalInformationFormWidget.dart';
import 'package:UIKit/widgets/material/form/RadioWidget.dart';
import 'package:UIKit/widgets/material/form/SliderWidget.dart';
import 'package:UIKit/widgets/material/form/SwitchWidget.dart';
import 'package:UIKit/widgets/material/form/TextFieldWidget.dart';
import 'package:UIKit/widgets/material/form/TimePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/text/text.dart';

import '../../SingleGridItem.dart';

class FormsHomePage extends StatefulWidget {
  @override
  _FormsHomePageState createState() => _FormsHomePageState();
}

class _FormsHomePageState extends State<FormsHomePage> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: themeData.appBarTheme.color,
          title:
              FxText("Forms")),
      body: Container(
        color: themeData.colorScheme.background,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Inputs",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    fontWeight: 700),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 16, left: 12, right: 12, bottom: 16),
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16.0,
              children: <Widget>[
                SinglePageItem(
                  title: "Text Fields",
                  icon: './assets/icons/reader-outline.png',
                  navigation: TextFieldWidget(),
                ),
                SinglePageItem(
                  title: "Checkbox",
                  icon: './assets/icons/reader-outline.png',
                  navigation: CheckboxWidget(),
                ),
                SinglePageItem(
                  title: "Radio Button",
                  icon: './assets/icons/reader-outline.png',
                  navigation: RadioWidget(),
                ),
                SinglePageItem(
                  icon: './assets/icons/reader-outline.png',
                  title: "Switch",
                  navigation: SwitchWidget(),
                ),
                SinglePageItem(
                  title: "Date Picker",
                  icon: './assets/icons/reader-outline.png',
                  navigation: DatePickerWidget(),
                ),
                SinglePageItem(
                  icon: './assets/icons/reader-outline.png',
                  title: "Time Picker",
                  navigation: TimePickerWidget(),
                ),
                SinglePageItem(
                  title: "Range Slider",
                  icon: './assets/icons/reader-outline.png',
                  navigation: SliderWidget(),
                ),
                SinglePageItem(
                  title: "Form",
                  icon: './assets/icons/reader-outline.png',
                  navigation: FormWidget(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Text(
                "Customs",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    fontWeight: 700),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 16, left: 12, right: 12, bottom: 16),
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16.0,
              children: <Widget>[
                SinglePageItem(
                  title: "Personal",
                  icon: './assets/icons/reader-outline.png',
                  navigation: PersonalInformationFormWidget(),
                ),
                SinglePageItem(
                  title: "Address",
                  icon: './assets/icons/reader-outline.png',
                  navigation: AddressFormWidget(),
                ),
                SinglePageItem(
                  title: "Feedback",
                  icon: './assets/icons/reader-outline.png',
                  navigation: FeedbackFormWidget(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
