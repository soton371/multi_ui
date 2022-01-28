import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/shopping/ShoppingFullApp.dart';
import 'package:UIKit/screens/shopping/ShoppingRegisterScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingPasswordScreen extends StatefulWidget {
  @override
  _ShoppingPasswordScreenState createState() => _ShoppingPasswordScreenState();
}

class _ShoppingPasswordScreenState extends State<ShoppingPasswordScreen> {
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
                  padding: EdgeInsets.only(top: MySize.size48!),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                                  child: Center(
                                    child: Text(
                                      "Reset Password",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          fontWeight: 700),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size48!, right: MySize.size48!,top: MySize.size40!),
                                child: Text(
                                  "Enter your email address to reset your password",
                                  softWrap: true,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 500,
                                      height: 1.2,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(200)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24!, right: MySize.size24!, top: MySize.size36!),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: themeData.cardTheme.color,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size16!)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: MySize.size8!,
                                            color: themeData.cardTheme.shadowColor!
                                                .withAlpha(25),
                                            offset: Offset(0, 3)),
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            fontWeight: 500,
                                            letterSpacing: 0.2),
                                        decoration: InputDecoration(
                                          hintStyle: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              fontWeight: 500,
                                              letterSpacing: 0,
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(180)),
                                          hintText: "Email Address",
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.all(MySize.size16!),
                                        ),
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        textCapitalization:
                                        TextCapitalization.sentences,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  margin:
                                  EdgeInsets.only(left: MySize.size24!, right: MySize.size24!, top: MySize.size36!),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(MySize.size48!)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          themeData.primaryColor.withAlpha(100),
                                          blurRadius: 5,
                                          offset: Offset(
                                              0, 5),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(

                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShoppingFullApp()));
                                      },
                                      child: Stack(
                                        clipBehavior: Clip.none, alignment: Alignment.center,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "RESET PASSWORD",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color:
                                                  themeData.colorScheme.onPrimary,
                                                  letterSpacing: 0.6,
                                                  fontWeight: 700),
                                            ),
                                          ),
                                          Positioned(
                                            right: 16,
                                            child: ClipOval(
                                              child: Container(
                                                color: themeData
                                                    .colorScheme.primaryVariant,
                                                // button color
                                                child: SizedBox(
                                                    width: MySize.size30,
                                                    height: MySize.size30,
                                                    child: Icon(
                                                      MdiIcons.arrowRight,
                                                      color: themeData
                                                          .colorScheme.onPrimary,
                                                      size: MySize.size18,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          ShoppingRegisterScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: Center(
                                    child: Text(
                                      "I haven't an account",
                                      style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
