import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ChatCreateGroupScreen extends StatefulWidget {
  @override
  _ChatCreateGroupScreenState createState() => _ChatCreateGroupScreenState();
}

class _ChatCreateGroupScreenState extends State<ChatCreateGroupScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<bool> _list;

  @override
  void initState() {
    super.initState();
    _list = List.generate(6, (index) => false);
  }

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
                    child: Column(
                      children: [
                        Container(
                          margin: Spacing.fromLTRB(24, 44, 24, 0),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: themeData.colorScheme.onBackground,
                                    size: MySize.size24,
                                  )),
                              Container(
                                margin: Spacing.left(16),
                                child: Text(
                                  "Create Group",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      color:
                                          themeData.colorScheme.onBackground,
                                      fontWeight: 700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(24, 16, 24, 0),
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.background,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!))),
                          padding: Spacing.all(6),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin:
                                      EdgeInsets.only(left: MySize.size16!),
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8!),
                                          ),
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8!),
                                          ),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8!),
                                          ),
                                          borderSide: BorderSide.none),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(MySize.size4!),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primary,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size8!))),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size8!),
                                  child: Icon(
                                    MdiIcons.magnify,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: Spacing.fromLTRB(24, 0, 24, 0),
                            child: ListView(
                              padding: Spacing.zero,
                              children: [
                                singleContact(
                                    clickedOption: "Added",
                                    index: 3,
                                    image: './assets/images/avatar-4.jpg',
                                    name: 'Andrei Ratcliffe',
                                    option: "Add",
                                    isActive: true,
                                    status: "2 Mutual groups"),
                                singleContact(
                                    clickedOption: "Added",
                                    index: 4,
                                    image: './assets/images/avatar-5.jpg',
                                    name: 'Lowri Gould',
                                    option: "Add",
                                    status: "3 Mutual groups"),
                                singleContact(
                                    clickedOption: "Added",
                                    index: 5,
                                    image: './assets/images/avatar.jpg',
                                    name: 'Samson Bains',
                                    option: "Add",
                                    isActive: true,
                                    status: "1 Mutual group"),
                                singleContact(
                                    clickedOption: "Invited",
                                    index: 0,
                                    image: './assets/images/avatar-2.jpg',
                                    isActive: true,
                                    name: 'Reanne Dudley',
                                    option: "Invite",
                                    status: "3 Mutual friends"),
                                singleContact(
                                    clickedOption: "Invited",
                                    index: 1,
                                    image: './assets/images/avatar-1.jpg',
                                    name: 'Calista Garcia',
                                    option: "Invite",
                                    status: "8 Mutual friends"),
                                singleContact(
                                    clickedOption: "Invited",
                                    index: 2,
                                    image: './assets/images/avatar-3.jpg',
                                    name: 'Samson Bains',
                                    option: "Invite",
                                    status: "Unknown"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer1,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(MySize.size16!),
                                  topRight: Radius.circular(MySize.size16!)),
                              boxShadow: [
                                BoxShadow(
                                    color: customAppTheme.shadowColor,
                                    blurRadius: MySize.size4!)
                              ],
                              border:
                                  Border.all(color: customAppTheme.bgLayer3)),
                          padding: Spacing.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    singleOption(
                                        option: "Profile",
                                        iconData: MdiIcons.imageOutline),
                                    singleOption(
                                        option: "Setting",
                                        iconData: MdiIcons.cogOutline),
                                    singleOption(
                                        option: "Copy",
                                        iconData: MdiIcons.contentCopy),
                                  ],
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: customAppTheme.bgLayer3,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size8!))),
                                          padding: Spacing.all(6),
                                          child: TextFormField(
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                letterSpacing: 0,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                            decoration: InputDecoration(
                                              hintText: "Group Name",
                                              hintStyle:
                                                  AppTheme.getTextStyle(
                                                      themeData.textTheme
                                                          .bodyText2,
                                                      letterSpacing: 0,
                                                      color: themeData
                                                          .colorScheme
                                                          .onBackground,
                                                      fontWeight: 500),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        MySize.size8!),
                                                  ),
                                                  borderSide:
                                                      BorderSide.none),
                                              enabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            MySize.size8!),
                                                      ),
                                                      borderSide:
                                                          BorderSide.none),
                                              focusedBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                            MySize.size8!),
                                                      ),
                                                      borderSide:
                                                          BorderSide.none),
                                              isDense: true,
                                              contentPadding:
                                                  Spacing.fromLTRB(
                                                      8, 8, 8, 8),
                                            ),
                                            textInputAction:
                                                TextInputAction.search,
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.left(16),
                                      child: Container(
                                        height: MySize.size44,
                                        width: MySize.size44,
                                        child: FloatingActionButton(
                                            onPressed: () {},
                                            child: Container(
                                              padding: Spacing.all(4),
                                              child: Icon(MdiIcons.check,
                                                  color: themeData
                                                      .colorScheme.onPrimary),
                                            ),
                                          backgroundColor: themeData.colorScheme.primary,
                                          mini: true,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }

  Widget singleContact(
      {required String image,
      required int index,
      required String name,
      required String status,
      String? option,
      String? clickedOption,
      bool isActive = false}) {
    return Container(
      margin: Spacing.top(16),
      child: InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size24!)),
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size44,
                    width: MySize.size44,
                    fit: BoxFit.cover,
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
                margin: Spacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Text(
                      status,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(160),
                          fontWeight: 600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: Container(
                padding: Spacing.fromLTRB(12, 8, 12, 8),
                decoration: _list[index]
                    ? BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size32!)),
                        border: Border.all(
                          color: customAppTheme.bgLayer3,
                        ))
                    : BoxDecoration(
                        color: customAppTheme.bgLayer3,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size32!))),
                child: Text(
                  _list[index] ? clickedOption! : option!,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600,
                      letterSpacing: 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Container(
                padding: EdgeInsets.all(MySize.size24!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NAME",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 12,
                                fontWeight: 700,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0.5),
                          ),
                          Text(
                            "Elysia Baldwin",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CITY",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 12,
                                fontWeight: 700,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0.5),
                          ),
                          Text(
                            "Dubai",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EMAIL",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 12,
                                fontWeight: 700,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0.5),
                          ),
                          Text(
                            "elysin12@gmail.com",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NUMBER",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 12,
                                fontWeight: 700,
                                muted: true,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0.5),
                          ),
                          Text(
                            "(91) 9876543210",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                            ),
                            onPressed: () {},
                            child: Text(
                              "Add to Group",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onPrimary),
                            ),
                          ),
                          TextButton(

                            onPressed: () {},
                            child: Text(
                              "Cancel Request",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget singleOption({IconData? iconData, required String option}) {
    return Container(
      width: (MySize.safeWidth! - 120 )/3,
      padding: Spacing.all(16),
      decoration: BoxDecoration(
          color: themeData.colorScheme.primary.withAlpha(36),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: Column(
        children: [
          Icon(
            iconData,
            color: themeData.colorScheme.primary,
            size: MySize.size22,
          ),
          Container(
            margin: Spacing.top(8),
            child: Text(
              option,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.primary, fontWeight: 500),
            ),
          )
        ],
      ),
    );
  }
}
