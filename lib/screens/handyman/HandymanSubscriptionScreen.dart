import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class HandymanSubscriptionScreen extends StatefulWidget {
  @override
  _HandymanSubscriptionScreenState createState() =>
      _HandymanSubscriptionScreenState();
}

class _HandymanSubscriptionScreenState extends State<HandymanSubscriptionScreen> {
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
                appBar: AppBar(
                  backgroundColor: customAppTheme.bgLayer1,
                  elevation: 0,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(
                    "Subscriptions",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    children: [
                      Container(
                        margin: Spacing.top(24),
                        child: Text(
                          "21",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline4,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: Spacing.top(0),
                        child: Text(
                          "Days remaining",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              xMuted: true),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 32, 24, 0),
                        child: Text(
                          "RENEW SUBSCRIPTION",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              muted: true),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 24, 0),
                        child: Column(
                          children: [
                            subscriptionWidget(
                                title: "Premium Plan",
                                description: "Get unlimited A for month",
                                value: 19),
                            subscriptionWidget(
                                title: "Economy Plan",
                                description: "Get unlimited B for month",
                                value: 29),
                            subscriptionWidget(
                                title: "Business Plan",
                                description: "Get unlimited C for month",
                                value: 59),
                            Container(
                              margin: Spacing.top(8),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "CONTACT US",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      letterSpacing: 0.4,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary),
                                ),

                              ),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                )));
      },
    );
  }

  Widget subscriptionWidget({required String title, required String description, double? value}) {
    return Container(
      margin: Spacing.bottom(16),
      padding: Spacing.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        border: Border.all(color: customAppTheme.bgLayer4, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.primary,fontWeight: 600),
              ),
              Text(
                "\$" + value.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.primary,fontWeight: 600),
              ),
            ],
          ),
          Text(
            description,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
