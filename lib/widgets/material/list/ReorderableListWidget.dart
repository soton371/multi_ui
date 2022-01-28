/*
* File : Reorderable List
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ReorderableListWidget extends StatefulWidget {
  @override
  _ReorderableListWidgetState createState() => _ReorderableListWidgetState();
}

class _ReorderableListWidgetState extends State<ReorderableListWidget> {
  
  late ThemeData themeData;
  
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
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
                  title: Text("Reorderable List",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                  child: ReorderableListView(
                    onReorder: _onReorder,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    children: List.generate(
                      alphabetList.length,
                      (index) {
                        return ListViewCard(
                          alphabetList,
                          index,
                          Key('$index'),
                        );
                      },
                    ),
                  ),
                )));
      },
    );
  }
}

class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  ListViewCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(4),
      color: themeData.cardColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left:8.0,top: 8),
                  child: Text(
                    'Title ${widget.listItems[widget.index]}',
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,fontWeight: 600),
                    maxLines: 5,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:8.0,top: 8,bottom: 8),
                  child: Text(
                    'Description ${widget.listItems[widget.index]}',
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,fontWeight: 500),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(
              MdiIcons.dragHorizontalVariant,
              color: themeData.colorScheme.onBackground.withAlpha(200),
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
