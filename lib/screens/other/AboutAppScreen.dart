import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("About app",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: MySize.size32!,
                        left: MySize.size24!,
                        right: MySize.size24!),
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MySize.size60,
                              height: MySize.size60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "./assets/images/avatar-3.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size24!),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "FlutKit",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600,
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ),
                                  Container(
                                    child: Text(
                                      "Flutter Biggest UI KIT",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500,
                                          color: themeData
                                              .colorScheme.onBackground),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size8!,
                                      right: MySize.size8!,
                                      top: MySize.size4!,
                                      bottom: MySize.size4!),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size4!)),
                                    color: themeData.colorScheme.primary,
                                  ),
                                  child: Text(
                                    "v 2.0.0",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontSize: 11,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.3),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        child: Text(
                          Generator.getDummyText(32, withTab: true),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Text(
                          Generator.getDummyText(48, withTab: true),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
