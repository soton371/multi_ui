/*
* File : Cupertino TextField
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class CupertinoTextfieldWidget extends StatefulWidget {
  @override
  _CupertinoTextfieldWidgetState createState() =>
      _CupertinoTextfieldWidgetState();
}

class _CupertinoTextfieldWidgetState extends State<CupertinoTextfieldWidget> {
  late ThemeData themeData;

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
      return MaterialApp(
        theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(MdiIcons.chevronLeft),
            ),
            title: Text("Text Field",
                style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                    fontWeight: 600)),
          ),
          body: Container(
            color: themeData.backgroundColor,
            padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!),
            child: ListView(children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Simple",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 500)),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration:
                      BoxDecoration(color: themeData.colorScheme.background),
                  cursorColor: themeData.colorScheme.secondary,
                  placeholder: "Email",
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Bordered",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 500)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Email",
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Prefix Icon",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 500)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Email",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: MySize.size8!),
                    child: Icon(
                      MdiIcons.emailOutline,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Suffix Icon",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Contact",
                  suffix: Padding(
                    padding: EdgeInsets.only(right: MySize.size8!),
                    child: Icon(
                      MdiIcons.contactsOutline,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Both Icon",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  obscureText: _passwordVisible,
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Password",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: MySize.size8!),
                    child: Icon(
                      MdiIcons.lockOutline,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: MySize.size8!),
                      child: Icon(
                        _passwordVisible
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                  ),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Rounded",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Email",
                  prefix: Padding(
                    padding: EdgeInsets.only(left: MySize.size8!),
                    child: Icon(
                      MdiIcons.emailOutline,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size8!),
                child: Text("Text Area",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 500)),
              ),
              Container(
                padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.background,
                      border: Border.all(color: themeData.colorScheme.primary)),
                  cursorColor: themeData.colorScheme.primary,
                  placeholder: "Comment me",
                  placeholderStyle: TextStyle(
                      color: themeData.colorScheme.onBackground.withAlpha(160)),
                  minLines: 4,
                  maxLines: 6,
                  style: TextStyle(color: themeData.colorScheme.onBackground),
                  padding:
                      EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size8!, right: MySize.size8!),
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}
