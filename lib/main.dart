/*
* File : Main File
* Version : 1.0.0
* */

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/CupertinoWidgetsHome.dart';
import 'package:UIKit/CustomAppsHome.dart';
import 'package:UIKit/FlutXHome.dart';
import 'package:UIKit/MaterialWidgetsHome.dart';
import 'package:UIKit/ScreensHome.dart';
import 'package:UIKit/customapps/dating/views/dating_home_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_splash_screen.dart';
import 'package:UIKit/customapps/homemade/views/splash_screen.dart';
import 'package:UIKit/screens/SelectThemeDialog.dart';
import 'package:UIKit/screens/food/FoodRegisterScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: ChangeNotifierProvider<FxAppThemeNotifier>(
        create: (context) => FxAppThemeNotifier(),
        child: MyApp(),
      ),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: FxAppTheme.getThemeFromThemeMode(),
          home: MyHomePage()
          // home: FoodRegisterScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 2;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  final List<Widget> _fragmentView = [
    MaterialWidgetsHome(),
    CupertinoWidgetsHome(),
    ScreensHome(),
    CustomAppsHome(),
    FlutXHome(),
  ];

  final List<String> _fragmentTitle = [
    "Material Widgets",
    "Cupertino Widgets",
    "Material Apps",
    "Custom Apps",
    "FlutX"
  ];

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void _launchURL() async {
    String url = "https://1.envato.market/flutkit";
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    //You will need to initialize MySize class for responsive spaces.
    MySize().init(context);
    themeData = Theme.of(context);

    // Future.delayed(duration)

    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                        AppTheme.theme.colorScheme.primary.withAlpha(80))),
            home: Scaffold(
              key: _drawerKey,
              backgroundColor: FxAppTheme.customTheme.bgLayer1,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: FxAppTheme.customTheme.bgLayer2,
                title: Text(_fragmentTitle[_selectedPage],
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: _fragmentView[_selectedPage],
              drawer: Drawer(
                  child: Container(
                color: customAppTheme.bgLayer1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        padding: Spacing.only(left: 16, bottom: 24, top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage("./assets/brand/flutkit.png"),
                              height: 102,
                              width: 102,
                            ),
                            Space.height(16),
                            Container(
                              padding: Spacing.fromLTRB(12, 4, 12, 4),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(40),
                                  borderRadius: Shape.circular(16)),
                              child: Text("v. 6.3.x",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 600,
                                      letterSpacing: 0.2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      color: customAppTheme.bgLayer1,
                      child: ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  SelectThemeDialog());
                        },
                        title: Text(
                          "Select Theme",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2,
                              fontWeight: 600),
                        ),
                        trailing: Icon(Icons.chevron_right,
                            color: themeData.colorScheme.onBackground),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: customAppTheme.bgLayer1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: FxSpacing.fromLTRB(16, 8, 0, 0),
                                child: Text(
                                  "Full Apps".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      muted: true,
                                      fontWeight: 600,
                                      letterSpacing: 0.3,
                                      wordSpacing: 2),
                                )),
                            FxSpacing.height(4),
                            ListTile(
                              leading: Icon(
                                MdiIcons.viewCarouselOutline,
                                color: _selectedPage == 2
                                    ? themeData.colorScheme.primary
                                    : themeData.colorScheme.onBackground,
                                size: 24,
                              ),
                              title: Text("Material",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight:
                                          _selectedPage == 2 ? 700 : 600,
                                      color: _selectedPage == 2
                                          ? themeData.colorScheme.primary
                                          : themeData
                                              .colorScheme.onBackground)),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 2;
                                  _drawerKey.currentState!.openEndDrawer();
                                });
                              },
                            ),
                            ListTile(
                              leading: Icon(
                                MdiIcons.apps,
                                color: _selectedPage == 3
                                    ? themeData.colorScheme.primary
                                    : themeData.colorScheme.onBackground,
                                size: 24,
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Custom",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight:
                                              _selectedPage == 3 ? 700 : 600,
                                          color: _selectedPage == 3
                                              ? themeData.colorScheme.primary
                                              : themeData
                                                  .colorScheme.onBackground)),
                                  Space.width(16),
                                  Container(
                                    padding: Spacing.fromLTRB(12, 4, 12, 4),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(60),
                                        borderRadius: Shape.circular(16)),
                                    child: Text(
                                      "New",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          fontWeight: 500),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 3;
                                  _drawerKey.currentState!.openEndDrawer();
                                });
                              },
                            ),
                            Container(
                                padding: FxSpacing.fromLTRB(16, 16, 0, 0),
                                child: Text(
                                  "Widget".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      muted: true,
                                      fontWeight: 600),
                                )),
                            FxSpacing.height(4),
                            ListTile(
                              leading: Icon(MdiIcons.materialDesign,
                                  color: _selectedPage == 0
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground),
                              title: Text("Material",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight:
                                          _selectedPage == 0 ? 700 : 600,
                                      color: _selectedPage == 0
                                          ? themeData.colorScheme.primary
                                          : themeData
                                              .colorScheme.onBackground)),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 0;
                                  _drawerKey.currentState!.openEndDrawer();
                                });
                              },
                            ),
                            ListTile(
                              leading: Icon(MdiIcons.appleIos,
                                  color: _selectedPage == 1
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground),
                              title: Text("Cupertino",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight:
                                          _selectedPage == 1 ? 700 : 600,
                                      color: _selectedPage == 1
                                          ? themeData.colorScheme.primary
                                          : themeData
                                              .colorScheme.onBackground)),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 1;
                                  _drawerKey.currentState!.openEndDrawer();
                                });
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.widgets_outlined,
                                  color: _selectedPage == 4
                                      ? themeData.colorScheme.primary
                                      : themeData.colorScheme.onBackground),
                              title: Row(
                                children: [
                                  Text("FlutX",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight:
                                              _selectedPage == 4 ? 700 : 600,
                                          color: _selectedPage == 4
                                              ? themeData.colorScheme.primary
                                              : themeData
                                                  .colorScheme.onBackground)),
                                  FxSpacing.width(16),
                                  Container(
                                      padding: Spacing.fromLTRB(12, 4, 12, 4),
                                      decoration: BoxDecoration(
                                          color: themeData.colorScheme.primary
                                              .withAlpha(60),
                                          borderRadius: Shape.circular(16)),
                                      child: FxText.caption(
                                        "Exclusive",
                                        color: themeData.colorScheme.primary,
                                      ))
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedPage = 4;
                                  _drawerKey.currentState!.openEndDrawer();
                                });
                              },
                            ),
                            Space.height(16),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    _launchURL();
                                  },
                                  child: Text("Buy Now")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ));
      },
    );
  }
}
