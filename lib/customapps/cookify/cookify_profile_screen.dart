import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/cookify_splash_screen.dart';
import 'package:UIKit/customapps/cookify/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

class CookifyProfileScreen extends StatefulWidget {
  @override
  _CookifyProfileScreenState createState() => _CookifyProfileScreenState();
}

class _CookifyProfileScreenState extends State<CookifyProfileScreen> {
  late User user;

  bool notification = true, offlineReading = false;

  @override
  void initState() {
    super.initState();
    user = User.getOne();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 36, 24, 24),
          children: [
            FxCard(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(user.image),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  FxSpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b1(
                          user.name,fontWeight: 700
                        ),
                        FxSpacing.width(8),
                        FxText.b2(
                          user.email,
                        ),
                        FxSpacing.height(8),
                        FxButton.outlined(
                            onPressed: () {},
                            splashColor: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                            borderColor: AppTheme.customTheme.cookifyPrimary,
                            padding: FxSpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: FxText.caption(
                              "Edit profile",color: AppTheme.customTheme.cookifyPrimary

                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(24),
            FxCard(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.sh1(
                  "Option",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: AppTheme.customTheme.cookifyPrimary.withAlpha(100),
                  activeTrackColor:
                      AppTheme.customTheme.cookifyPrimary.withAlpha(150),
                  activeColor: AppTheme.customTheme.cookifyPrimary,
                  title: FxText.b2(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      notification = value;
                    });
                  },
                  value: notification,
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Language",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppTheme.theme.colorScheme.onBackground,
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: AppTheme.customTheme.cookifyPrimary.withAlpha(100),
                  activeTrackColor:
                      AppTheme.customTheme.cookifyPrimary.withAlpha(150),
                  activeColor: AppTheme.customTheme.cookifyPrimary,
                  title: FxText.b2(
                    "Offline Reading",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      offlineReading = value;
                    });
                  },
                  value: offlineReading,
                ),
                Divider(
                  thickness: 0.8,
                ),
                FxSpacing.height(8),
                FxText.sh1(
                  "Account",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Personal Information",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppTheme.theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Country",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppTheme.theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Favorite Recipes",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppTheme.theme.colorScheme.onBackground,
                  ),
                ),
                FxSpacing.height(16),
                Center(
                    child: FxButton.rounded(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CookifySplashScreen()),
                    );
                  },
                  child: FxText.button(
                    "LOGOUT",
                    color: AppTheme.customTheme.cookifyOnPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.5,
                  ),
                  elevation: 2,
                  backgroundColor: AppTheme.customTheme.cookifyPrimary,
                ))
              ],
            )),
            FxSpacing.height(24),
            FxContainer(
                color: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                padding: FxSpacing.xy(16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FxTwoToneIcon(
                      FxTwoToneMdiIcons.headset_mic,
                      size: 32,
                      color: AppTheme.customTheme.cookifyPrimary,
                    ),
                    FxSpacing.width(12),
                    FxText.caption(
                      "Feel Free to Ask, We Ready to Help",
                      color: AppTheme.customTheme.cookifyPrimary,
                      letterSpacing: 0,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
