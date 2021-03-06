import 'package:UIKit/customapps/dating/controllers/dating_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/flutx.dart';
import 'package:flutx/utils/spacing.dart';

import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';

class DatingProfileScreen extends StatefulWidget {
  const DatingProfileScreen({Key? key}) : super(key: key);

  @override
  _DatingProfileScreenState createState() => _DatingProfileScreenState();
}

class _DatingProfileScreenState extends State<DatingProfileScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;

  late DatingProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore()
        .putOrFind<DatingProfileController>(DatingProfileController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow(String info, IconData icon) {
    return FxContainer(
      borderRadiusAll: 8,
      margin: FxSpacing.bottom(16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: customTheme.datingSecondary,
          ),
          FxSpacing.width(16),
          Expanded(
            child: FxText.caption(
              info,
              fontWeight: 600,
            ),
          ),
          FxSpacing.width(16),
          Icon(
            FeatherIcons.chevronDown,
            color: theme.colorScheme.onBackground,
            size: 16,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DatingProfileController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                    secondary: customTheme.datingPrimary.withAlpha(80))),
            child: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: FxSpacing.top(24),
              child: LoadingScreens.getSearchLoadingScreen(
                context,
                theme,
                customTheme,
              )));
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.sh1(
            'Profile',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Column(
          children: [
            FxContainer(
              borderRadiusAll: 8,
              margin: FxSpacing.fromLTRB(24, 4, 24, 0),
              paddingAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer.rounded(
                        paddingAll: 0,
                        margin: FxSpacing.right(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 72,
                          width: 72,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/dating/profile.jpg'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b2(
                            'Taylor Swift, 22',
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.caption(
                            'Project Manager, Cloud Infotech',
                            xMuted: true,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(4),
                          FxText.caption(
                            'Bangkok, Malaysia',
                            fontWeight: 600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(12),
                  Row(
                    children: [
                      FxContainer(
                        margin: FxSpacing.right(16),
                        child: FxText.overline(
                          'Travelling',
                          color: customTheme.datingPrimary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: 4,
                        color: customTheme.datingPrimary.withAlpha(30),
                      ),
                      FxContainer(
                        margin: FxSpacing.right(16),
                        child: FxText.overline(
                          'Diving',
                          color: customTheme.datingPrimary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: 4,
                        color: customTheme.datingPrimary.withAlpha(30),
                      ),
                      FxContainer(
                        margin: FxSpacing.right(16),
                        child: FxText.overline(
                          'Reading',
                          color: customTheme.datingPrimary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: 4,
                        color: customTheme.datingPrimary.withAlpha(30),
                      ),
                      FxContainer(
                        margin: FxSpacing.right(16),
                        child: FxText.overline(
                          'Trekking',
                          color: customTheme.datingPrimary,
                        ),
                        padding: FxSpacing.xy(8, 4),
                        borderRadiusAll: 4,
                        color: customTheme.datingPrimary.withAlpha(30),
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.overline(
                    'I\'m taylor from Texas. I am looking for special person also I want to meet different people and learn new things from different cultures and visit new places.',
                    xMuted: true,
                  ),
                ],
              ),
            ),
            Container(
              padding: FxSpacing.all(24),
              child: Column(
                children: [
                  _buildSingleRow('Detailed Info', FeatherIcons.alertCircle),
                  _buildSingleRow('Matches', FeatherIcons.heart),
                  _buildSingleRow('Profile Stats', FeatherIcons.activity),
                  _buildSingleRow('Notes', Icons.notes),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
