/*
* File : Extended FAB
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';
import '../../../AppThemeNotifier.dart';

class ExtendedFABWidget extends StatefulWidget {
  @override
  _ExtendedFABWidgetState createState() => _ExtendedFABWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ExtendedFABWidgetState extends State<ExtendedFABWidget> {
  late ThemeData themeData;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late List<Contact> _contactList;

  @override
  void initState() {
    super.initState();
    _contactList = [
      Contact("Zahra Tate", "+1 987456321"),
      Contact("Willard Palmer", "+4 154789632"),
      Contact("Charlotte Small", "+1 521478963"),
      Contact("Stanley Lindsey", "+18 123654789"),
      Contact("Ebony Bowman", "+4 987456321"),
      Contact("Rosa Lloyd", "+91 789456321"),
      Contact("Shane Roman", "+1 147852369"),
      Contact("Ashley Cruz", "+14 159632147"),
      Contact("Elle Mendoza", "+78 697412369"),
      Contact("Kieron Lucero", "+178 52314569"),
      Contact("Mitchell Brady", "0291 215496"),
      Contact("Casey Calderon", "+1 125893478"),
      Contact("Jodie Caldwell", "+1 147852369"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Extended FAB",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    showSnackbar("Add new contact");
                  },
                  elevation: 2,
                  label: Text(
                    "New contact".toUpperCase(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600,
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.3),
                  ),
                  icon: Icon(MdiIcons.plus),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _contactList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              showSnackbar("Edit " + _contactList[index].name);
                            } else {
                              showSnackbar(
                                  "Calling " + _contactList[index].name);
                            }
                            return false;
                          },
                          dismissThresholds: const {
                            DismissDirection.endToStart: 0.4,
                            DismissDirection.startToEnd: 0.4,
                          },
                          background: Container(
                            color: themeData.colorScheme.background,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: ClipOval(
                              child: Material(
                                color: themeData.primaryColor.withAlpha(24),
                                // button color
                                child: InkWell(
                                  splashColor: themeData.colorScheme.primary,
                                  // inkwell color
                                  child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Icon(
                                        MdiIcons.phoneOutgoingOutline,
                                        color: themeData.colorScheme.primary,
                                        size: 24,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: themeData.colorScheme.background,
                            padding: EdgeInsets.symmetric(horizontal: MySize.size20!),
                            alignment: AlignmentDirectional.centerEnd,
                            child: ClipOval(
                              child: Material(
                                color: themeData.primaryColor.withAlpha(24),
                                child: InkWell(
                                  splashColor: themeData.colorScheme.primary,
                                  child: SizedBox(
                                      width: MySize.size40,
                                      height: MySize.size40,
                                      child: Icon(
                                        MdiIcons.accountEditOutline,
                                        color: themeData.colorScheme.primary,
                                        size: MySize.size24,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              showSnackbar("Edit " + _contactList[index].name);
                            } else {
                              showSnackbar(
                                  "Calling " + _contactList[index].name);
                            }
                          },
                          key: UniqueKey(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size16!, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size8!),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text(_contactList[index].name[0],
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                  backgroundColor:
                                      themeData.colorScheme.secondary,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: MySize.size16!),
                                    child: Column(
                                      children: <Widget>[
                                        Text(_contactList[index].name,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                fontWeight: 600)),
                                        Text(_contactList[index].number,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 500)),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ))));
      },
    );
  }

  void showSnackbar(String message) {
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
