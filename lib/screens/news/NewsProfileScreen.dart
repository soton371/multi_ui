import 'package:UIKit/screens/profile/EditProfileScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class NewsProfileScreen extends StatefulWidget {
  @override
  _NewsProfileScreenState createState() => _NewsProfileScreenState();
}

class _NewsProfileScreenState extends State<NewsProfileScreen> {
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
            home: SafeArea(
              child: Scaffold(
                  body: ListView(
                padding: EdgeInsets.all(MySize.size24!),
                children: <Widget>[
                  _upgradeWidget(),
                  Container(
                    margin: Spacing.top(24),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size6!)),
                              color: themeData.colorScheme.primary),
                          padding: Spacing.all(10),
                          child: Icon(
                            MdiIcons.tuneVariant,
                            size: MySize.size20,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(
                          width: MySize.size16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700),
                            ),
                            Text(
                              "Edit and manage your account details",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  muted: true,
                                  fontWeight: 600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(16),
                    padding: Spacing.vertical(8),
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer2,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfileScreen()));
                          },
                          leading: ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!)),
                              child: Image(
                                image:
                                    AssetImage('./assets/images/avatar-2.jpg'),
                                height: MySize.size44,
                                width: MySize.size44,
                              )),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Maria M. Boyles",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 700),
                              ),
                              Text(
                                "Editor",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    muted: true,
                                    fontWeight: 600),
                              )
                            ],
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                        SizedBox(
                          height: MySize.size8,
                        ),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    xMuted: true,
                                    fontWeight: 600),
                              ),
                              Text(
                                "maria@coderthemes.com",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              )
                            ],
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    xMuted: true,
                                    fontWeight: 600),
                              ),
                              Text(
                                "+91 98765 43210",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              )
                            ],
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(24),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size6!)),
                              color: themeData.colorScheme.primary),
                          padding: Spacing.all(10),
                          child: Icon(
                            MdiIcons.emailOpenOutline,
                            size: MySize.size20,
                            color: themeData.colorScheme.onPrimary,
                          ),
                        ),
                        SizedBox(
                          width: MySize.size16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Help and Feedback",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700),
                            ),
                            Text(
                              "Reach us with your feedback and questions",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  muted: true,
                                  fontWeight: 600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(16),
                    padding: Spacing.vertical(8),
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer2,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            MdiIcons.frequentlyAskedQuestions,
                            color: themeData.colorScheme.onBackground,
                          ),
                          title: Text(
                            "FAQs",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                        Divider(height: 0,),
                        ListTile(
                          leading: Icon(
                            MdiIcons.youtube,
                            color: themeData.colorScheme.onBackground,
                          ),
                          title: Text(
                            "Videos",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                        Divider(height: 0,),
                        ListTile(
                          leading: Icon(
                            MdiIcons.emailOutline,
                            color: themeData.colorScheme.onBackground,
                          ),
                          title: Text(
                            "Contact us",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          trailing: Icon(
                            MdiIcons.chevronRight,
                            color: themeData.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ));
      },
    );
  }

  _upgradeWidget() {
    return Container(
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: customAppTheme.bgLayer4, width: 1)),
      padding: Spacing.all(16),
      child: Column(
        children: [
          Text(
            "Become Pro",
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                color: themeData.colorScheme.onBackground, fontWeight: 600),
          ),
          Text(
            "Get more done with pro",
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                color: themeData.colorScheme.onBackground, fontWeight: 500),
          ),
          Container(
            margin: Spacing.top(8),
            padding: Spacing.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
                color: themeData.colorScheme.primary),
            child: Text(
              "Upgrade now",
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onPrimary,
                  fontWeight: 600,
                  letterSpacing: 0.3),
            ),
          )
        ],
      ),
    );
  }
}
