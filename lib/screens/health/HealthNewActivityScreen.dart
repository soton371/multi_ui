import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HealthNewActivityScreen extends StatefulWidget {
  @override
  _HealthNewActivityScreenState createState() =>
      _HealthNewActivityScreenState();
}

class _HealthNewActivityScreenState extends State<HealthNewActivityScreen> {
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
              color: customAppTheme.bgLayer2,
              child: ListView(
                padding: Spacing.top(48),
                children: [
                  Container(
                    margin: Spacing.fromLTRB(24, 0, 24, 0),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: themeData.colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "What's your",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600)),
                        TextSpan(
                            text: " goal?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                color: customAppTheme.colorSuccess,
                                fontWeight: 600)),
                      ]),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 8, 24, 0),
                    child: Text(
                      "We need to know your fitness goal",
                      textAlign: TextAlign.center,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                          muted: true),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(40, 40, 40, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        singleChoice(title: "To lose weight"),
                        Container(
                            margin: Spacing.top(16),
                            child: singleChoice(title: "To lose fat")),
                        Container(
                            margin: Spacing.top(16),
                            child: singleChoice(title: "To gain weight")),
                        Container(
                            margin: Spacing.top(16),
                            child: singleChoice(title: "To gain height")),
                        Container(
                            margin: Spacing.top(16),
                            child: singleChoice(title: "To build muscle")),
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget singleChoice({required String title}) {
    return Container(
      padding: Spacing.fromLTRB(24, 16, 0, 16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: Text(
        title,
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
            color: themeData.colorScheme.onBackground, fontWeight: 500),
      ),
    );
  }
}
