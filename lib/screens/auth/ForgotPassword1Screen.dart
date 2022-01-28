/*
* File : Forgot Password
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class ForgotPassword1Screen extends StatefulWidget {
  @override
  _ForgotPassword1ScreenState createState() => _ForgotPassword1ScreenState();
}

class _ForgotPassword1ScreenState extends State<ForgotPassword1Screen> {
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
                body: Container(
              color: themeData.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.background,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size48!))),
                        ),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: BackButton(
                            color: themeData.colorScheme.onBackground,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            "FORGOT PASSWORD",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!),
                        color: themeData.backgroundColor,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                left: MySize.size16!,
                                right: MySize.size16!,
                              ),
                              child: Card(
                                elevation: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(MySize.size16!),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            letterSpacing: 0.1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              letterSpacing: 0.1,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                          prefixIcon:
                                              Icon(MdiIcons.emailOutline),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: MySize.size16!),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size24!)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(28),
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                            ),
                                            onPressed: () {},
                                            child: Text("RESET PASSWORD",
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.button,
                                                    fontWeight: 600,
                                                    color: themeData
                                                        .colorScheme.onPrimary,
                                                    letterSpacing: 0.5))),
                                      ),
                                    ],
                                  ),
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
}
