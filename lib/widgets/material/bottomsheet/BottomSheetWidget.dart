/*
* File : Bottom Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../AppTheme.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showBottomSheet(context));
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
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Bottom Sheet",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: themeData.colorScheme.primary
                                .withAlpha(24),
                            blurRadius: 3,
                            offset: Offset(0,
                                3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(

                          onPressed: () {_showBottomSheet(context);},
                          child: Text("Show bottom sheet",
                            style: themeData.textTheme.subtitle2!.merge(TextStyle(color : themeData.colorScheme.onSecondary)),)
                      ),
                    ),
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
            decoration:  BoxDecoration(
                color: themeData.backgroundColor,
                borderRadius:  BorderRadius.only(
                    topLeft:  Radius.circular(MySize.size16!),
                    topRight:  Radius.circular(MySize.size16!))),
            child: Padding(
              padding:  EdgeInsets.only(
                  top: MySize.size24!, left: MySize.size24!, right: MySize.size24!, bottom: MySize.size36!),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(MdiIcons.accountMultiple,
                              size: MySize.size26,
                              color: themeData.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size4!),
                            child: Text(
                              "180 Followers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: themeData.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(MdiIcons.accountGroup,
                              size: 26,
                              color: themeData.colorScheme.onBackground),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size4!),
                            child: Text(
                              "147 Following",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: themeData.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

}
