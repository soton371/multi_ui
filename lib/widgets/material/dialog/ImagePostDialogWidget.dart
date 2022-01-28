/*
* File : Image Post Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ImagePostDialogWidget extends StatefulWidget {
  @override
  _ImagePostDialogWidgetState createState() => _ImagePostDialogWidgetState();
}

class _ImagePostDialogWidgetState extends State<ImagePostDialogWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _FullDialog());
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Image Post",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ElevatedButton(

                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          "View Post",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700,
                              color: themeData.colorScheme.onPrimary,
                              letterSpacing: 0.2),
                        )),
                  ),
                )));
      },
    );
  }
}

class _FullDialog extends StatelessWidget {
  final String description =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Stack(children: [
              Image(
                image: AssetImage("./assets/images/all/all-p1.jpg"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Positioned(
                  top: 24,
                  left: 18,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(MdiIcons.chevronLeft, color: Colors.white),
                  )),
              Positioned(
                right: 16,
                bottom: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.white.withAlpha(72),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                            side: BorderSide(width: 0)),
                        child: InkWell(
                          splashColor: Colors.white.withAlpha(100),
                          highlightColor: Colors.white.withAlpha(72),
                          child: SizedBox(
                              width: 44,
                              height: 44,
                              child: Icon(
                                MdiIcons.heartOutline,
                                color: Colors.white,
                                size: 22,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white.withAlpha(72),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                              side: BorderSide(width: 0)),
                          child: InkWell(
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor: Colors.white.withAlpha(72),
                            child: SizedBox(
                                width: 44,
                                height: 44,
                                child: Icon(
                                  MdiIcons.shareOutline,
                                  color: Colors.white,
                                  size: 22,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("How do you get up and go forward",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline5,
                          fontWeight: 700)),
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(description,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              height: 1.2))),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                image:
                                    AssetImage('./assets/images/avatar-4.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Zakariyah Cline",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600)),
                                Text("@zaka_cline",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500))
                              ],
                            ),
                          ),
                        ),
                        Text("26 May",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
