import 'package:UIKit/customapps/estate/views/estate_chat_screen.dart';
import 'package:UIKit/customapps/estate/views/estate_home_screen.dart';
import 'package:UIKit/customapps/estate/views/estate_profile_screen.dart';
import 'package:UIKit/customapps/estate/views/estate_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../AppTheme.dart';

class EstateFullAppScreen extends StatefulWidget {
  const EstateFullAppScreen({Key? key}) : super(key: key);

  @override
  _EstateFullAppScreenState createState() => _EstateFullAppScreenState();
}

class _EstateFullAppScreenState extends State<EstateFullAppScreen> {


  @override
  void initState() {
    super.initState();
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
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
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.estatePrimary.withAlpha(80))),
      child: Scaffold(
        body: FxBottomNavigationBar(

          activeTitleColor:AppTheme.customTheme.estatePrimary,
          activeContainerColor: AppTheme.customTheme.estatePrimary.withAlpha(50),
          fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
          containerShape: BoxShape.circle,
          showActiveLabel: false,
          showLabel: false,

          activeIconColor: AppTheme.customTheme.estatePrimary,
          iconColor: FxAppTheme.theme.colorScheme.onBackground.withAlpha(140),
          itemList: [

            FxBottomNavigationBarItem(
              page: EstateHomeScreen(),
              activeIconData: Icons.other_houses,
              iconData: Icons.other_houses_outlined,
              activeIconSize: 24,
              iconSize: 24,
            ),
            FxBottomNavigationBarItem(
                page: EstateSearchScreen(),
                activeIconData: Icons.search,
                iconData: Icons.search,
              activeIconSize: 24,
              iconSize: 24,
            ),
            FxBottomNavigationBarItem(
                page: EstateChatScreen(),
                activeIconData: Icons.chat,
                iconData: Icons.chat_outlined,
              activeIconSize: 22,
              iconSize: 24
            ),
            FxBottomNavigationBarItem(
                page: EstateProfileScreen(),
                activeIconData: Icons.person,
                iconData: Icons.person_outline,
              activeIconSize: 24,
              iconSize: 24,
            ),

          ],
        ),
      ),

    );
  }
}

