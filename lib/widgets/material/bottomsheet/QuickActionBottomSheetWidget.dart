/*
* File : Quick Action Bottom Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class QuickActionBottomSheetWidget extends StatefulWidget {
  @override
  _QuickActionBottomSheetWidgetState createState() =>
      _QuickActionBottomSheetWidgetState();
}

class _QuickActionBottomSheetWidgetState
    extends State<QuickActionBottomSheetWidget> {
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
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    child: Icon(
                      MdiIcons.flashOutline,
                      size: MySize.size26,
                      color: themeData.colorScheme.onPrimary,
                    ),
                    elevation: 2,
                    backgroundColor:
                        themeData.floatingActionButtonTheme.backgroundColor),
                appBar: AppBar(
                  backgroundColor: themeData.appBarTheme.color,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Quick Action",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: MySize.size16!),
                        color: themeData.appBarTheme.color,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.informationOutline,
                              color: themeData.appBarTheme.iconTheme!.color,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MySize.size8!),
                              child: Text("Tap on FAB",
                                  style: themeData
                                      .textTheme.subtitle2),
                            )
                          ],
                        ),
                      ),
                    ],
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
              decoration: BoxDecoration(
                  color: themeData.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Padding(
                padding: EdgeInsets.all(MySize.size16!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Quick Action",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphone,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.subwayVariant,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gasCylinder,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.lightbulbOutline,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.television,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.gold,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: MdiIcons.cellphoneAndroid,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.googlePlay,
                                      actionText: 'G Play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: MdiIcons.umbrellaOutline,
                                      actionText: 'Insurance',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: MySize.size52,
                    height: MySize.size52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size4!),
            child: Text(
              actionText,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600),
            ),
          )
        ],
      ),
    );
  }
}
