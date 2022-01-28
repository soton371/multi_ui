import 'package:UIKit/customapps/homemade/controllers/register_controller.dart';
import 'package:UIKit/customapps/homemade/views/full_app.dart';
import 'package:UIKit/customapps/homemade/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../../AppTheme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late ThemeData theme;
  late CustomAppTheme customTheme;
  late RegisterController registerController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    registerController =
        FxControllerStore().putOrFind(RegisterController());
  }


  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: registerController,
        builder: (registerController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                    AppTheme.customTheme.homemadePrimary.withAlpha(80))),
            child: Scaffold(
              backgroundColor: FxAppTheme.customTheme.bgLayer1,
              body: ListView(
                padding: FxSpacing.fromLTRB(24, 44, 24, 0),
                children: [
                  FxText.h4(
                    'Hey !\nSignup to get started',
                    color: AppTheme.customTheme.homemadePrimary,
                    fontWeight: 700,
                  ),
                  FxSpacing.height(60),
                  Padding(
                    padding: FxSpacing.horizontal(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxTextField(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          autoFocusedBorder: true,
                          textFieldStyle: FxTextFieldStyle.outlined,
                          textFieldType: FxTextFieldType.name,
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
                        FxSpacing.height(32),
                        FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 8,
                          onPressed: () {
                            registerController.register();

                          },
                          backgroundColor:
                          AppTheme.customTheme.homemadePrimary,
                          child: FxText.sh2(
                            "REGISTER",
                            fontWeight: 700,
                            color: AppTheme.customTheme.homemadeOnPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                        FxSpacing.height(16),
                        Center(
                          child: FxButton.text(
                            onPressed: () {
                             registerController.goToLogin();
                            },
                            splashColor: AppTheme
                                .customTheme.homemadePrimary
                                .withAlpha(40),
                            child: FxText.button("I already have an account",
                                decoration: TextDecoration.underline,
                                color: AppTheme.customTheme.homemadePrimary),
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
