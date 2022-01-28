/*
* File : Cupertino Picker
* Version : 1.0.0
* */


import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class CupertinoPickerWidget extends StatefulWidget {
  @override
  _CupertinoPickerWidgetState createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {
  late ThemeData themeData;

  int? selectedValue;


  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: CupertinoPicker(
              backgroundColor: themeData.backgroundColor,
              onSelectedItemChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemExtent: 40.0,
              children:  [
                Text('Item - 1',style: TextStyle(color: themeData.colorScheme.onBackground),),
                Text('Item - 2',style: TextStyle(color: themeData.colorScheme.onBackground)),
                Text('Item - 3',style: TextStyle(color: themeData.colorScheme.onBackground)),
                Text('Item - 4',style: TextStyle(color: themeData.colorScheme.onBackground)),
                Text('Item - 5',style: TextStyle(color: themeData.colorScheme.onBackground)),
                Text('Item - 6',style: TextStyle(color: themeData.colorScheme.onBackground)),
              ],
            ),
          );
        });
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
                title: Text("Cupertino Picker",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: Container(
                  color: themeData.backgroundColor,
                  child: Center(
                    child: CupertinoButton(
                        color: themeData.colorScheme.primary,
                        onPressed: () {
                          showPicker();
                        },
                        padding: EdgeInsets.only(
                            left: MySize.size32!,
                            top: MySize.size8!,
                            right: MySize.size32!,
                            bottom: MySize.size8!),
                        pressedOpacity: 0.5,
                        child: Text(
                          "Pick",
                          style: themeData
                              .textTheme
                              .bodyText2!
                              .merge(TextStyle(
                              color: themeData
                                  .colorScheme
                                  .onSecondary)),
                        )),
                  ))),
        );

      },
    );
  }
}
