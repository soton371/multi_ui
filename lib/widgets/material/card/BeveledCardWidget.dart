/*
* File : Beveled Card
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class BeveledCardWidget extends StatefulWidget {
  @override
  _BeveledCardWidgetState createState() => _BeveledCardWidgetState();
}

class _BeveledCardWidgetState extends State<BeveledCardWidget> {
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
                  title: Text("Beveled Card",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                left: MySize.size16!,
                                right: MySize.size16!,
                                top: MySize.size16!),
                            child: _OneSidedBeveledCard()),
                        Container(
                            padding: EdgeInsets.only(
                                top: MySize.size16!,
                                left: MySize.size16!,
                                right: MySize.size16!),
                            child: _TwoSidedBeveledCard()),
                        Container(
                            padding: EdgeInsets.all(MySize.size16!),
                            child: _BeveledCard()),
                      ],
                    ))));
      },
    );
  }
}

class _BeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size20!),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/hotel/room-1.jpg"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Beveled",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                      Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              height: 1.2,
                              fontWeight: 500)),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(

                            onPressed: () {},
                            child: Text(
                              "ACTION",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.button,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OneSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/hotel/room-2.jpg"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("One Sided",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight:600)),
                      Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              height: 1.2,
                              fontWeight: 500)),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(

                            onPressed: () {},
                            child: Text(
                              "ACTION",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.button,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TwoSidedBeveledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MySize.size20!), topRight: Radius.circular(MySize.size20!)),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("./assets/images/hotel/room-3.jpg"),
              height: 180,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(MySize.size16!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Two Sided",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                      Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              height: 1.2,
                              fontWeight:500)),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(

                            onPressed: () {},
                            child: Text(
                              "ACTION",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.button,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
