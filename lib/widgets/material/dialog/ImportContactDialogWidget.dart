/*
* File : Import Comment Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ImportContactDialogWidget extends StatefulWidget {
  @override
  _ImportContactWidgetState createState() => _ImportContactWidgetState();
}

class _ImportContactWidgetState extends State<ImportContactDialogWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ImportDialog());
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
                  title: Text("Import Contact",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    _showDialog();
                  },
                  child: Icon(
                    MdiIcons.downloadBoxOutline,
                    size: 28,
                  ),
                  elevation: 2,
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Tap on ",
                            style: themeData.textTheme.subtitle2!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0.2)),
                          ),
                          Icon(MdiIcons.downloadBoxOutline,
                              size: 18,
                              color: themeData.colorScheme.onBackground),
                          Text(
                            " to import contact",
                            style: themeData.textTheme.subtitle2!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0.2)),
                          ),
                        ],
                      ),
                    ))));
      },
    );
  }
}

class _ImportDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
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
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Import contacts",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 700,
                          letterSpacing: 0)),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                        "To import contacts, select a CSV or vCard file",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: ElevatedButton(

                        onPressed: () {},
                        child: Text("Select File",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onSecondary,
                                fontWeight: 600,
                                letterSpacing: 0.2))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "No file? ",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 500,
                              letterSpacing: 0)),
                      TextSpan(
                          text: "Choose account",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600,
                              color: themeData.colorScheme.primary,
                              letterSpacing: 0)),
                      TextSpan(
                          text: " instead",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 500,
                              letterSpacing: 0)),
                    ])),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 16, bottom: 12),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600),
                        )),
                    TextButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Import",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
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
