import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'SingleServiceScreen.dart';

class SelectServiceScreen extends StatefulWidget {
  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              color: customAppTheme.bgLayer1,
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Container(
                    margin: Spacing.fromLTRB(32, 48, 0, 0),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Which ",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 500,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0)),
                        TextSpan(
                            text: "service ",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 700,
                                color: customAppTheme.colorError,
                                letterSpacing: 0)),
                        TextSpan(
                            text: "\ndo you",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 500,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0)),
                        TextSpan(
                            text: "\nneed?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                fontWeight: 700,
                                color: themeData.colorScheme.primary,
                                letterSpacing: 0)),
                      ]),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(32, 48, 32, 0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      childAspectRatio: 1.3,
                      crossAxisSpacing: MySize.size32!,
                      mainAxisSpacing: MySize.size32!,
                      children: [
                        singleService(
                            serviceIcon: MdiIcons.sprayBottle,
                            service: "Cleaning"),
                        singleService(
                            serviceIcon: MdiIcons.brush, service: "Paint"),
                        singleService(
                            serviceIcon: MdiIcons.carWash, service: "Car Wash"),
                        singleService(
                            serviceIcon: MdiIcons.chefHat, service: "Cooking"),
                        singleService(
                            serviceIcon: MdiIcons.cameraOutline,
                            service: "Camera Man"),
                        singleService(
                            serviceIcon: MdiIcons.waterOutline,
                            service: "Water"),
                        singleService(
                            serviceIcon: MdiIcons.tableFurniture,
                            service: "Furniture"),
                        singleService(
                            serviceIcon: MdiIcons.carBrakeRetarder,
                            service: "Other"),
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget singleService({IconData? serviceIcon, required String service}) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SingleServiceScreen()));

      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: themeData.colorScheme.primary, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            color: themeData.colorScheme.primary.withAlpha(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              serviceIcon,
              color: themeData.colorScheme.primary,
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(
                service,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.primary,
                    fontWeight: 500,
                    letterSpacing: 0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
