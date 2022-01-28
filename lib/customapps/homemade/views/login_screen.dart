import 'package:UIKit/customapps/homemade/controllers/login_controller.dart';
import 'package:UIKit/customapps/homemade/views/forgot_password_screen.dart';
import 'package:UIKit/customapps/homemade/views/full_app.dart';
import 'package:UIKit/customapps/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../../AppTheme.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  late ThemeData theme;
  late CustomAppTheme customTheme;
  late LogInController logInController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    logInController =
        FxControllerStore().putOrFind(LogInController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: logInController,
        builder: (logInController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary:
                    customTheme.homemadePrimary.withAlpha(80))),
            child: Scaffold(
              backgroundColor: FxAppTheme.customTheme.bgLayer1,
              body: ListView(
                padding: FxSpacing.fromLTRB(24, 44, 24, 0),
                children: [
                  FxText.h4(
                    'Hello !\nWelcome to homemade App',
                    color: customTheme.homemadePrimary,
                    fontWeight: 700,
                  ),
                  FxSpacing.height(80),
                  Padding(
                    padding: FxSpacing.horizontal(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxTextField(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          autoFocusedBorder: true,
                          textFieldStyle: FxTextFieldStyle.outlined,
                          textFieldType: FxTextFieldType.email,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          enabledBorderColor: customTheme.homemadePrimary,
                          focusedBorderColor: customTheme.homemadePrimary,
                          prefixIconColor: customTheme.homemadePrimary,
                          labelTextColor: customTheme.homemadePrimary,
                          cursorColor: customTheme.homemadePrimary,
                        ),
                        FxSpacing.height(24),
                        FxTextField(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          autoFocusedBorder: true,
                          textFieldStyle: FxTextFieldStyle.outlined,
                          textFieldType: FxTextFieldType.password,
                          suffixIconColor: customTheme.homemadePrimary,
                          filled: true,
                          fillColor: customTheme.homemadePrimary.withAlpha(50),
                          enabledBorderColor: customTheme.homemadePrimary,
                          focusedBorderColor: customTheme.homemadePrimary,
                          prefixIconColor: customTheme.homemadePrimary,
                          labelTextColor: customTheme.homemadePrimary,
                          cursorColor: customTheme.homemadePrimary,
                        ),
                        FxSpacing.height(16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FxButton.text(
                              onPressed: () {
                                  logInController.goToForgotPassword();
                              },
                              splashColor: AppTheme
                                  .customTheme.homemadePrimary
                                  .withAlpha(40),
                              child: Text(
                                "Forgot Password?",
                                style: FxTextStyle.caption(
                                    color:
                                    customTheme.homemadePrimary),
                              )),
                        ),
                        FxSpacing.height(16),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 8,
                          onPressed: () {
                            logInController.login();
                          },
                          backgroundColor:
                          customTheme.homemadePrimary,
                          child: FxText.sh2(
                            "LOG IN",
                            fontWeight: 700,
                            color: customTheme.homemadeOnPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                        FxSpacing.height(16),
                        Center(
                          child: FxButton.text(
                            onPressed: () {
                              logInController.goToRegister();
                            },
                            splashColor: AppTheme
                                .customTheme.homemadePrimary
                                .withAlpha(40),
                            child: FxText.button("I haven\'t an account",
                                decoration: TextDecoration.underline,
                                color: customTheme.homemadePrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
