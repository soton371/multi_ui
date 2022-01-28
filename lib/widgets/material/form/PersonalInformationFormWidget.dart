/*
* File : Personal Information Form
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class PersonalInformationFormWidget extends StatefulWidget {
  @override
  _PersonalInformationFormWidgetState createState() =>
      _PersonalInformationFormWidgetState();
}

class _PersonalInformationFormWidgetState
    extends State<PersonalInformationFormWidget> {
  int? _radioValue = 1;

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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Personal Information",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 16, top: 0, bottom: 12),
                                  child: Text("Personal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600)),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon:
                                        Icon(MdiIcons.accountOutline, size: 24),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Last Name",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(MdiIcons.accountOutline,
                                          size: 24),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "DOB",
                                      hintText: "DD/MM/YYYY",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                        MdiIcons.calendarBlankOutline,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text("Gender",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              fontWeight: 600)),
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Radio(
                                          value: 1,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          groupValue: _radioValue,
                                          onChanged: (int? value) {
                                            setState(() {
                                              _radioValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Text("Male",
                                          style: themeData.textTheme.subtitle2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground
                                                      .withAlpha(240),
                                                  letterSpacing: 0.2,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Radio(
                                          value: 2,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          groupValue: _radioValue,
                                          onChanged: (int? value) {
                                            setState(() {
                                              _radioValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Text("Female",
                                          style: themeData.textTheme.subtitle2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground
                                                      .withAlpha(240),
                                                  letterSpacing: 0.2,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text("Contact",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email Address",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                        MdiIcons.emailOutline,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Contact",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                        MdiIcons.phoneOutline,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text("Other Information",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Nick Name",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                          MdiIcons.accountChildOutline,
                                          size: 24),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Interest",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(
                                          MdiIcons.gamepadCircleOutline,
                                          size: 24),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 16),
                                  alignment: Alignment.center,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData.colorScheme.primary
                                              .withAlpha(28),
                                          blurRadius: 4,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(

                                        onPressed: () {},

                                        child: Text("SAVE",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 700,
                                                letterSpacing: 0.2,
                                                color: themeData
                                                    .colorScheme.onPrimary))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }
}
