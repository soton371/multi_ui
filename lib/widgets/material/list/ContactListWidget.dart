/*
* File : Contact List
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ContactListWidget extends StatefulWidget {
  @override
  _ContactListWidgetState createState() => _ContactListWidgetState();
}

class Contact {
  String name, number;

  Contact(this.name, this.number);
}

class _ContactListWidgetState extends State<ContactListWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  late List<Contact> _contactList;
  late ThemeData themeData;

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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Contact",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight:600)),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showSimpleSnackbar("Add new contact");
                  },
                  child: Icon(MdiIcons.accountPlus),
                  elevation: 2,
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: _contactList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 16, left: 16, right: 16, bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                child: Text(_contactList[index].name[0],
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        color:
                                            themeData.colorScheme.onSecondary,
                                        fontWeight: 700)),
                                backgroundColor:
                                    themeData.colorScheme.secondary,
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
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
                        );
                      },
                    ))));
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
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showSimpleSnackbar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
      ),
    );
  }
}
