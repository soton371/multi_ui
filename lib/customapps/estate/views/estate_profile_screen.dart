import 'package:UIKit/customapps/estate/controllers/estate_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';

class EstateProfileScreen extends StatefulWidget {
  const EstateProfileScreen({Key? key}) : super(key: key);

  @override
  _EstateProfileScreenState createState() => _EstateProfileScreenState();
}

class _EstateProfileScreenState extends State<EstateProfileScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;

  late EstateProfileController estateProfileController;

  @override
  void initState() {

    super.initState();
    estateProfileController = FxControllerStore().putOrFind(EstateProfileController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        FxContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: FxAppTheme.theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: AppTheme.customTheme.estatePrimary,
            size: 20,
          ),
        ),
        FxSpacing.width(16),
        Expanded(
          child: FxText.caption(
            title!,
            letterSpacing: 0.5,
          ),
        ),
        FxSpacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: FxAppTheme.theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateProfileController>(
        controller: estateProfileController,
        builder: (estateProfileController){
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary: AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: 2,
                      child: estateProfileController.showLoading?LinearProgressIndicator(
                        color: AppTheme.customTheme.estatePrimary,
                        minHeight: 2,
                      ):Container(
                        height: 2,
                      ),
                    ),
                    Expanded(child: _buildBody(),),
                  ],
                ),
              ),
            ),
          );
        });
  }
  Widget _buildBody(){
    if(estateProfileController.uiLoading){
      return Container( margin: FxSpacing.top(16),
          child: LoadingScreens.getSearchLoadingScreen(
            context, theme, customTheme,
          ));
    }else{
      return  ListView(
        padding: FxSpacing.all(24),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios,
              color: FxAppTheme.theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
          FxSpacing.height(24),
          Center(
            child: FxContainer(
              paddingAll: 0,
              borderRadiusAll: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/avatar-4.jpg'),
                ),
              ),
            ),
          ),
          FxSpacing.height(24),
          FxText.h6(
            'Bessie Cooper',
            textAlign: TextAlign.center,
            fontWeight: 600,
            letterSpacing: 0.8,
          ),
          FxSpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FxContainer.rounded(
                color: AppTheme.customTheme.estatePrimary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              FxSpacing.width(6),
              FxText.button(
                'Premium (9 days)',
                color: AppTheme.customTheme.estatePrimary,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          FxSpacing.height(24),
          FxText.caption(
            'General',
            color: FxAppTheme.theme.colorScheme.onBackground,
            xMuted: true,
          ),
          FxSpacing.height(24),
          _buildSingleRow(
              title: 'Subscription & payment', icon: FeatherIcons.creditCard),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Profile settings', icon: FeatherIcons.user),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Password', icon: FeatherIcons.lock),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Notifications', icon: FeatherIcons.bell),
          FxSpacing.height(8),
          Divider(),
          FxSpacing.height(8),
          _buildSingleRow(title: 'Logout', icon: FeatherIcons.logOut),
        ],
      );
    }
  }
}

