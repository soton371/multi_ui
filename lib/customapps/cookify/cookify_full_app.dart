import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/cookify_home_screen.dart';
import 'package:UIKit/customapps/cookify/cookify_meal_plan_screen.dart';
import 'package:UIKit/customapps/cookify/cookify_profile_screen.dart';
import 'package:UIKit/customapps/cookify/cookify_showcase_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';

class CookifyFullApp extends StatefulWidget {
  @override
  _CookifyFullAppState createState() => _CookifyFullAppState();
}

class _CookifyFullAppState extends State<CookifyFullApp> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.cookifyPrimary)),
      child: Scaffold(
        body: FxBottomNavigationBar(
          activeTitleStyle: FxTextStyle.caption(
              color: AppTheme.customTheme.cookifyPrimary, fontWeight: 800),
          itemList: [
            FxBottomNavigationBarItem(
              page: CookifyHomeScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.home,
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.cottage,
                color: AppTheme.customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Home",
              activeIconColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxBottomNavigationBarItem(
              page: CookifyShowcaseScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.import_contacts,
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(240),
                size: 24,
              ),
              title: "Showcase",
              activeIconColor: AppTheme.customTheme.cookifyPrimary,
              activeTitleColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxBottomNavigationBarItem(
              page: CookifyMealPlanScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.fastfood,
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.lunch_dining,
                color: AppTheme.customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Meal",
              activeIconColor: AppTheme.customTheme.cookifyPrimary,
              activeTitleColor: AppTheme.customTheme.cookifyPrimary,
            ),
            FxBottomNavigationBarItem(
              page: CookifyProfileScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.person,
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(240),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person,
                color: AppTheme.customTheme.cookifyPrimary,
                size: 24,
              ),
              title: "Setting",
              activeIconColor: AppTheme.customTheme.cookifyPrimary,
              activeTitleColor: AppTheme.customTheme.cookifyPrimary,
            ),
          ],
          activeContainerColor: FxAppTheme.theme.primaryColor.withAlpha(100),
          fxBottomNavigationBarType: FxBottomNavigationBarType.normal,
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          showLabel: false,
          labelSpacing: 8,
          initialIndex: 0,
          labelDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
