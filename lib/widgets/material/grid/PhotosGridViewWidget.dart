/*
* File : Photos Grid
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class PhotosGridViewWidget extends StatefulWidget {
  @override
  _PhotosGridViewWidgetState createState() => _PhotosGridViewWidgetState();
}

class _PhotosGridViewWidgetState extends State<PhotosGridViewWidget> {

  late ThemeData themeData;

  List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
    './assets/images/all/all-15.jpg',
  ];

  int number = 0;

  _generateGridItems(int size) {
    List<Widget> list = [];
    for (int i = 0; i < size; i++) {
      list.add(ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Image.asset(
          _imageList[(number) % 15],
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
      ));
      number++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    themeData=Theme.of(context);
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
                  title: Text("Grid Photos",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 16,left: 16, right: 8),
                            child: Text(
                              "29, Jun 2020",
                              style: AppTheme.getTextStyle(themeData
                                  .textTheme
                                  .bodyText2,fontWeight: 600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12,top: 12),
                            child: GridView.count(
                              crossAxisCount: 3,
                              padding: const EdgeInsets.all(4.0),
                              shrinkWrap: true,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              children: _generateGridItems(7),
                              physics: ClampingScrollPhysics(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: Text(
                              "26, Jun 2020",
                              style: AppTheme.getTextStyle(themeData
                                  .textTheme
                                  .bodyText2,fontWeight: 600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, right: 12,top: 12),
                            child: GridView.count(
                              crossAxisCount: 4,
                              padding: const EdgeInsets.all(4.0),
                              shrinkWrap: true,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              children: _generateGridItems(7),
                              physics: ClampingScrollPhysics(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 16,left: 16, right: 16),
                            child: Text(
                              "Older photos",
                              style: AppTheme.getTextStyle(themeData
                                  .textTheme
                                  .bodyText2,fontWeight: 600),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(14),
                            child: GridView.count(
                              crossAxisCount: 5,
                              padding: const EdgeInsets.all(4.0),
                              shrinkWrap: true,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: _generateGridItems(10),
                              physics: ClampingScrollPhysics(),
                            ),
                          )
                        ],
                      ),
                    ))));
      },
    );
  }
}
