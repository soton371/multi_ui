/*
* File : Login & Register
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:UIKit/utils/TabIndicatorPainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/widgets/button/button.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen>
    with SingleTickerProviderStateMixin {
  bool _passwordVisible = false;
  PageController? _pageController;
  late ThemeData themeData;
  int _selectedIndex = 0;
  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: themeData.backgroundColor,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        color: themeData.backgroundColor,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 30,
                              left: 10,
                              child: BackButton(
                                color: themeData.colorScheme.onBackground,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: _buildMenuBar(context),
                      ),
                      Expanded(
                        flex: 1,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (i) {
                            if (i == 0) {
                              setState(() {
                                _selectedIndex = 0;
                                right = Colors.white;
                                left = Colors.black;
                              });
                            } else if (i == 1) {
                              setState(() {
                                _selectedIndex = 1;
                                right = Colors.black;
                                left = Colors.white;
                              });
                            }
                          },
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: Padding(
                                padding: EdgeInsets.only(top: 24),
                                child: _buildSignIn(context),
                              ),
                            ),
                            ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 24),
                                  child: _buildSignUp(context),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: themeData.colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(
            pageController: _pageController,
            selectedBackground: themeData.colorScheme.primary,
            indicatorWidth: 125,
            xPadding: 25,
            indicatorRadius: 20,
            yPadding: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FxButton(
                onPressed: _onSignInButtonPress,
                backgroundColor: Colors.transparent,
                child: Text(
                  "Login",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: _selectedIndex == 0 ? 700 : 600,
                      color: _selectedIndex == 0
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.onBackground),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FxButton(
                elevation: 0,
                padding: Spacing.x(0),
                onPressed: _onSignUpButtonPress,
                backgroundColor: Colors.transparent,
                child: Text(
                  "Register",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: _selectedIndex == 1 ? 700 : 600,
                      color: _selectedIndex == 1
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5.0,
              color: themeData.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MySize.size8!),
              ),
              child: Container(
                width: 340.0,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MySize.size24!,
                      left: MySize.size24!,
                      right: MySize.size24!,
                      bottom: MySize.size32!),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            letterSpacing: 0.1,
                            color: themeData.colorScheme.onBackground),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground),
                          prefixIcon: Icon(MdiIcons.emailOutline),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0.1,
                              color: themeData.colorScheme.onBackground),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground),
                            prefixIcon: Icon(MdiIcons.lockOutline),
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisible
                                  ? MdiIcons.eyeOutline
                                  : MdiIcons.eyeOffOutline),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: _passwordVisible,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password ?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontWeight: 500)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.primary.withAlpha(28),
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                  ),
                  onPressed: () {},
                  child: Text("LOGIN",
                      style: AppTheme.getTextStyle(themeData.textTheme.button,
                          fontWeight: 600,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0.5))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5.0,
              color: themeData.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MySize.size8!),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MySize.size24!,
                    right: MySize.size24!,
                    top: MySize.size24!,
                    bottom: MySize.size36!),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        prefixIcon: Icon(MdiIcons.accountOutline),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight:500),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: Icon(MdiIcons.emailOutline),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Number",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: Icon(MdiIcons.phoneOutline),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          prefixIcon: Icon(MdiIcons.lockOutline),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? MdiIcons.eyeOutline
                                : MdiIcons.eyeOffOutline),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: _passwordVisible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16!),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                boxShadow: [
                  BoxShadow(
                    color: themeData.colorScheme.primary.withAlpha(28),
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                  ),
                  onPressed: () {},
                  child: Text("REGISTER",
                      style: AppTheme.getTextStyle(themeData.textTheme.button,
                          fontWeight: 600,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0.5))),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController!.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
