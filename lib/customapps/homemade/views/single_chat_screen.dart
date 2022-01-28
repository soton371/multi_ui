import 'package:UIKit/customapps/homemade/controllers/single_chat_controller.dart';
import 'package:UIKit/customapps/homemade/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';

class SingleChatScreen extends StatefulWidget {

  final Chat chat;
  const SingleChatScreen(this.chat);
  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;
  late SingleChatController singleChatController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    singleChatController =
        FxControllerStore().putOrFind(SingleChatController(widget.chat));
  }

  Widget _buildReceiveMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FxCard(
              //color: AppTheme.customTheme.medicarePrimary.withAlpha(40),
              margin: FxSpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.caption(
                    message!,
                    color: FxAppTheme.theme.colorScheme.onBackground,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.overline(
                      time!,
                      color: FxAppTheme.theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxCard(
              color: AppTheme.customTheme.homemadePrimary,
              margin: FxSpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.caption(
                    message!,
                    color: AppTheme.customTheme.homemadeOnPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.overline(
                      time!,
                      color: AppTheme.customTheme.homemadeOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleChatController>(
        controller: singleChatController,
        builder: (singleChatController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                    AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child:_buildBody(),
          );
        });
  }

  Widget _buildBody() {
    if (singleChatController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: FxSpacing.top(16),
            child: LoadingScreens.getSearchLoadingScreen(
              context,
              theme,
              customTheme,
            )),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(32),
          child: Column(
            children: [
              FxContainer(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FeatherIcons.chevronLeft,
                            size: 20,
                            color: FxAppTheme.theme.colorScheme.onBackground,
                          ),
                          FxSpacing.width(4),
                          FxContainer.rounded(
                            paddingAll: 0,
                            child: Image(
                              width: 40,
                              height: 40,
                              image: AssetImage(singleChatController.chat.url,),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),

                    ),
                    FxSpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b2(
                            singleChatController.chat.name,
                            fontWeight: 600,
                          ),
                          FxSpacing.height(2),
                          Row(
                            children: [
                              FxContainer.rounded(
                                paddingAll: 3,
                                color: AppTheme.customTheme.groceryPrimary,
                                child: Container(),
                              ),
                              FxSpacing.width(4),
                              FxText.caption(
                                'Online',
                                color: FxAppTheme.theme.colorScheme.onBackground,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.width(16),
                    FxContainer.rounded(
                        color: AppTheme.customTheme.homemadePrimary,
                        paddingAll: 8,
                        child: Icon(
                          Icons.videocam_rounded,
                          color: AppTheme.customTheme.homemadeOnPrimary,
                          size: 16,
                        )),
                    FxSpacing.width(8),
                    FxContainer.rounded(
                      color: AppTheme.customTheme.homemadePrimary,
                      paddingAll: 8,
                      child: Icon(
                        Icons.call,
                        color: AppTheme.customTheme.homemadeOnPrimary,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                    children: [
                      _buildReceiveMessage(
                          message: 'Yes, What help do you need?', time: '08:25'),
                      FxSpacing.height(16),
                      _buildSendMessage(
                          message: 'Should I come to hospital tomorrow?',
                          time: '08:30'),
                      FxSpacing.height(16),
                      _buildReceiveMessage(
                          message: 'Yes sure, you can come after 2:00 pm',
                          time: '08:35'),
                      FxSpacing.height(16),
                      _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
                      FxSpacing.height(24),
                    ],
                  )),
              FxContainer(
                marginAll: 24,
                paddingAll: 0,
                child: FxTextField(
                  focusedBorderColor: AppTheme.customTheme.homemadePrimary,
                  cursorColor: AppTheme.customTheme.homemadePrimary,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  labelText: 'Type Something ...',
                  labelStyle: FxTextStyle.caption(
                      color: FxAppTheme.theme.colorScheme.onBackground,
                      xMuted: true),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: FxAppTheme.customTheme.bgLayer2,
                  suffixIcon: Icon(
                    FeatherIcons.send,
                    color: AppTheme.customTheme.homemadePrimary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

