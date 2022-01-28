/*
* File : Action Text FAB
* Version : 1.0.0
* */

import 'dart:math';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ActionTextFABWidget extends StatefulWidget {
  @override
  _ActionTextFABWidgetState createState() => _ActionTextFABWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ActionTextFABWidgetState extends State<ActionTextFABWidget>
    with TickerProviderStateMixin {
  late ThemeData themeData;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late AnimationController _controller;
  double _contentOpacity = 1;

  static const List<IconData> icons = const [
    MdiIcons.google,
    MdiIcons.facebook,
    MdiIcons.whatsapp
  ];
  static const List<String> iconsText = const [
    "Google",
    "Facebook",
    "WhatsApp"
  ];

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
      list.add(Container(
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                backgroundColor: themeData.backgroundColor,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("FAB with Action",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                floatingActionButton: new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: new List.generate(icons.length, (int index) {
                    Widget child = new Container(
                      height: 70.0,
                      width: MediaQuery.of(context).size.width,
                      child: new ScaleTransition(
                        scale: new CurvedAnimation(
                          parent: _controller,
                          curve: new Interval(
                              0.0, 1.0 - index / icons.length / 2.0,
                              curve: Curves.easeOutQuint),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size8!,
                                  right: MySize.size8!,
                                  top: MySize.size4!,
                                  bottom: MySize.size4!),
                              margin: EdgeInsets.only(right: 4),
                              color: themeData.colorScheme.secondary,
                              child: Text(iconsText[index],
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onSecondary,
                                      fontWeight: 500,
                                      letterSpacing: 0.2)),
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: themeData.colorScheme.secondary,
                              mini: true,
                              child: new Icon(icons[index],
                                  color: themeData.colorScheme.onSecondary),
                              onPressed: () {
                                showSimpleSnackbar();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                    return child;
                  }).toList()
                    ..add(
                      new FloatingActionButton(
                        heroTag: null,
                        backgroundColor: themeData.colorScheme.primary,
                        child: new AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget? child) {
                            return new Transform(
                              transform: new Matrix4.rotationZ(
                                  _controller.value * 0.5 * pi),
                              alignment: FractionalOffset.center,
                              child: new Icon(
                                _controller.isDismissed
                                    ? Icons.share
                                    : Icons.close,
                                color: themeData.colorScheme.onPrimary,
                              ),
                            );
                          },
                        ),
                        onPressed: () {
                          if (_controller.isDismissed) {
                            setState(() {
                              _contentOpacity = 0.6;
                            });
                            _controller.forward();
                          } else {
                            setState(() {
                              _contentOpacity = 1;
                            });
                            _controller.reverse();
                          }
                        },
                      ),
                    ),
                ),
                body: Opacity(
                  opacity: _contentOpacity,
                  child: Container(
                      margin:
                          EdgeInsets.only(left: MySize.size4!, right: MySize.size4!, top: MySize.size8!, bottom: MySize.size8!),
                      color: themeData.backgroundColor,
                      child: GridView.count(
                          crossAxisCount: 2,
                          padding:  EdgeInsets.all(MySize.size4!),
                          mainAxisSpacing: MySize.size8!,
                          crossAxisSpacing: MySize.size8!,
                          children: _generateGridItems())),
                )));
      },
    );
  }

  void showSimpleSnackbar() {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          "Sharing",
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
    );
  }
}
