/*
* File : Add Contact 
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class AddContactDialogWidget extends StatefulWidget {
  @override
  _AddContactDialogWidgetState createState() => _AddContactDialogWidgetState();
}


class Contact {
  String name,number;

  Contact(this.name,this.number);
}



class _AddContactDialogWidgetState extends State<AddContactDialogWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  leading:IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Contact",
                      style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight: 600)),
                ),
                floatingActionButton:  FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return _AddContactDialog();
                        },
                        fullscreenDialog: true));
                  },
                  child: Icon(MdiIcons.accountPlus),
                  elevation: 2,
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child:  Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Tap on ",style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground,letterSpacing: 0.2)),),
                          Icon(MdiIcons.accountPlus,size: 18,color: themeData.colorScheme.onBackground),
                          Text(" to add new contact",style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground,letterSpacing: 0.2)),),
                        ],
                      ),
                    ))));
      },
    );
  }




}

class _AddContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Create Contact',style: themeData.appBarTheme.textTheme!.headline6),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Material(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.check))),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 64,
                    height: 64,
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Image(
                        image: AssetImage("./assets/images/avatar-place.png"),
                      )
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                            decoration: InputDecoration(
                              hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              hintText: "First name",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .border!
                                        .borderSide
                                        .color),
                              ),
                              enabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .enabledBorder!
                                        .borderSide
                                        .color),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .focusedBorder!
                                        .borderSide
                                        .color),
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          TextFormField(
                            style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                            decoration: InputDecoration(
                              hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              hintText: "Surname",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .border!
                                        .borderSide
                                        .color),
                              ),
                              enabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .enabledBorder!
                                        .borderSide
                                        .color),
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: themeData
                                        .inputDecorationTheme
                                        .focusedBorder!
                                        .borderSide
                                        .color),
                              ),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(MdiIcons.homeCityOutline,color: themeData.colorScheme.onBackground,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                                hintText: "Company",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .border!
                                          .borderSide
                                          .color),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .focusedBorder!
                                          .borderSide
                                          .color),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(MdiIcons.briefcaseOutline,color: themeData.colorScheme.onBackground,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                                hintText: "Job title",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .border!
                                          .borderSide
                                          .color),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .focusedBorder!
                                          .borderSide
                                          .color),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(MdiIcons.emailOutline,color: themeData.colorScheme.onBackground,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                                hintText: "Email",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .border!
                                          .borderSide
                                          .color),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .focusedBorder!
                                          .borderSide
                                          .color),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(MdiIcons.phoneOutline,color: themeData.colorScheme.onBackground,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                                hintText: "Phone",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .border!
                                          .borderSide
                                          .color),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .focusedBorder!
                                          .borderSide
                                          .color),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      child: Center(
                        child: Icon(MdiIcons.noteOutline,color: themeData.colorScheme.onBackground,),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                              decoration: InputDecoration(
                                hintStyle: themeData.textTheme.subtitle2!.merge(TextStyle(color: themeData.colorScheme.onBackground)),
                                hintText: "Note",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .border!
                                          .borderSide
                                          .color),
                                ),
                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .enabledBorder!
                                          .borderSide
                                          .color),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeData
                                          .inputDecorationTheme
                                          .focusedBorder!
                                          .borderSide
                                          .color),
                                ),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: ElevatedButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Add to contact".toUpperCase(),
                      style: themeData.textTheme.button!.merge(TextStyle(color : themeData.colorScheme.onPrimary,letterSpacing: 0.3)),)
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

