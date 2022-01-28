/*
* File : Perspective Transform
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class PerspectiveTransformWidget extends StatefulWidget {
  @override
  _PerspectiveTransformWidgetState createState() => _PerspectiveTransformWidgetState();
}

class _PerspectiveTransformWidgetState extends State<PerspectiveTransformWidget> {
  late ThemeData themeData;

  Offset _offset = Offset.zero; // changed

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Transform(  // Transform widget
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateX(0.01 * _offset.dy) // changed
                  ..rotateY(-0.01 * _offset.dx), // changed
                alignment: FractionalOffset.center,
                child: GestureDetector( // new
                  onPanUpdate: (details) => setState(() => _offset += details.delta),
                  onDoubleTap: () => setState(() => _offset = Offset.zero),
                  child: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                      ),
                      title: Text('Perspective Transform',
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight: 600)), // changed
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Swipe your finger to screen',
                            style: AppTheme.getTextStyle(themeData.textTheme.subtitle2),
                          ),
                        ],
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      tooltip: 'Back Button',
                      child: Icon(MdiIcons.chevronLeft),
                    ),
                  ),
                )
            ));
      },
    );
  }

}

