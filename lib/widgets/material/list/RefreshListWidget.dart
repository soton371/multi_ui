/*
* File : Refresh List
* Version : 1.0.0
* */


import 'dart:async';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class RefreshListWidget extends StatefulWidget {
  @override
  _RefreshListWidgetState createState() => _RefreshListWidgetState();
}

class _RefreshListWidgetState extends State<RefreshListWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  late ThemeData themeData;

  List<String> _items = [
    "Item - 2",
    "Item - 1",
  ];


  @override
  void initState() {
    super.initState();
  }

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: ListTile(
        title: Text(
          item,
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
              fontWeight: 600, letterSpacing: 0.3),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    addItem();
    return null;
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
                  title: Text("Pull to Refresh",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  child: RefreshIndicator(
                    backgroundColor: themeData.backgroundColor,
                    color: themeData.colorScheme.primary,
                    onRefresh: _onRefresh,
                    child: AnimatedList(
                      key: listKey,
                      initialItemCount: _items.length,
                      itemBuilder: (context, index, animation) {
                        return _buildItem(context, index, animation);
                      },
                    ),
                  ),
                )));
      },
    );
  }

  void addItem() {
    setState(() {
      listKey.currentState!
          .insertItem(0, duration: const Duration(milliseconds: 200));
      _items = []
        ..add("Item - " + (_items.length + 1).toString())
        ..addAll(_items);
    });
  }
}
