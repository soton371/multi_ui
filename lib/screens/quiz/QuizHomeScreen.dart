import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class QuizHomeScreen extends StatefulWidget {
  @override
  _QuizHomeScreenState createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
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
              child: ListView(
                padding: Spacing.zero,
                children: [
                  Container(
                    margin: Spacing.fromLTRB(24, 64, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi Denise",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                                Container(
                                  margin: Spacing.top(4),
                                  child: Text(
                                    "It's Time to Play!",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        color: themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size28!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/avatar-2.jpg'),
                                  height: MySize.size54,
                                  width: MySize.size54,
                                ),
                              ),
                              Container(
                                width: MySize.size56,
                                height: MySize.size56,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    customAppTheme.colorSuccess
                                        .withAlpha(200),
                                  ),
                                  value: 0.6,
                                  strokeWidth: 4,
                                  backgroundColor:
                                      customAppTheme.bgLayer4.withAlpha(200),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                    child: rankingWidget(),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget quizWidget() {
    return Container();
  }

  Widget rankingWidget() {
    return Container(
      padding: Spacing.all(12),
      decoration: BoxDecoration(
          color: themeData.colorScheme.primary.withAlpha(200),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(
                      MdiIcons.shieldStarOutline,
                      color: themeData.colorScheme.onPrimary.withAlpha(200),
                      size: MySize.size20,
                    ),
                  ),
                  Container(
                    margin: Spacing.left(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "45",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,height: 1,fontWeight: 600,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                        Container(
                          child: Text(
                            "RANKING",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 11,
                                fontWeight: 600,
                                letterSpacing: 0,
                                  color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            VerticalDivider(
              color: themeData.colorScheme.onPrimary.withAlpha(150),thickness: 1,),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(
                      MdiIcons.alphaPCircleOutline,
                      color: themeData.colorScheme.onPrimary.withAlpha(200),
                      size: MySize.size20,
                    ),
                  ),
                  Container(
                    margin: Spacing.left(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "1000",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,height: 1,fontWeight: 600,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                        Container(
                          child: Text(
                            "POINTS",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 11,
                                letterSpacing: 0,
                                fontWeight: 600,
                                color: themeData.colorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
