import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/medicare/medicare_chat_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_home_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_profile_screen.dart';
import 'package:UIKit/customapps/medicare/medicare_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutx/widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart';

class MediCareFullApp extends StatefulWidget {
  @override
  _MediCareFullAppState createState() => _MediCareFullAppState();
}

class _MediCareFullAppState extends State<MediCareFullApp> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.medicarePrimary.withAlpha(80))),
      child: Scaffold(
        body: FxBottomNavigationBar(
          containerDecoration: BoxDecoration(
              color: FxAppTheme.customTheme.bgLayer2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: AppTheme.customTheme.shadowColor.withAlpha(200),
                    offset: Offset(8, 0),
                    blurRadius: 8),
              ]),
          activeContainerColor: AppTheme.customTheme.medicarePrimary.withAlpha(30),
          fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
          showActiveLabel: false,
          showLabel: false,
          activeIconSize: 24,
          iconSize: 24,
          activeIconColor: AppTheme.customTheme.medicarePrimary,
          iconColor: FxAppTheme.theme.colorScheme.onBackground.withAlpha(140),
          itemList: [
            FxBottomNavigationBarItem(
              page: MediCareHomeScreen(),
              activeIconData: Icons.house,
              iconData: Icons.house_outlined,
            ),
            FxBottomNavigationBarItem(
              page: MediCareScheduleScreen(),
              activeIconData: Icons.date_range,
              iconData: Icons.date_range_outlined,
            ),
            FxBottomNavigationBarItem(
              page: MediCareChatScreen(),
              activeIconData: Icons.chat_bubble,
              iconData: Icons.chat_bubble_outline_rounded,
            ),
            FxBottomNavigationBarItem(
              page: MediCareProfileScreen(),
              activeIconData: Icons.person,
              iconData: Icons.person_outline_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
