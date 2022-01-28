/*
* File : Triangle Clipper
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class TriangleClipper extends StatefulWidget {
  @override
  _TriangleClipperState createState() => _TriangleClipperState();
}

class _TriangleClipperState extends State<TriangleClipper> {
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
                  title: Text("Triangle Clipper",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: themeData.colorScheme.primary,
                  child: Stack(
                    children: <Widget>[
                      ClipPath(
                          clipper: _Clipper(),
                          child: Container(
                            alignment: Alignment.center,
                            color: themeData.backgroundColor,
                          )),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: MySize.size16!),
                            child: Text(
                              "Out Clipper",
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground)),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin: EdgeInsets.only(bottom: MySize.size16!),
                            child: Text(
                              "On Clipper",
                              style: themeData.textTheme.subtitle1!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.onPrimary)),
                            )),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
