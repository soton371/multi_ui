import 'package:UIKit/customapps/medicare/medicare_single_chat_screen.dart';
import 'package:UIKit/customapps/medicare/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import '../../AppTheme.dart';

class MediCareChatScreen extends StatefulWidget {
  const MediCareChatScreen({Key? key}) : super(key: key);

  @override
  _MediCareChatScreenState createState() => _MediCareChatScreenState();
}

class _MediCareChatScreenState extends State<MediCareChatScreen> {
  List<Chat> chatList=[];

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (int i = 0; i < chatList.length; i++) {
      list.add(_buildSingleChat(chatList[i]));
    }
    return list;
  }


  Widget _buildSingleChat(Chat chat){
  return FxCard(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MediCareSingleChatScreen(chat)));
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
              color: AppTheme.customTheme.medicarePrimary,
              child: FxText.overline(
                chat.messages,
                color: AppTheme.customTheme.medicareOnPrimary,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatList=Chat.chatList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: FxText.b1(
          'Chats',
          fontWeight: 700,
          letterSpacing: 0.5,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: FxSpacing.horizontal(24,),
        children: [
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search, e.g. Dr',
            focusedBorderColor: AppTheme.customTheme.medicarePrimary,
            cursorColor: AppTheme.customTheme.medicarePrimary,
            labelStyle: FxTextStyle.caption(
                color: FxAppTheme.theme.colorScheme.onBackground, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
            suffixIcon: Icon(
              FeatherIcons.search,
              color: AppTheme.customTheme.medicarePrimary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      ),
    );
  }
}
