import 'package:UIKit/AppTheme.dart';
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


class MediCareSingleChatScreen extends StatefulWidget {
  final Chat chat;

  const MediCareSingleChatScreen(this.chat);

  @override
  _MediCareSingleChatScreenState createState() =>
      _MediCareSingleChatScreenState();
}

class _MediCareSingleChatScreenState extends State<MediCareSingleChatScreen> {
  late Chat chat;

  Widget _buildReceiveMessage({String? message, String? time}){
    return  Padding(
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

  Widget _buildSendMessage({String? message, String? time}){
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxCard(
              color: AppTheme.customTheme.medicarePrimary,
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
                    color: AppTheme.customTheme.medicareOnPrimary,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.overline(
                      time!,
                      color:AppTheme.customTheme.medicareOnPrimary,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    chat = widget.chat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: FxSpacing.top(28),
        child: Column(
          children: [
            FxContainer(
              child: Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: FxAppTheme.theme.colorScheme.onBackground,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  FxSpacing.width(8),
                  FxContainer.rounded(
                    paddingAll: 0,
                    child: Image(
                      width: 40,
                      height: 40,
                      image: AssetImage(chat.image),
                    ),
                  ),
                  FxSpacing.width(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b2(
                          chat.name,
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
                      color: AppTheme.customTheme.medicarePrimary,
                      paddingAll: 8,
                      child: Icon(
                        Icons.videocam_rounded,
                        color: AppTheme.customTheme.medicareOnPrimary,
                        size: 16,
                      )),
                  FxSpacing.width(8),
                  FxContainer.rounded(
                    color: AppTheme.customTheme.medicarePrimary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.call,
                      color: AppTheme.customTheme.medicareOnPrimary,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            FxContainer(
              margin: FxSpacing.horizontal(40),
              borderRadiusAll: 8,
              color: AppTheme.customTheme.medicarePrimary.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_later,
                    color: AppTheme.customTheme.medicarePrimary,
                    size: 20,
                  ),
                  FxSpacing.width(8),
                  FxText.caption(
                    'Sun, Jan 19, 08:00am - 10:00am',
                    color: AppTheme.customTheme.medicarePrimary,
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),

            Expanded(child: ListView(

              children: [
                _buildReceiveMessage(message: 'Yes, What help do you need?',time: '08:25'),

                FxSpacing.height(16),
                _buildSendMessage(message: 'Should I come to hospital tomorrow?',time: '08:30'),

                FxSpacing.height(16),
                _buildReceiveMessage(message: 'Yes sure, you can come after 2:00 pm',time: '08:35'),
                FxSpacing.height(16),

                _buildSendMessage(message: 'Sure, Thank you!!',time: '08:40'),

                FxSpacing.height(24),


              ],
            )),

            FxContainer(
              marginAll: 24,
              paddingAll: 0,
              child: FxTextField(
                focusedBorderColor: AppTheme.customTheme.medicarePrimary,
                cursorColor: AppTheme.customTheme.medicarePrimary,
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
                  color: AppTheme.customTheme.medicarePrimary,
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
