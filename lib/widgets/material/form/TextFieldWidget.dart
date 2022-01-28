/*
* File : Text Field
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  bool _passwordVisible = false;

  late ThemeData themeData;

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
                  title: Text("Text Fields",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    padding: EdgeInsets.only(bottom: 8),
                    color: themeData.backgroundColor,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 16),
                            child: Text("Bordered (with label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "Name",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  controller: TextEditingController(
                                      text: "Natalia Dyer"),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hintText: "Email",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    controller: TextEditingController(
                                        text: "nat@mail.com"),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Bordered  (without label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  controller: TextEditingController(
                                      text: "Natalia Dyer"),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      border:
                                          themeData.inputDecorationTheme.border,
                                      enabledBorder:
                                          themeData.inputDecorationTheme.border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme.focusedBorder,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    controller: TextEditingController(
                                        text: "nat@mail.com"),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Borderless (with label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "Name",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  controller: TextEditingController(
                                      text: "Natalia Dyer"),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      hintText: "Email",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    controller: TextEditingController(
                                        text: "nat@mail.com"),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Borderless (without label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Border bottom (without label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: themeData.inputDecorationTheme
                                              .border!.borderSide.color),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: themeData.inputDecorationTheme
                                              .enabledBorder!.borderSide.color),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: themeData.inputDecorationTheme
                                              .focusedBorder!.borderSide.color),
                                    ),
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: themeData
                                                .inputDecorationTheme
                                                .border!
                                                .borderSide
                                                .color),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: themeData
                                                .inputDecorationTheme
                                                .enabledBorder!
                                                .borderSide
                                                .color),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: themeData
                                                .inputDecorationTheme
                                                .focusedBorder!
                                                .borderSide
                                                .color),
                                      ),
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Filled (without label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground),
                                  decoration: InputDecoration(
                                    fillColor: themeData.colorScheme.background,
                                    hintStyle: TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground),
                                    filled: true,
                                    hintText: "Name",
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground),
                                    decoration: InputDecoration(
                                      fillColor:
                                          themeData.colorScheme.background,
                                      hintStyle: TextStyle(
                                          color: themeData
                                              .colorScheme.onBackground),
                                      filled: true,
                                      hintText: "Email",
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Rounded (with label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Ask me anything",
                                labelStyle: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(160),
                                        letterSpacing: 0.2)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(120)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(120)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5,
                                      color: themeData.colorScheme.secondary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                prefixIcon: Icon(
                                  MdiIcons.magnify,
                                  size: 22,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(160),
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.all(0),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Rounded (without label)",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    labelStyle: themeData.textTheme.subtitle2!
                                        .merge(TextStyle(
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(160),
                                            letterSpacing: 0.2)),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.2,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(120)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.2,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(120)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.5,
                                          color:
                                              themeData.colorScheme.secondary),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    ),
                                    prefixIcon: Icon(
                                      MdiIcons.magnify,
                                      size: 22,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(160),
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 24, left: 16, right: 16),
                            child: Text("Password",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight:600)),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(_passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: _passwordVisible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
}
