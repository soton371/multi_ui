/*
* File : Full Screen Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FullScreenDialogWidget extends StatefulWidget {
  @override
  _FullScreenDialogWidgetState createState() => _FullScreenDialogWidgetState();
}

class _FullScreenDialogWidgetState extends State<FullScreenDialogWidget> {
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
                  title: Text("Full Screen",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return FullDialog();
                        },
                        fullscreenDialog: true));
                  },
                  child: Icon(Icons.add),
                  elevation: 2,
                ),
                body: Center(
                  child: Text(
                    "Tap on + to add new task",
                    style: themeData.textTheme.subtitle1!.merge(
                        TextStyle(
                            color: themeData
                                .colorScheme
                                .onBackground)),
                  ),
                )));
      },
    );
  }
}

class FullDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Scaffold(

      appBar: new AppBar(
        title: Text('Add Task',style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight: 600)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.check))),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Task",
                hintText: "Type a task",
                border: themeData.inputDecorationTheme.border,
                enabledBorder: themeData.inputDecorationTheme.border,
                focusedBorder:
                    themeData.inputDecorationTheme.focusedBorder,
                prefixIcon: Icon(MdiIcons.notePlusOutline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
