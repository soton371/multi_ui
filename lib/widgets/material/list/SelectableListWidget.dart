/*
* File : Selectable List
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SelectableListWidget extends StatefulWidget {
  @override
  _SelectableListWidgetState createState() => _SelectableListWidgetState();
}

class _SelectableListWidgetState extends State<SelectableListWidget> {
  List<int> _list = List.generate(20, (i) => i);
  List<bool> _selected = List.generate(20, (i) => false);
  late ThemeData themeData;
  bool _isSelectable = false;

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
                  title: Text("Selectable List",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  child: ListView.separated(
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return Ink(
                          color: _selected[index]
                              ? themeData.colorScheme.primary
                              : themeData.backgroundColor,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _selected[index]
                                  ? themeData.colorScheme.secondary
                                  : themeData.colorScheme.secondary
                                      .withAlpha(240),
                              child: _selected[index]
                                  ? Icon(
                                      Icons.done,
                                      color: themeData.colorScheme.onSecondary,
                                    )
                                  : Text(
                                      _list[index].toString(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight:600,
                                          color: _selected[index]
                                              ? themeData.colorScheme.onPrimary
                                              : themeData
                                                  .colorScheme.onSecondary),
                                    ),
                            ),
                            subtitle: Text('Sub Item',
                                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,fontWeight: 500,color: _selected[index]
                                    ? themeData.colorScheme.onPrimary
                                    : themeData
                                    .colorScheme.onBackground)),
                            title: Text('Item - ' + _list[index].toString(),
                                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,fontWeight: 600,color: _selected[index]
                                    ? themeData.colorScheme.onPrimary
                                    : themeData
                                    .colorScheme.onBackground)),
                            onTap: () => {
                              if (_isSelectable)
                                {
                                  setState(() {
                                    _selected[index] = !_selected[index];
                                  })
                                },
                              if (_selected.indexOf(true) == -1)
                                {
                                  setState(() {
                                    _isSelectable = false;
                                  })
                                }
                            },
                            onLongPress: (() => setState(() => {
                                  if (_isSelectable)
                                    {_selected[index] = true}
                                  else
                                    {
                                      _isSelectable = true,
                                      _selected[index] = true
                                    }
                                })),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => Divider(
                            height: 0.5,
                            color: themeData.dividerColor,
                          )),
                )));
      },
    );
  }
}
