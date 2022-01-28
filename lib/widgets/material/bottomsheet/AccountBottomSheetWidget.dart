/*
* File : Account Choose Bottom Sheet 
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class AccountBottomSheetWidget extends StatefulWidget {
  @override
  _AccountBottomSheetWidgetState createState() =>
      _AccountBottomSheetWidgetState();
}

class _AccountBottomSheetWidgetState extends State<AccountBottomSheetWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
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
                  title: Text("Account",
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
                              child: Text("Tap on account image",
                                  style: themeData
                                      .textTheme.subtitle2),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(MySize.size16!),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MySize.size12!,
                                top: MySize.size6!,
                                right: MySize.size12!,
                                bottom: MySize.size6!),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: MySize.size8!),
                                    child: Container(
                                      child: TextField(
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "Search here",
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            isDense: true),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showBottomSheet(context);
                                  },
                                  child: Container(
                                    width: MySize.size36,
                                    height: MySize.size36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          image: AssetImage(
                                              "./assets/images/avatar-2.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                    Container(
                      padding: EdgeInsets.only(
                          top: MySize.size8!, left: MySize.size8!),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MySize.size40,
                            height: MySize.size40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  image: AssetImage(
                                      './assets/images/avatar-2.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: MySize.size16!),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Bianka Armitage",
                                    style: themeData.textTheme.subtitle1!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground,
                                            letterSpacing: 0.3,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Bian@gmail.com",
                                        style: themeData.textTheme.bodyText2!
                                            .merge(TextStyle(
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                letterSpacing: 0.3)),
                                      ),
                                      Icon(
                                        MdiIcons.chevronDown,
                                        size: 16,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: themeData.dividerColor,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.bellRingOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Activity",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.cogOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Settings",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.helpCircleOutline,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                      title: Text(
                        "Help \& Feedback",
                        style: themeData.textTheme.bodyText1!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
