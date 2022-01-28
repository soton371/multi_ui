import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage(
                              './assets/illustration/shopping/maintenance.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        child: Text(
                          "We will be back soon",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              letterSpacing: 0.2),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size56!,
                            right: MySize.size56!,
                            top: MySize.size24!),
                        child: Text(
                          "FlutKit is getting some tune up and some love. We'll be back soon, Thanks for your patience!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              letterSpacing: 0,
                              fontWeight: 500,
                              height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
