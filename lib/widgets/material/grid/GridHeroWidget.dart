/*
* File : Grid Hero
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/FullImageScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class GridHeroWidget extends StatefulWidget {
  @override
  _GridHeroWidgetState createState() => _GridHeroWidgetState();
}

class _GridHeroWidgetState extends State<GridHeroWidget> {

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
  ];

  void _showFullImage(String imagePath,String imageTag){
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            FullImageScreen(imagePath: imagePath,imageTag: imageTag, backgroundOpacity: 200,)));
  }

  _generateGridItems(){
    List<Widget> list = [];
    for(int i=0;i<32;i++){
        list.add(
          GestureDetector(
            onTap: (){
              _showFullImage(_imageList[i%14], 'imageTag-'+i.toString());
            },
            child: Container(
              child: Hero(tag: 'imageTag-'+i.toString(),
              child: Image(image: AssetImage(_imageList[i%14]),fit: BoxFit.fill)),
            ),
          )
        );
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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Grid Hero",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                body: Container(
                    padding: EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
                    child: GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        children: _generateGridItems()
                    )

                )));
      },
    );
  }
}
