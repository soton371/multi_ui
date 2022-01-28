/*
* File : Mail Compose
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class MailComposeScreen extends StatefulWidget {
  @override
  _MailComposeScreenState createState() => _MailComposeScreenState();
}



class _MailComposeScreenState extends State<MailComposeScreen> {
  List<String> _simpleChoice = [
    "Schedule send",
    "Confidential Mode",
    "Discard",
    "Settings",
    "help and feedback"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            color: Theme.of(context).backgroundColor,
            home: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: new AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                title: Text('Compose',
                    style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color:
                      Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600,letterSpacing: 0.15
                    ))),
                leading: Material(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(MdiIcons.chevronLeft,
                            size: 28,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground))),
                actions: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: Material(
                        child: InkWell(
                            child: Icon(MdiIcons.attachment,
                                size: 28,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground))),
                  ),
                  Container(
                    child: Material(
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(MdiIcons.send,
                                size: 24,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground))),
                  ),
                  Material(
                    child: InkWell(
                      child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return _simpleChoice.map((String choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: Text(choice,
                                    style: TextStyle(letterSpacing: 0.15).merge(
                                        Theme.of(context).textTheme.bodyText2!.merge(
                                            TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                                letterSpacing: 0.2)))),
                              );
                            }).toList();
                          },
                          icon: Icon(MdiIcons.dotsVertical,color:Theme.of(context)
                              .colorScheme
                              .onBackground),
                          color: Theme.of(context).backgroundColor),),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Theme.of(context).backgroundColor,
                  padding: EdgeInsets.only(top:16,bottom: 16),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left:16,right: 16,bottom: 8),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 60,
                              child: Text("From",
                                  style: TextStyle(letterSpacing: 0.15).merge(
                                      Theme.of(context).textTheme.bodyText1!.merge(
                                          TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              letterSpacing: 0.2)))),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                controller: TextEditingController(text: "nat@gmail.com"),
                              ),
                            ),
                            Icon(MdiIcons.chevronDown,color: Theme.of(context).colorScheme.onBackground,),
                          ],
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left:16,right: 16,top: 8,bottom: 8),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 60,
                              child: Text("To",
                                  style: TextStyle(letterSpacing: 0.15).merge(
                                      Theme.of(context).textTheme.bodyText1!.merge(
                                          TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              letterSpacing: 0.2)))),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            Icon(MdiIcons.chevronDown,color: Theme.of(context).colorScheme.onBackground)
                          ],
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left:16,right: 16,top: 8,bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: "Subject"
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1,
                        height: 0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left:16,right: 16,top: 8,bottom: 8),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: "Compose email"
                                ),
                                maxLines: 10,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
