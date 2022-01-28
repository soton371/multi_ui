/*
* File : Time Picker
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late TimeOfDay selectedTime;
  late ThemeData themeData;

  _pickTime12(BuildContext context) async {
    TimeOfDay? t =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (t != null)
      setState(() {
        selectedTime = t;
        showSnackbarWithFloating(t.format(context));
      });
  }

  _pickTime24(BuildContext context) async {
    TimeOfDay? t = await showTimePicker(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
        context: context,
        initialTime: selectedTime);
    if (t != null)
      setState(() {
        selectedTime = t;
        String time = "";
        if (t.hour < 10) {
          time = time + "0" + t.hour.toString();
        } else {
          time = time + t.hour.toString();
        }
        time = time + " : ";
        if (t.minute < 10) {
          time = time + "0" + t.minute.toString();
        } else {
          time = time + t.minute.toString();
        }
        showSnackbarWithFloating(time);
      });
  }

  @override
  void initState() {
    super.initState();
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
                  title: Text("Time Picker",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3),
                                ),
                              ],
                            ),
                            child: ElevatedButton(

                              onPressed: () {
                                _pickTime12(context);
                              },

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.clockOutline,
                                    color: themeData.colorScheme.onPrimary,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("12 HOUR",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight:600,
                                            letterSpacing: 0.4,
                                            color: themeData
                                                .colorScheme.onPrimary)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3),
                                ),
                              ],
                            ),
                            child: ElevatedButton(

                              onPressed: () {
                                _pickTime24(context);
                              },

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.clockOutline,
                                    color: themeData.colorScheme.onPrimary,
                                    size: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("24 HOUR",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            letterSpacing: 0.4,
                                            color: themeData
                                                .colorScheme.onPrimary)),
                                  ),
                                ],
                              ),
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
