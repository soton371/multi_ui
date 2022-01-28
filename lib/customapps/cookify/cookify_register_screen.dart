import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/cookify_forgot_password_screen.dart';
import 'package:UIKit/customapps/cookify/cookify_full_app.dart';
import 'package:UIKit/customapps/cookify/cookify_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

class CookifyRegisterScreen extends StatefulWidget {
  @override
  _CookifyRegisterScreenState createState() => _CookifyRegisterScreenState();
}

class _CookifyRegisterScreenState extends State<CookifyRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.cookifyPrimary.withAlpha(80))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24,100,24,0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: AppTheme.customTheme.cookifyPrimary,
              size: 64,
            ),
            FxSpacing.height(16),
            FxText.h5("Create an Account",
                color: AppTheme.customTheme.cookifyPrimary, fontWeight: 800,textAlign: TextAlign.center,),
            FxSpacing.height(32),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.name,
              filled: true,
              fillColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.cookifyPrimary,
              focusedBorderColor: AppTheme.customTheme.cookifyPrimary,
              prefixIconColor: AppTheme.customTheme.cookifyPrimary,
              labelTextColor: AppTheme.customTheme.cookifyPrimary,
              cursorColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.cookifyPrimary,
              focusedBorderColor: AppTheme.customTheme.cookifyPrimary,
              prefixIconColor: AppTheme.customTheme.cookifyPrimary,
              labelTextColor: AppTheme.customTheme.cookifyPrimary,
              cursorColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.height(24),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.password,
              filled: true,
              fillColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.cookifyPrimary,
              focusedBorderColor: AppTheme.customTheme.cookifyPrimary,
              prefixIconColor: AppTheme.customTheme.cookifyPrimary,
              labelTextColor: AppTheme.customTheme.cookifyPrimary,
              cursorColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.height(16),

            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                  padding: FxSpacing.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CookifyForgotPasswordScreen()),
                    );
                  },
                  splashColor:
                      AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                  child: FxText.caption("Forgot Password?",
                      color: AppTheme.customTheme.cookifyPrimary)),
            ),
            FxSpacing.height(16),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CookifyFullApp()),
                  );
                },
                backgroundColor: AppTheme.customTheme.cookifyPrimary,
                child: FxText.b1(
                  "Create an Account",color: AppTheme.customTheme.cookifyOnPrimary,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CookifyLoginScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                child: FxText.button("I have already an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.cookifyPrimary)),
            FxSpacing.height(16),

          ],
        ),
      ),
    );
  }
}
