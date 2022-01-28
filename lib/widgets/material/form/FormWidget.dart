/*
* File : Forms
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  bool _passwordVisible = false;
  late ThemeData themeData;

  late TimeOfDay selectedTime;
  DateTime? selectedDate;

  double _sliderValue1 = 30;
  double _sliderValue2 = 60;
  double _starValue = 10;
  double _endValue = 80;

  bool? _switch = true, _check1 = true, _check2 = false, _check3 = true;
  int? _radioValue = 1;

  _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        showSnackbarWithFloating(picked.day.toString() +
            " - " +
            picked.month.toString() +
            " - " +
            picked.year.toString());
      });
  }

  _pickTime(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null)
      setState(() {
        selectedTime = t;
        showSnackbarWithFloating(t.format(context));
      });
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Form",
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
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 8),
                            child: Text("Text Fields",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight:600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  controller: TextEditingController(
                                      text: "Natalia Dyer"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    controller: TextEditingController(
                                        text: "nat@mail.com"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Phone",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.phone),
                                    ),
                                    controller: TextEditingController(
                                        text: "091-987456321"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _passwordVisible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 8),
                            child: Text("Date & Time Picker",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(24),
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1),
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(

                                        onPressed: () {
                                          _pickTime(context);
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.clockOutline,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text("Select Time",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      fontWeight:600,
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary,
                                                      letterSpacing: 0.3)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeData.colorScheme.primary
                                                .withAlpha(24),
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1),
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(

                                        onPressed: () {
                                          _pickDate(context);
                                        },

                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              MdiIcons.calendarOutline,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text("Select Date",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      fontWeight:600,
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary,
                                                      letterSpacing: 0.3)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 8),
                            child: Text("Sliders",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                            child: Slider(
                              value: _sliderValue1,
                              onChanged: (value) {
                                setState(() {
                                  _sliderValue1 = value;
                                });
                              },
                              min: 0,
                              max: 100,
                            ),
                          ),
                          Container(
                            child: Slider(
                              value: _sliderValue2,
                              min: 0,
                              max: 100,
                              divisions: 100,
                              label: _sliderValue2.floor().toString(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    _sliderValue2 = value;
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            child: RangeSlider(
                              values: RangeValues(_starValue, _endValue),
                              min: 0.0,
                              max: 100.0,
                              onChanged: (values) {
                                setState(() {
                                  _starValue = values.start.roundToDouble();
                                  _endValue = values.end.roundToDouble();
                                });
                              },
                              activeColor:
                                  themeData.sliderTheme.activeTrackColor,
                              inactiveColor:
                                  themeData.sliderTheme.inactiveTrackColor,
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Switch",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight:600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Switch(
                                onChanged: (bool value) {
                                  setState(() {
                                    _switch = value;
                                  });
                                },
                                value: _switch!,
                                activeColor: themeData.colorScheme.primary,
                              )),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Checkboxes",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor:
                                          themeData.colorScheme.primary,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _check1 = value;
                                        });
                                      },
                                      value: _check1,
                                    ),
                                    Text(
                                      "Check 1",
                                      style: themeData.textTheme.subtitle2!
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _check2,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _check2 = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Check 2",
                                      style: themeData.textTheme.subtitle2!
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _check3,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _check3 = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Check 3",
                                      style: themeData.textTheme.subtitle2!
                                          .merge(TextStyle(
                                              color: themeData
                                                  .colorScheme.onBackground)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 0),
                            child: Text("Radio Buttons",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0.2)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Radio 1",
                                    style: themeData.textTheme.bodyText1!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.2)),
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  leading: Radio(
                                    value: 1,
                                    activeColor: themeData.colorScheme.primary,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Radio 2",
                                    style: themeData.textTheme.bodyText1!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.2)),
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  leading: Radio(
                                    value: 2,
                                    activeColor: themeData.colorScheme.primary,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Radio 3",
                                    style: themeData.textTheme.bodyText1!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.2)),
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  dense: true,
                                  leading: Radio(
                                    value: 3,
                                    activeColor: themeData.colorScheme.primary,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _radioValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
