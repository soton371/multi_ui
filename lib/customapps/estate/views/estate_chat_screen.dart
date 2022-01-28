import 'package:UIKit/customapps/estate/controllers/estate_chat_controller.dart';
import 'package:UIKit/customapps/estate/models/chat.dart';
import 'package:UIKit/customapps/estate/views/estate_single_chat_screen.dart';
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

class EstateChatScreen extends StatefulWidget {
  const EstateChatScreen({Key? key}) : super(key: key);

  @override
  _EstateChatScreenState createState() => _EstateChatScreenState();
}

class _EstateChatScreenState extends State<EstateChatScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;

  late EstateChatController estateChatController;

  @override
  void initState() {

    super.initState();
    estateChatController = FxControllerStore().putOrFind(EstateChatController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Chat chat in estateChatController.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat){
    return FxCard(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleChatScreen(chat)));
      },
      margin: FxSpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: 16,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.image),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: FxContainer.rounded(
                  paddingAll: 5,
                  child: Container(),
                  color: AppTheme.customTheme.groceryPrimary,
                ),
              )
            ],
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(
                  chat.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.caption(
                  chat.chat,
                  xMuted: chat.replied,
                  muted: !chat.replied,
                  fontWeight: chat.replied ? 400 : 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FxText.overline(
                chat.time,
                color: FxAppTheme.theme.colorScheme.onBackground,
                xMuted: true,
              ),

              chat.replied?FxSpacing.height(16):FxContainer.rounded(
                paddingAll: 6,
                color: AppTheme.customTheme.estatePrimary,
                child: FxText.overline(
                  chat.messages,
                  color: AppTheme.customTheme.estateOnPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateChatController>(
        controller: estateChatController,
        builder: (estateHomeController){
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
                      child: estateHomeController.showLoading?LinearProgressIndicator(
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
    if(estateChatController.uiLoading){
      return Container( margin: FxSpacing.top(16),
          child: LoadingScreens.getSearchLoadingScreen(
            context, theme, customTheme,
          ));
    }else{
      return ListView(
        padding: FxSpacing.horizontal(24,),
        children: [
          FxSpacing.height(16),
          Center(
            child: FxText.b1(
              'Chats',
              fontWeight: 700,
            ),
          ),
          FxSpacing.height(16),
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search your agent',
            focusedBorderColor: AppTheme.customTheme.estatePrimary,
            cursorColor: AppTheme.customTheme.estatePrimary,
            labelStyle: FxTextStyle.caption(
                color: FxAppTheme.theme.colorScheme.onBackground, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: AppTheme.customTheme.estatePrimary.withAlpha(40),
            suffixIcon: Icon(
              FeatherIcons.search,
              color: AppTheme.customTheme.estatePrimary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      );
    }
  }
}

