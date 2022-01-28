import 'package:UIKit/customapps/medicare/medicare_full_app.dart';
import 'package:UIKit/customapps/medicare/medicare_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../AppTheme.dart';

class MediCareForgotPasswordScreen extends StatefulWidget {
  @override
  _MediCareForgotPasswordScreenState createState() => _MediCareForgotPasswordScreenState();
}

class _MediCareForgotPasswordScreenState extends State<MediCareForgotPasswordScreen> {
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
              textFieldType: FxTextFieldType.email,
              filled: true,
              fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
              enabledBorderColor: AppTheme.customTheme.medicarePrimary,
              focusedBorderColor: AppTheme.customTheme.medicarePrimary,
              prefixIconColor: AppTheme.customTheme.medicarePrimary,
              labelTextColor: AppTheme.customTheme.medicarePrimary,
              cursorColor: AppTheme.customTheme.medicarePrimary,
            ),

            FxSpacing.height(32),
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
                  "Forgot Password",
                  color: AppTheme.customTheme.medicareOnPrimary,
                  fontWeight: 600,letterSpacing: 0.3,
                )),
            FxSpacing.height(16),
            FxButton.text(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MediCareRegistrationScreen()),
                  );
                },
                splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
                child: FxText.button("I haven\'t an account",
                    decoration: TextDecoration.underline,
                    color: AppTheme.customTheme.medicarePrimary))
          ],
        ),
      ),
    );
  }
}

