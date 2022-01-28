/*
* File : Simple Image
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class SimpleImageWidget extends StatefulWidget {
  @override
  _SimpleImageWidgetState createState() => _SimpleImageWidgetState();
}

class _SimpleImageWidgetState extends State<SimpleImageWidget> {
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
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Images",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(MySize.size16!),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: MySize.size8!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    _ImageBadgeWidget(
                                      image: './assets/images/avatar.jpg',
                                      badgeNumber: 3,
                                    ),
                                    _ImageBadgeWidget(
                                      image: './assets/images/avatar-2.jpg',
                                      badgeNumber: 1,
                                    ),
                                    _ImageBadgeWidget(
                                      image: './assets/images/avatar-1.jpg',
                                      badgeNumber: 2,
                                    ),
                                  ],
                                )),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              width: MySize.getScaledSizeHeight(200),
                              height: MySize.getScaledSizeHeight(200),
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage(
                                        './assets/images/all/all-7.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              child: _CircularWidget(
                                radius: 100,
                                image: './assets/images/all/all-9.jpg',
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              width: 350,
                              height: 200,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage(
                                        './assets/images/all/all-l3.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              width: 200,
                              height: 350,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                    image: AssetImage(
                                        './assets/images/all/all-p2.jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))));
      },
    );
  }
}

class _ImageBadgeWidget extends StatelessWidget {
  final String image;
  final int badgeNumber;

  const _ImageBadgeWidget(
      {Key? key, required this.image, required this.badgeNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none, children: <Widget>[
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                new DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.all(0),
            height: MySize.size18,
            width: MySize.size18,
            decoration: new BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: new BorderRadius.all(Radius.circular(MySize.size40!))),
            child: Center(
              child: Text(
                badgeNumber.toString(),
                style: (TextStyle(
                    color: themeData.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 9)),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _CircularWidget extends StatelessWidget {
  final String image;
  final double radius;

  const _CircularWidget({Key? key, required this.radius, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
