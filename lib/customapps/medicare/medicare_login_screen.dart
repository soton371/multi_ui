import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/medicare/medicare_forgot_password_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_full_app.dart';
import 'package:UIKit/customapps/medicare/medicare_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class MediCareLoginScreen extends StatefulWidget {
  @override
  _MediCareLoginScreenState createState() => _MediCareLoginScreenState();
}

class _MediCareLoginScreenState extends State<MediCareLoginScreen> {
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: FxSpacing.horizontal(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.email,
                filled: true,
                fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(50),
                enabledBorderColor: AppTheme.customTheme.medicarePrimary,
                focusedBorderColor: AppTheme.customTheme.medicarePrimary,
                prefixIconColor: AppTheme.customTheme.medicarePrimary,
                labelTextColor: AppTheme.customTheme.medicarePrimary,
                cursorColor: AppTheme.customTheme.medicarePrimary,
              ),
              FxSpacing.height(24),
              FxTextField(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                autoFocusedBorder: true,
                textFieldStyle: FxTextFieldStyle.outlined,
                textFieldType: FxTextFieldType.password,
                filled: true,
                fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(50),
                enabledBorderColor: AppTheme.customTheme.medicarePrimary,
                focusedBorderColor: AppTheme.customTheme.medicarePrimary,
                prefixIconColor: AppTheme.customTheme.medicarePrimary,
                labelTextColor: AppTheme.customTheme.medicarePrimary,
                cursorColor: AppTheme.customTheme.medicarePrimary,
              ),
              FxSpacing.height(16),
              Align(
                alignment: Alignment.centerRight,
                child: FxButton.text(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MediCareForgotPasswordScreen()),
                      );
                    },
                    splashColor:
                        AppTheme.customTheme.medicarePrimary.withAlpha(40),
                    child: Text(
                      "Forgot Password?",
                      style: FxTextStyle.caption(
                          color: AppTheme.customTheme.medicarePrimary),
                    )),
              ),
              FxSpacing.height(16),
              FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: AppTheme.customTheme.medicarePrimary,
                child: FxText.sh2(
                  "LOG IN",
                  fontWeight: 700,
                  color: AppTheme.customTheme.medicareOnPrimary,
                  letterSpacing: 0.4,
                ),
              ),
              FxSpacing.height(16),
              FxButton.text(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MediCareRegistrationScreen()),
                    );
                  },
                  splashColor:
                      AppTheme.customTheme.medicarePrimary.withAlpha(40),
                  child: FxText.button("I haven\'t an account",
                      decoration: TextDecoration.underline,
                      color: AppTheme.customTheme.medicarePrimary),),
            ],
          ),
        ),
      ),
    );
  }
}
