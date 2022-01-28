
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class ProductSoldOutScreen extends StatefulWidget {
  @override
  _ProductSoldOutScreenState createState() => _ProductSoldOutScreenState();
}

class _ProductSoldOutScreenState extends State<ProductSoldOutScreen> {
  late ThemeData themeData;

  bool? checkValue = true;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
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
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                    child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size64!),
                        child: Text(
                         "This item is out of stock",
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.3,
                            fontWeight: 600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size64!, bottom: MySize.size64!),
                        child: Icon(
                          MdiIcons.emoticonSadOutline,
                          size: MySize.size64,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                      Text(
                       "We are sorry,\nThis product cannot be purchased at this time",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0,
                          fontWeight: 500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkValue = value;
                                });
                              },
                              value: checkValue,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size8!),
                              child: Text(
                                "Notify me when it available",
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
      },
    );
  }
}
