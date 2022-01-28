/*
* File : Location Permission Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class LocationPermissionDialogWidget extends StatefulWidget {
  @override
  _LocationPermissionWidgetState createState() =>
      _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState
    extends State<LocationPermissionDialogWidget> {
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => _PermissionDialog());
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
                  title: Text("Permission",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(

                        onPressed: () => _showDialog(),
                        child: Text(
                          "Give Permission",
                          style: themeData.textTheme.bodyText2!.merge(TextStyle(
                              color: themeData.colorScheme.onPrimary)),
                        )),
                  ),
                )));
      },
    );
  }
}

class _PermissionDialog extends StatefulWidget {
  @override
  _PermissionDialogState createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<_PermissionDialog> {
  bool? _check1 = false;

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    MdiIcons.mapMarkerOutline,
                    size: 28,
                    color: themeData.colorScheme.onBackground,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 500,
                            letterSpacing: 0.2),
                        children: <TextSpan>[
                          TextSpan(text: "Allow "),
                          TextSpan(
                              text: "FlutKit",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 700)),
                          TextSpan(text: " to access this device's location?"),
                        ]),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    activeColor: themeData.colorScheme.primary,
                    onChanged: (bool? value) {
                      setState(() {
                        _check1 = value;
                      });
                    },
                    value: _check1,
                  ),
                  Text(
                    "Dont's ask again",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight:500, letterSpacing: 0.2),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "DENY",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700,
                              letterSpacing: 0.4),
                        )),
                    FxButton(
                      backgroundColor: themeData.colorScheme.primary.withAlpha(40),
                        borderRadiusAll: 4,

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ALLOW",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight:700,
                              letterSpacing: 0.4,
                              color: themeData.colorScheme.primary),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
