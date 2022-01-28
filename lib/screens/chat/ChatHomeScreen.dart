import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/chat/ChatContactScreen.dart';
import 'package:UIKit/screens/chat/ChatCreateGroupScreen.dart';
import 'package:UIKit/screens/chat/ChatProfileScreen.dart';
import 'package:UIKit/screens/chat/ChatScreen.dart';
import 'package:UIKit/utils/FullImageScreen.dart';
import 'package:UIKit/utils/Generator.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatHomeScreen extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
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
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: Spacing.zero,
                      children: <Widget>[
                        Container(
                          color: themeData.colorScheme.primary,
                          padding: Spacing.fromLTRB(0, 42, 0, 32),
                          child: ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            children: <Widget>[
                              Container(
                                margin: Spacing.left(32),
                                child: Text(
                                  "Chats",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 700),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: Spacing.left(24),
                                        child: singleOption(
                                            title: "New Chat",
                                            navigation: ChatContactScreen(),
                                            icon: MdiIcons.plus),
                                      ),
                                      Container(
                                        margin: Spacing.left(24),
                                        child: singleOption(
                                            title: "Groups",
                                            navigation: ChatCreateGroupScreen(),
                                            icon: MdiIcons
                                                .accountMultipleOutline),
                                      ),
                                      Container(
                                        margin: Spacing.horizontal(24),
                                        child: singleOption(
                                            title: "Account",
                                            navigation: ChatProfileScreen(),
                                            icon: MdiIcons.accountOutline),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: themeData.colorScheme.primary,
                          child: Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(MySize.size16!),
                                    topRight: Radius.circular(MySize.size16!))),
                            padding: Spacing.all(24),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.background,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!))),
                                  padding: Spacing.all(6),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size16!),
                                          child: TextFormField(
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                letterSpacing: 0,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                            decoration: InputDecoration(
                                              hintText: "Search messages",
                                              hintStyle: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  letterSpacing: 0,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide: BorderSide.none),
                                              isDense: true,
                                              contentPadding: EdgeInsets.all(0),
                                            ),
                                            textInputAction:
                                                TextInputAction.search,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(MySize.size4!),
                                        decoration: BoxDecoration(
                                            color:
                                                themeData.colorScheme.primary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size8!))),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size8!),
                                          child: Icon(
                                            MdiIcons.magnify,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: MySize.size20,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: Spacing.top(24),
                                  child: singleChat(
                                      image: './assets/images/avatar-1.jpg',
                                      time: "12:34 AM",
                                      badgeNumber: "2",
                                      message: Generator.getDummyText(5),
                                      isNew: true,
                                      name: "Alice Henry",
                                      isActive: true),
                                ),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/avatar-4.jpg',
                                    time: "8:12 PM",
                                    message: Generator.getDummyText(5),
                                    isNew: true,
                                    badgeNumber: "4",
                                    name: "Jevon Shah"),

                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/avatar-3.jpg',
                                    isNew: false,
                                    time: "5:30 AM",
                                    message: Generator.getDummyText(5),
                                    name: "Susie Salter"),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/avatar-2.jpg',
                                    isNew: false,
                                    time: "1:24 PM",
                                    message: Generator.getDummyText(5),
                                    name: "Kaylen Lamb",
                                    isActive: true),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/avatar-5.jpg',
                                    isNew: false,
                                    time: "7:10 AM",
                                    message: Generator.getDummyText(5),
                                    name: "Joey Callaghan",
                                    isActive: true),
                                Container(
                                    margin: Spacing.vertical(16),
                                    child: Divider(
                                      height: 0,
                                    )),
                                singleChat(
                                    image: './assets/images/avatar.jpg',
                                    isNew: false,
                                    time: "7:10 AM",
                                    message: Generator.getDummyText(5),
                                    name: "Joel Holman"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  void _showFullImage(String imagePath,String imageTag){
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            FullImageScreen(imagePath: imagePath,imageTag: imageTag, backgroundOpacity: 200,)));
  }

  Widget singleChat(
      {required String image,
      required String name,
      required String message,
      required String time,
      String? badgeNumber,
      bool isNew = false,
      bool isActive = false}) {

    String tag = image+name;

    Widget badgeWidget = badgeNumber == null
        ? Container()
        : Container(
            padding: Spacing.all(6),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary, shape: BoxShape.circle),
            child: Text(
              badgeNumber,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontSize: 12, color: themeData.colorScheme.onPrimary),
            ),
          );

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatScreen()));
      },

      child: Container(
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size26!)),
                  child: InkWell(
                    onTap: (){
                      _showFullImage(image, tag);
                    },
                    child: Hero(
                      tag: tag,
                      transitionOnUserGestures: true,
                      child: Image(
                        image: AssetImage(image),
                        height: MySize.size52,
                        width: MySize.size52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: customAppTheme.bgLayer1, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: MySize.size8,
                            height: MySize.size8,
                            decoration: BoxDecoration(
                                color: customAppTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: isNew ? 600 : 500),
                    ),
                    Text(
                      message,
                      style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: isNew ? 600 : 500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: Spacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    time,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: -0.2,
                        fontWeight: isNew ? 600 : 500),
                  ),
                  badgeWidget
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleOption({IconData? icon, required String title,Widget? navigation}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => navigation!));
      },
      child: Container(
        width: MySize.size120,
        decoration: BoxDecoration(
            color: themeData.colorScheme.onPrimary.withAlpha(90),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
        padding: Spacing.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
                  color: themeData.colorScheme.onPrimary),
              padding: Spacing.all(2),
              child: Icon(
                icon,
                size: MySize.size18,
                color: themeData.colorScheme.primary,
              ),
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
