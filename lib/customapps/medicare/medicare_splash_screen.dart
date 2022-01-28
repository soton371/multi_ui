import 'package:UIKit/customapps/medicare/medicare_login_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../AppTheme.dart';

class MediCareSplashScreen extends StatefulWidget {
  @override
  _MediCareSplashScreenState createState() => _MediCareSplashScreenState();
}

class _MediCareSplashScreenState extends State<MediCareSplashScreen> {
  @override
  void initState() {
    super.initState();
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w200,
      200: FontWeight.w300,
      300: FontWeight.w400,
      400: FontWeight.w500,
      500: FontWeight.w600,
      600: FontWeight.w700,
      700: FontWeight.w800,
      800: FontWeight.w900,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.medicarePrimary)),
      child: Scaffold(
        backgroundColor: FxAppTheme.theme.backgroundColor,
        body: Container(
          margin: FxSpacing.fromLTRB(24, 100, 24, 32),
          child: Column(
            children: [
              FxText.h5(
                "Welcome to MediCare",
                color: AppTheme.customTheme.medicarePrimary,
              ),
              Expanded(
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/customapps/medicare/medicare_splash_screen.png'),
                    width: 320,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: FxButton.text(
                    splashColor:
                        AppTheme.customTheme.medicarePrimary.withAlpha(40),
                    padding: FxSpacing.y(12),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MediCareRegistrationScreen()),
                      );
                    },
                    child: FxText.b1(
                      "SIGN UP",
                      color: AppTheme.customTheme.medicarePrimary,
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
                            builder: (context) => MediCareLoginScreen()),
                      );
                    },
                    child: FxText.b1(
                      "LOG IN",
                      color: AppTheme.customTheme.medicareOnPrimary,
                      letterSpacing: 0.5,
                    ),
                    backgroundColor: AppTheme.customTheme.medicarePrimary,
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
