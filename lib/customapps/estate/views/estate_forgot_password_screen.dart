import 'package:UIKit/customapps/estate/controllers/estate_forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../../AppTheme.dart';
import 'estate_full_app_screen.dart';
import 'estate_register_screen.dart';

class EstateForgotPasswordScreen extends StatefulWidget {
  const EstateForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _EstateForgotPasswordScreenState createState() => _EstateForgotPasswordScreenState();
}

class _EstateForgotPasswordScreenState extends State<EstateForgotPasswordScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;
  late EstateForgotPasswordController estateForgotPasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateForgotPasswordController =
        FxControllerStore().putOrFind(EstateForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateForgotPasswordController>(
        controller: estateForgotPasswordController,
        builder: (estateForgotPasswordController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                    AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child: Scaffold(
              backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
              body: FxContainer(
                color: AppTheme.customTheme.estatePrimary.withAlpha(220),
                marginAll: 0,
                paddingAll: 0,
                child: FxContainer(
                  paddingAll: 24,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  width: MediaQuery.of(context).size.width,
                  margin: FxSpacing.top(220),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.h5(
                        'Forgot Password?',
                        color: AppTheme.customTheme.estatePrimary,
                        fontWeight: 700,
                      ),
                      FxSpacing.height(24),
                      Padding(
                        padding: FxSpacing.horizontal(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.b1(
                              'Email',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.email,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              autoIcon: false,
                              filled: false,
                              labelText: "Your email id",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: FxAppTheme.theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: estateForgotPasswordController.emailController,
                              focusedBorderColor:
                              AppTheme.customTheme.estatePrimary,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              cursorColor: AppTheme.customTheme.estatePrimary,
                            ),
                            FxSpacing.height(32),
                            FxButton.block(
                              elevation: 0,
                              borderRadiusAll: 8,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EstateFullAppScreen()),
                                );
                              },
                              backgroundColor:
                              AppTheme.customTheme.estatePrimary,
                              child: FxText.sh2(
                                "Forgot Password",
                                fontWeight: 700,
                                color: AppTheme.customTheme.estateOnPrimary,
                                letterSpacing: 0.4,
                              ),
                            ),
                            FxSpacing.height(16),
                            Center(
                              child: FxButton.text(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EstateRegisterScreen()),
                                  );
                                },
                                splashColor: AppTheme
                                    .customTheme.estatePrimary
                                    .withAlpha(40),
                                child: FxText.button("I haven\'t an account",
                                    decoration: TextDecoration.underline,
                                    color: AppTheme.customTheme.estatePrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
