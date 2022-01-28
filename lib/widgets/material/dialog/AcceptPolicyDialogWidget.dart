/*
* File : Accept Policy Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class AcceptPolicyDialogWidget extends StatefulWidget {
  @override
  _AcceptPolicyWidgetState createState() => _AcceptPolicyWidgetState();
}

class _AcceptPolicyWidgetState extends State<AcceptPolicyDialogWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _TermsDialog());
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
                  leading:IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Accept Terms",
                      style: AppTheme.getTextStyle(themeData.textTheme.headline6,fontWeight:600)),
                ),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(

                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          "Accept Terms",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700,
                              color: themeData.colorScheme.onPrimary),
                        )),
                  ),
                )));
      },
    );
  }
}

class _TermsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text("Terms",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 800)),
                  ),
                ),
                Icon(MdiIcons.download)
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: RichText(
                text: TextSpan(
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight:600, letterSpacing: 0.2),
                    children: <TextSpan>[
                      TextSpan(
                        text: "By Creating an account you agree to the xyz ",
                      ),
                      TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: themeData.colorScheme.primary)),
                      TextSpan(text: " and "),
                      TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: themeData.colorScheme.primary)),
                    ]),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(

                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Decline",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 700))),
                    FxButton(
                      backgroundColor: themeData.colorScheme.primary.withAlpha(40),
                        borderRadiusAll: 4,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Accept",
                          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                              fontWeight:800,color: themeData.colorScheme.primary),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
