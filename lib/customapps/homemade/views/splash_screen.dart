import 'package:UIKit/customapps/homemade/controllers/splash_controller.dart';
import 'package:UIKit/customapps/homemade/views/login_screen.dart';
import 'package:UIKit/customapps/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;
  late SplashController splashController;

  @override
  void initState() {
    super.initState();
    FxTextStyle.changeFontFamily(GoogleFonts.k2d);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    splashController =
        FxControllerStore().putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashController>(
        controller: splashController,
        builder: (splashController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                    AppTheme.customTheme.homemadePrimary.withAlpha(80))),
            child: Scaffold(
              backgroundColor: customTheme.bgLayer1,
              body: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: FxContainer.none(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.hardEdge,
                      child: Image(image: AssetImage('assets/homemade/splash.jpg'),
                      fit: BoxFit.fitHeight,
                      ),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FxText.h4('Find your Products Inside',fontWeight: 700,color: customTheme.homemadePrimary,textAlign: TextAlign.center,),
                      FxSpacing.height(32),
                      Padding(
                        padding: FxSpacing.horizontal(80),
                        child: FxButton.block(
                          borderRadiusAll: 8,
                          elevation: 0,
                          backgroundColor: customTheme.homemadePrimary,
                            onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LogInScreen()),
                          );
                        }, child: FxText.b1('Log In',color: customTheme.homemadeOnPrimary,fontWeight: 700,letterSpacing: 0.5,)),
                      ),
                      FxSpacing.height(24),
                      Padding(
                        padding: FxSpacing.horizontal(80),
                        child: FxButton.block(
                            borderRadiusAll: 8,
                            elevation: 0,
                            backgroundColor: customTheme.homemadeSecondary,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegisterScreen()),
                              );
                            }, child: FxText.b1('Register',color: customTheme.homemadeOnPrimary,fontWeight: 700,letterSpacing: 0.5,)),
                      ),
                      FxSpacing.height(40),

                    ],
                  ),

                ],
              ),
            ),
          );
        });
  }
}

