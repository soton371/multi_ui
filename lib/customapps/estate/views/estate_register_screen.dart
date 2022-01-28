import 'package:UIKit/customapps/estate/controllers/estate_register_controller.dart';
import 'package:UIKit/customapps/estate/views/estate_login_screen.dart';
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

class EstateRegisterScreen extends StatefulWidget {
  const EstateRegisterScreen({Key? key}) : super(key: key);

  @override
  _EstateRegisterScreenState createState() => _EstateRegisterScreenState();
}

class _EstateRegisterScreenState extends State<EstateRegisterScreen> {

  late ThemeData theme;
  late CustomAppTheme customTheme;
  late EstateRegisterController estateRegisterController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateRegisterController =
        FxControllerStore().putOrFind(EstateRegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateRegisterController>(
        controller: estateRegisterController,
        builder: (estateRegisterController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                    AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child: Scaffold(
              backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
              body: FxContainer(
                color: AppTheme.customTheme.estatePrimary.withAlpha(224),
                marginAll: 0,
                paddingAll: 0,
                child: FxContainer(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                  width: MediaQuery.of(context).size.width,
                  margin: FxSpacing.top(220),
                  child: ListView(
                    children: [
                      FxText.h4(
                        'Register',
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
                              'Name',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.name,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              autoIcon: false,
                              filled: false,
                              labelText: "Your name",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: FxAppTheme.theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: estateRegisterController.nameController,
                              focusedBorderColor:
                              AppTheme.customTheme.estatePrimary,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              cursorColor: AppTheme.customTheme.estatePrimary,
                            ),
                            FxSpacing.height(16),
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
                              controller: estateRegisterController.emailController,
                              focusedBorderColor:
                              AppTheme.customTheme.estatePrimary,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              cursorColor: AppTheme.customTheme.estatePrimary,
                            ),
                            FxSpacing.height(16),
                            FxText.b1(
                              'Password',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              maxLines: 1,
                              textFieldType: FxTextFieldType.password,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              autoIcon: true,
                              filled: false,
                              labelText: "Password",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 2),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: FxAppTheme.theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller:
                              estateRegisterController.passwordController,
                              focusedBorderColor:
                              AppTheme.customTheme.estatePrimary,
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              cursorColor: AppTheme.customTheme.estatePrimary,
                              suffixIconColor:
                              AppTheme.customTheme.estatePrimary,
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
                                "REGISTER",
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
                                        builder: (context) => EstateLoginScreen()),
                                  );
                                },
                                splashColor: AppTheme
                                    .customTheme.estatePrimary
                                    .withAlpha(40),
                                child: FxText.button("I already have an account",
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
