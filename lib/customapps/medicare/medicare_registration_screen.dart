import 'package:UIKit/customapps/medicare/medicare_forgot_password_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_full_app.dart';
import 'package:UIKit/customapps/medicare/medicare_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../AppTheme.dart';

class MediCareRegistrationScreen extends StatefulWidget {
  @override
  _MediCareRegistrationScreenState createState() => _MediCareRegistrationScreenState();
}

class _MediCareRegistrationScreenState extends State<MediCareRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.horizontal(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.name,
              filled: true,
              fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
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
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
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
              fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
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
                  padding: FxSpacing.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MediCareForgotPasswordScreen()),
                    );
                  },
                  splashColor:
                  AppTheme.customTheme.medicarePrimary.withAlpha(40),
                  child: FxText.caption("Forgot Password?",
                      color: AppTheme.customTheme.medicarePrimary)),
            ),
            FxSpacing.height(16),
            FxButton.block(
                borderRadiusAll: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MediCareFullApp()),
                  );
                },
                backgroundColor: AppTheme.customTheme.medicarePrimary,
                child: FxText.b1(
                  "Create an Account",color: AppTheme.customTheme.medicareOnPrimary,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MediCareLoginScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
                child: FxText.button("I have already an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.medicarePrimary)),
          ],
        ),
      ),
    );
  }
}
