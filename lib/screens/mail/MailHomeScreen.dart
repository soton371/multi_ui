/*
* File : Mail Home
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'MailComposeScreen.dart';
import 'MailContentScreen.dart';

class MailHomeScreen extends StatefulWidget {
  @override
  _MailHomeScreenState createState() => _MailHomeScreenState();
}

class SingleMail {
  String name, title, message, date;
  bool isRead;

  SingleMail(this.name, this.title, this.message, this.date, this.isRead);
}

class _MailHomeScreenState extends State<MailHomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late ThemeData themeData;

  late List<SingleMail> _mailList;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _mailList = [
      SingleMail("BookMyShow", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "21 April", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "22 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "19 Feb", false),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "17 April", true),
      SingleMail("Lourensa", "#stayinhome challenge is back",
          "this is dummy mail content", "15 May", false),
      SingleMail("Codeforces", "#stayinhome challenge is back",
          "this is dummy mail content", "13 Jan", true),
      SingleMail("Flutter", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", true),
      SingleMail("Google", "#stayinhome challenge is back",
          "this is dummy mail content", "30 April", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "25 May", true),
      SingleMail("Google Trends", "#stayinhome challenge is back",
          "this is dummy mail content", "28 May", false),
      SingleMail("Dribble", "#stayinhome challenge is back",
          "this is dummy mail content", "27 Feb", true),
      SingleMail("Coursera", "#stayinhome challenge is back",
          "this is dummy mail content", "14 May", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            key: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              backgroundColor: themeData.colorScheme.background,
              key: _scaffoldKey,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return MailComposeScreen();
                      },
                      fullscreenDialog: true));
                },
                child: Icon(
                  Icons.add,
                  size: MySize.size32,
                  color: themeData.colorScheme.onPrimary,
                ),
                backgroundColor: themeData.colorScheme.primary,
                elevation: 4,
              ),
              drawer: Drawer(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    /*---------- Drawer Header ----------------*/
                    Expanded(
                      flex: 2,
                      child: DrawerHeader(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MySize.size16!,
                                bottom: MySize.size8!,
                                right: MySize.size16!),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          new Container(
                                            width: MySize.size60,
                                            height: MySize.size60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/avatar-2.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          new Container(
                                            width: MySize.size40,
                                            height: MySize.size40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/avatar-1.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          new Container(
                                            margin: EdgeInsets.only(
                                                left: MySize.size16!),
                                            width: MySize.size40,
                                            height: MySize.size40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  image: AssetImage(
                                                      "./assets/images/avatar.jpg"),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Taslima Beattie",
                                        style: themeData.textTheme.headline6!
                                            .merge(TextStyle(
                                                    color: themeData
                                                        .colorScheme
                                                        .onPrimary)
                                                .merge(TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)))),
                                    Text("tas@gmail.com",
                                        style: themeData.textTheme.bodyText2!
                                            .merge(TextStyle(
                                                    color: themeData
                                                        .colorScheme
                                                        .onPrimary)
                                                .merge(TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400))))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        decoration:
                            BoxDecoration(color: themeData.primaryColor),
                      ),
                    ),

                    /*------------- Drawer Content -------------*/
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: themeData.backgroundColor,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MySize.size8!),
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: <Widget>[
                              singleDrawerItem(
                                  MdiIcons.inbox, "All Inboxes", 0),
                              Divider(
                                height: 1,
                                color: themeData.dividerColor,
                                thickness: 1,
                              ),
                              singleDrawerItem(
                                  MdiIcons.emailOutline, "Primary", 1),
                              singleDrawerItem(
                                  MdiIcons.accountGroupOutline, "Social", 2),
                              singleDrawerItem(
                                  MdiIcons.tagOutline, "Promotion", 3),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MySize.size12!, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size12!),
                                child: Text("ALL LABELS",
                                    style: themeData.textTheme.caption!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(240),
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.35,
                                            wordSpacing: 1.2))),
                              ),
                              singleDrawerItem(
                                  MdiIcons.starOutline, "Starred", 4),
                              singleDrawerItem(
                                  MdiIcons.clockOutline, "Snoozed", 5),
                              singleDrawerItem(MdiIcons.send, "Sent", 6),
                              singleDrawerItem(
                                  MdiIcons.fileOutline, "Drafts", 7),
                              singleDrawerItem(MdiIcons.emailMultipleOutline,
                                  "All Mail", 8),
                              singleDrawerItem(
                                  MdiIcons.alertOctagonOutline, "Spam", 9),
                              singleDrawerItem(
                                  MdiIcons.trashCanOutline, "Bin", 10),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MySize.size12!, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size12!),
                                child: Text("OTHER APPS",
                                    style: themeData.textTheme.caption!.merge(
                                        TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(240),
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.35,
                                            wordSpacing: 1.2))),
                              ),
                              singleDrawerItem(MdiIcons.calendarBlankOutline,
                                  "Calender", 11),
                              singleDrawerItem(MdiIcons.accountCircleOutline,
                                  "Contact", 12),
                              Divider(
                                height: 1,
                                color: themeData.dividerColor,
                                thickness: 1,
                              ),
                              singleDrawerItem(
                                  MdiIcons.wrenchOutline, "Settings", 13),
                              singleDrawerItem(MdiIcons.helpCircleOutline,
                                  "Help and feedback", 14),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxSpacing.height(32),
                  Container(
                    padding: EdgeInsets.all(MySize.size16!),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MySize.size12!, top: MySize.size6!, right: MySize.size12!, bottom: MySize.size6!),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Icon(
                                  MdiIcons.menu,
                                  size: MySize.size24,
                                  color: themeData.colorScheme.onBackground,
                                )),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MySize.size16!, right: MySize.size8!),
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Search here",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        isDense: true),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AccountDialog());
                              },
                              child: Container(
                                width: MySize.size36,
                                height: MySize.size36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/avatar-2.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MySize.size8!, left: MySize.size16!, bottom: MySize.size8!),
                    child: Text(
                      "PRIMARY",
                      style: themeData.textTheme.caption!.merge(TextStyle(
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _mailList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MailContentScreen()));
                          },
                          child: Dismissible(
                            background: Container(
                              color: themeData.primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: MySize.size20!),
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.delete,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: MySize.size8!),
                                    child: Text("Delete",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary)),
                                  )
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              color: themeData.primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: MySize.size20!),
                              alignment: AlignmentDirectional.centerEnd,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text("Archive",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 600,
                                          color: themeData
                                              .colorScheme.onPrimary)),
                                  Padding(
                                    padding: EdgeInsets.only(left: MySize.size8!),
                                    child: Icon(
                                      MdiIcons.inboxArrowDown,
                                      color: themeData.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                setState(() {
                                  _mailList.removeAt(index);
                                  showSnackbarWithFloating("1 Archived");
                                });
                              } else {
                                setState(() {
                                  _mailList.removeAt(index);
                                  showSnackbarWithFloating("1 Deleted");
                                });
                              }
                            },
                            key: UniqueKey(),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MySize.size12!, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size12!),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Text(_mailList[index].name[0]),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: MySize.size16!),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      _mailList[index].name,
                                                      style: AppTheme.getTextStyle(
                                                          themeData.textTheme
                                                              .subtitle2,
                                                          fontWeight:
                                                              _mailList[index]
                                                                      .isRead
                                                                  ? 500
                                                                  : 600),
                                                    )),
                                                Text(_mailList[index].date,
                                                    style: AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .subtitle2,
                                                        fontWeight:
                                                            _mailList[index]
                                                                    .isRead
                                                                ?500
                                                                : 600))
                                              ],
                                            ),
                                            Text(_mailList[index].title,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight:
                                                        _mailList[index]
                                                                .isRead
                                                            ? 500
                                                            : 600,
                                                    letterSpacing: 0)),
                                            Text(_mailList[index].message,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight:500,
                                                    letterSpacing: 0))
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  Widget singleDrawerItem(IconData iconData, String title, int position) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(top: 0.0, left: MySize.size16!, right: MySize.size16!, bottom: 0),
      leading: Icon(iconData,
          size: 20,
          color: _selectedPage == position
              ? themeData.colorScheme.primary
              : themeData.colorScheme.onBackground),
      title: Text(title,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(
                  fontWeight: _selectedPage == position
                      ? FontWeight.w600
                      : FontWeight.w500,
                  letterSpacing: 0.2))
              .merge(TextStyle(
                  color: _selectedPage == position
                      ? themeData.colorScheme.primary
                      : themeData.colorScheme.onBackground))),
      onTap: () {
        setState(() {
          _selectedPage = position;
        });
        _scaffoldKey.currentState!.openEndDrawer();
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}

class AccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MySize.size8!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MySize.size36,
                  height: MySize.size36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/avatar-2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MySize.size16!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Aishah Mcconnell",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600)),
                      Text("ais@mcc.com",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size12!),
                        child: TextButton(

                            onPressed: () {},
                            child: Text("Manage all accounts",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: themeData.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MySize.size36,
                  height: MySize.size36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/avatar-1.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Liana Fitzgeraldl",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight:600)),
                      Text("liana.fits@gmail.com",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MySize.size36,
                  height: MySize.size36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/avatar.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MySize.size16!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Sally Lee",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600)),
                      Text("sallylee@qq.com",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size16!),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MySize.size36,
                  height: MySize.size36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("./assets/images/avatar-2.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MySize.size16!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Shamima Ballard",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600)),
                      Text("ballard@gmail.com",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!, top: MySize.size12!, bottom: MySize.size12!),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MySize.size36,
                  height: MySize.size36,
                  child: Center(
                    child: Icon(
                      MdiIcons.accountPlusOutline,
                      color: themeData.colorScheme.onBackground,
                      size: MySize.size22,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: MySize.size16!),
                  child: Text("Add another account",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,
                          fontWeight: 600,
                          letterSpacing: 0)),
                ),
              ],
            ),
          ),
          Divider(
            color: themeData.dividerColor,
            thickness: 1,
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(left: MySize.size16!, top: MySize.size8!, bottom: MySize.size8!),
            alignment: AlignmentDirectional.center,
            child: TextButton(

                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      MdiIcons.logoutVariant,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MySize.size8!),
                      child: Text("Sign out from all account",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500)),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
