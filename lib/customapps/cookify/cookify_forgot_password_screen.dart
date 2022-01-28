import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/cookify_full_app.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import 'cookify_register_screen.dart';

class CookifyForgotPasswordScreen extends StatefulWidget {
  @override
  _CookifyForgotPasswordScreenState createState() => _CookifyForgotPasswordScreenState();
}

class _CookifyForgotPasswordScreenState extends State<CookifyForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.cookifyPrimary.withAlpha(80))),
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24,200,24,0),
          children: [
            FxTwoToneIcon(
              FxTwoToneMdiIcons.menu_book,
              color: AppTheme.customTheme.cookifyPrimary,
              size: 64,
            ),
            FxSpacing.height(16),
            FxText.h5("Forgot Password",
                color: AppTheme.customTheme.cookifyPrimary, fontWeight: 800,textAlign: TextAlign.center,),
            FxSpacing.height(32),
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

            FxSpacing.height(32),
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
                  "Forgot Password",
                  color: AppTheme.customTheme.cookifyOnPrimary,
                  fontWeight: 600,letterSpacing: 0.3,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CookifyRegisterScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                child: FxText.button("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.cookifyPrimary))
          ],
        ),
      ),
    );
  }
}
