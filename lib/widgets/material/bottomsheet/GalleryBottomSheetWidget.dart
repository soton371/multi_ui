/*
* File : Gallery Bottom Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class GalleryBottomSheetWidget extends StatefulWidget {
  @override
  _GalleryBottomSheetWidgetState createState() =>
      _GalleryBottomSheetWidgetState();
}

class _GalleryBottomSheetWidgetState extends State<GalleryBottomSheetWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
  }

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
  ];

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 32; i++) {
      list.add(InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Container(
          child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
        ),
      ));
    }
    return list;
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
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Gallery",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MySize.size8!, horizontal: MySize.size16!),
                        color: themeData.appBarTheme.color,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.informationOutline,
                              color: themeData.appBarTheme.iconTheme!.color,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MySize.size8!),
                              child: Text("Tap on any image",
                                  style: themeData
                                      .textTheme.subtitle2),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: GridView.count(
                              crossAxisCount: 2,
                              padding: EdgeInsets.all(MySize.size16!),
                              mainAxisSpacing: MySize.size16!,
                              crossAxisSpacing: MySize.size16!,
                              children: _generateGridItems()),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.eyeOutline,
                          color: themeData.colorScheme.onBackground),
                      title: Text("Preview",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 600)),
                    ),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.shareOutline,
                            color: themeData.colorScheme.onBackground),
                        title: Text("Share",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600))),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.downloadOutline,
                            color: themeData.colorScheme.onBackground),
                        title: Text("Download",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600))),
                    ListTile(
                        dense: true,
                        leading: Icon(MdiIcons.contentCopy,
                            color: themeData.colorScheme.onBackground),
                        title: Text("Make a copy",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600))),
                    ListTile(
                        dense: true,
                        leading: Icon(
                          MdiIcons.deleteOutline,
                          color: themeData.colorScheme.onBackground,
                        ),
                        title: Text("Delete",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight:600))),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
