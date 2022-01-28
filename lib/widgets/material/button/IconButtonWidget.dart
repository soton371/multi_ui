/*
* File : Icon Button
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class IconButtonWidget extends StatefulWidget {
  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<IconButtonWidget> {

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
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Icon Button",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text("Filled Buttons",
                                    style: themeData
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                            color: themeData
                                                .colorScheme
                                                .onBackground
                                                ))),
                              ),
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: Material(
                                      color: Colors.blue, // button color
                                      child: InkWell(
                                        splashColor: Colors.white,
                                        // inkwell color
                                        child: SizedBox(
                                            width: MySize.size56,
                                            height: MySize.size56,
                                            child: Icon(Icons.add)),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.green,
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          // inkwell color
                                          child: SizedBox(
                                              width: MySize.size56,
                                              height: MySize.size56,
                                              child: Icon(Icons.menu)),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.red, // button color
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          // inkwell color
                                          child: SizedBox(
                                              width: MySize.size56,
                                              height: MySize.size56,
                                              child: Icon(Icons.share)),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: MySize.size8!, top: MySize.size16!),
                                child: Text("Outline Buttons",
                                    style: themeData
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                            color: themeData
                                                .colorScheme
                                                .onBackground
                                                ))),
                              ),
                              Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(MySize.size28!),
                                          side: BorderSide(
                                              color: Colors.blue
                                          )
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.blue,
                                        // inkwell color
                                        child: SizedBox(
                                            width: MySize.size56,
                                            height: MySize.size56,
                                            child: Icon(Icons.add,color: themeData.colorScheme.onBackground,)),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.transparent, // button color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(MySize.size28!),
                                          side: BorderSide(
                                            color: Colors.green
                                          )
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.green,
                                          child: SizedBox(
                                              width: MySize.size56,
                                              height: MySize.size56,
                                              child: Icon(Icons.menu,color: themeData.colorScheme.onBackground,)),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size16!),
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(MySize.size28!),
                                            side: BorderSide(
                                                color: Colors.red
                                            )
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.red,
                                          child: SizedBox(
                                              width: MySize.size56,
                                              height: MySize.size56,
                                              child: Icon(Icons.share,color: themeData.colorScheme.onBackground,)),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }
}
