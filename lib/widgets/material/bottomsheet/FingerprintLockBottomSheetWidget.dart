/*
* File : Fingerprint Lock Bottom Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FingerprintLockBottomSheetWidget extends StatefulWidget {
  @override
  _FingerprintLockBottomSheetWidgetState createState() =>
      _FingerprintLockBottomSheetWidgetState();
}

class _FingerprintLockBottomSheetWidgetState
    extends State<FingerprintLockBottomSheetWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _showBottomSheet(context));
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
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Login",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
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
                          _showBottomSheet(context);
                        },
                        child: Text(
                          "Login with Fingerprint",
                          style: themeData.textTheme.bodyText2!.merge(TextStyle(
                              color: themeData.colorScheme.onPrimary)),
                        )),
                  ),
                )));
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: new BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size24!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          "Sign In",
                          style: themeData.textTheme.subtitle1!.merge(TextStyle(
                              color: themeData.colorScheme.onBackground,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2)),
                        )),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          Icon(MdiIcons.fingerprint,
                              color: themeData.colorScheme.onBackground,
                              size: MySize.size64),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size4!),
                            child: Text(
                              "Touch the fingerprint sensor",
                              style: themeData.textTheme.bodyText2!.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: TextButton(

                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "CANCEL",
                            style: themeData.textTheme.bodyText2!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.4)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
