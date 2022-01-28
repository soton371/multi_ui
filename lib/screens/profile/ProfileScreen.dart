/*
* File : Social Profile
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  _generateGridItems() {
    List<Widget> list = [];
    for (int i = 0; i < 9; i++) {
      if (i < 8) {
        list.add(Container(
          child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
        ));
      } else {
        list.add(InkWell(
          splashColor: themeData.colorScheme.primary.withAlpha(100),
          highlightColor:  themeData.colorScheme.primary.withAlpha(28),
          onTap: (){

          },
          child: Container(
            color: themeData.colorScheme.primary.withAlpha(28),
            child: Center(
              child: Text(
                "View All",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.primary,
                    fontWeight: 600),
              ),
            ),
          ),
        ));
      }
    }
    return list;
  }

  String _aboutText =
      "Lorem Ipsum: usage Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. ";

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: MySize.size16!),
                            width:MySize.getScaledSizeHeight(140),
                            height:MySize.getScaledSizeHeight(140),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: AssetImage(
                                      "./assets/images/avatar-1.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Text("Natalia Dyer",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline5,
                                  fontWeight: 700,
                                  letterSpacing: 0)),
                          Text("UI Designer",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size40!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size24!, right: MySize.size12!),
                                  decoration: BoxDecoration(
                                      color: themeData.backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: MySize.size10!,
                                            color: themeData
                                                .cardTheme.shadowColor!
                                                .withOpacity(0.14),
                                            offset: Offset(2.0, 2.0)),
                                      ]),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "3",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color:
                                                themeData.colorScheme.primary,
                                            fontWeight: 700),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: MySize.size4!),
                                        child: Text("Posts",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                letterSpacing: 0.2)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size12!, right: MySize.size12!),
                                  decoration: new BoxDecoration(
                                      color: themeData.backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10.0,
                                            color: themeData
                                                .cardTheme.shadowColor!
                                                .withOpacity(0.14),
                                            offset: Offset(2.0, 2.0)),
                                      ]),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "159",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color:
                                                themeData.colorScheme.primary,
                                            fontWeight: 700),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: MySize.size4!),
                                        child: Text("Followings",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                letterSpacing: 0.2)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size12!, right: MySize.size24!),
                                  decoration: new BoxDecoration(
                                      color: themeData.backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10.0,
                                            color: themeData
                                                .cardTheme.shadowColor!
                                                .withOpacity(0.14),
                                            offset: Offset(2.0, 2.0)),
                                      ]),
                                  padding: EdgeInsets.all(MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "357",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color:
                                                themeData.colorScheme.primary,
                                            fontWeight: 700),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: MySize.size4!),
                                        child: Text("Followers",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                letterSpacing: 0.2)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: MySize.size24!, right: MySize.size24!, top: MySize.size24!),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "About",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      letterSpacing: 0,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                    _aboutText,
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        fontWeight: 500,
                                        height: 1.3),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size24!),
                                  child: Text(
                                    "Feed",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        letterSpacing: 0,
                                        fontWeight: 700),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: GridView.count(
                                      physics: ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(bottom: MySize.size16!),
                                      crossAxisCount: 3,
                                      mainAxisSpacing: MySize.size8!,
                                      crossAxisSpacing: MySize.size8!,
                                      children: _generateGridItems()),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 24,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                )
              ],
            )));
      },
    );
  }
}
