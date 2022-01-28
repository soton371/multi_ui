/*
* File : Text Liquid Fill
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class InteractiveViewerWidget extends StatefulWidget {
  @override
  _InteractiveViewerWidgetState createState() => _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
  ThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                  child: InteractiveViewer(
                    child: Image.asset('./assets/images/all/all-1.jpg'),
                    maxScale: 5.0,
                    minScale: 0.2,
                    boundaryMargin: EdgeInsets.all(5.0),
                  ),
                )));
      },
    );
  }
}
