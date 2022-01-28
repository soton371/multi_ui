
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:provider/provider.dart';

import 'AppTheme.dart';
import 'AppThemeNotifier.dart';
import 'SingleGridItem.dart';
import 'flutx/bottom_navigation_bars.dart';
import 'flutx/buttons.dart';
import 'flutx/two_tone_icons.dart';

class FlutXHome extends StatefulWidget {
  @override
  _FlutXHomeState createState() => _FlutXHomeState();
}

class _FlutXHomeState extends State<FlutXHome> {

  CustomAppTheme? customAppTheme;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);


    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return Container(
            padding: EdgeInsets.fromLTRB(8,12,8,12
              ),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[

                GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(4),
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 16,children: <Widget>[
                  SinglePageItem(
                    iconData: Icons.category_outlined,
                    title: "Two Tone Icon",
                    navigation: TwoToneIcons(),
                  ),
                  SinglePageItem(
                    iconData: Icons.category_outlined,
                    title: "Bottom Navigation Bar",
                    navigation: BottomNavigationBars(),
                  ),
                  SinglePageItem(
                    iconData: Icons.category_outlined,
                    title: "Button",
                    navigation: Buttons(),
                  ),
                ]),

                Container(
                  margin: FxSpacing.y(24),
                  child: Center(
                    child: Text("More Examples are coming soon... ",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0.5,
                          fontWeight: 500,
                        )),
                  ),
                )

              ],
            ));
      },
    );
  }
}
