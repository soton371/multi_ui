import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatProfileScreen extends StatefulWidget {
  @override
  _ChatProfileScreenState createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      size: MySize.size24,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(
                    "Account",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 24, 0),
                        child: Text(
                          "REQUESTS",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              letterSpacing: 0.4,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(0, 16, 0, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: Spacing.left(24),
                                child: singleRequest(
                                    option: "Block",
                                    image: './assets/images/avatar-1.jpg',
                                    name: "Sohaib Sumner",
                                    status: "Unknown"),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                child: singleRequest(
                                    option: "Accept",
                                    image: './assets/images/avatar-3.jpg',
                                    name: "Donald Diaz",
                                    status: "3 Friend Mutual"),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                child: singleRequest(
                                    option: "Accept",
                                    image: './assets/images/avatar-4.jpg',
                                    name: "Emilis Fuller",
                                    status: "8 Friend Mutual"),
                              ),
                              Container(
                                margin: Spacing.fromLTRB(16,0,24,0),
                                child: singleRequest(
                                    option: "Accept",
                                    image: './assets/images/avatar-5.jpg',
                                    name: "Farrah Smyth",
                                    status: "1 Friend Mutual"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 24, 0),
                        child: Text(
                          "SETTING",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              letterSpacing: 0.4,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 24, 0),
                        child: Row(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size26!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/avatar-2.jpg'),
                                  width: MySize.size52,
                                  height: MySize.size52,
                                ),
                              ),
                            ),
                            Container(
                              margin: Spacing.left(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rami Wheatley",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "I'm using FlutKit",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 500),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                MdiIcons.accountOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Account",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                  Text(
                                    "Privacy, security, change number",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        muted: true,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.messageTextOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chats",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                  Text(
                                    "Theme, wallpapers, chat history",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        muted: true,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.bellOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notifications",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                  Text(
                                    "Message, group, call tones",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        muted: true,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.helpCircleOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Help",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                  Text(
                                    "FAQ, contact us",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        fontWeight: 500,
                                        letterSpacing: 0,
                                        muted: true,
                                        color: themeData
                                            .colorScheme.onBackground),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.logoutVariant,
                                color: themeData.colorScheme.onBackground,
                              ),
                              title: Text(
                                "Logout",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 600,
                                    letterSpacing: 0,
                                    color:
                                        themeData.colorScheme.onBackground),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleRequest(
      {required String image, required String name, required String status, required String option}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: customAppTheme.bgLayer4, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
      padding: Spacing.all(16),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size26!)),
              child: Image(
                image: AssetImage(image),
                height: MySize.size52,
                width: MySize.size52,
              )),
          Container(
            margin: Spacing.top(8),
            child: Text(
              name,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground, fontWeight: 600),
            ),
          ),
          Text(
            status,
            style: AppTheme.getTextStyle(themeData.textTheme.caption,
                color: themeData.colorScheme.onBackground,
                fontWeight: 500,
                muted: true),
          ),
          Container(
            padding: Spacing.fromLTRB(10, 6, 10, 6),
            margin: Spacing.top(8),
            decoration: BoxDecoration(
                border: Border.all(color: customAppTheme.bgLayer4, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(MySize.size16!))),
            child: Text(
              option,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground, fontWeight: 500),
            ),
          )
        ],
      ),
    );
  }
}
