import 'dart:ui';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/cookify_login_screen.dart';
import 'package:UIKit/customapps/cookify/cookify_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:google_fonts/google_fonts.dart';

class CookifySplashScreen extends StatefulWidget {
  @override
  _CookifySplashScreenState createState() => _CookifySplashScreenState();
}

class _CookifySplashScreenState extends State<CookifySplashScreen> {
  @override
  void initState() {
    super.initState();
    FxTextStyle.changeFontFamily(GoogleFonts.mali);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.cookifyPrimary)),
      child: Scaffold(
        body: Container(
          margin: FxSpacing.fromLTRB(24, 100, 24, 32),
          child: Column(
            children: [
              FxText.h5(
                "Welcome to Cookify",
                color: AppTheme.customTheme.cookifyPrimary,
              ),
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage(
                        './assets/images/customapps/cookify/splash-1.png'),
                    width: 320,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: FxButton.text(
                        splashColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                        padding: FxSpacing.y(12),

                        onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CookifyRegisterScreen()),
                      );
                    },
                    child: FxText.b1(
                      "SIGN UP",
                      color: AppTheme.customTheme.cookifyPrimary,
                      letterSpacing: 0.5,
                    ),
                  )),
                  Expanded(
                      child: FxButton(
                    elevation: 0,
                    padding: FxSpacing.y(12),
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CookifyLoginScreen()),
                      );
                    },
                    child: FxText.b1(
                      "LOG IN",
                      color: AppTheme.customTheme.cookifyOnPrimary,
                      letterSpacing: 0.5,
                    ),
                    backgroundColor: AppTheme.customTheme.cookifyPrimary,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
