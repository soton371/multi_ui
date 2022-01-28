import 'package:UIKit/customapps/shopping/shopping_chat_screen.dart';
import 'package:UIKit/screens/handyman/HandymanSubscriptionScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class HandymanProfileScreen extends StatefulWidget {
  @override
  _HandymanProfileScreenState createState() => _HandymanProfileScreenState();
}

class _HandymanProfileScreenState extends State<HandymanProfileScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder:
          (BuildContext buildContext, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  backgroundColor: customAppTheme.bgLayer1,
                  body: ListView(
                    padding: EdgeInsets.all(MySize.size24!),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MySize.size80,
                              height: MySize.size80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "./assets/images/avatar-3.jpg"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8!),
                              child: Text("Derrick Malone",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600,
                                      letterSpacing: 0)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        padding: EdgeInsets.only(
                            left: MySize.size16!,
                            top: MySize.size8!,
                            bottom: MySize.size8!,
                            right: MySize.size16!),
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.primary,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size4!))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HandymanSubscriptionScreen()));
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(MdiIcons.informationOutline,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size18),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16!),
                                child: Text(
                                  "Premium member",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: Generator.goldColor,
                                      fontWeight: 600,
                                      letterSpacing: 0.2),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Upgrade",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24!),
                        child: Column(
                          children: <Widget>[
                            singleOption(
                                iconData: MdiIcons.mapMarkerOutline,
                                option: "Address"),
                            Divider(),
                            singleOption(
                                iconData: MdiIcons.creditCardOutline,
                                option: "Subscriptions",
                                navigation: HandymanSubscriptionScreen()),
                            Divider(),
                            singleOption(
                                iconData: MdiIcons.faceAgent,
                                option: "Help \& Support",
                                navigation: ShoppingChatScreen()),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24!),
                              child: ElevatedButton(

                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(context);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.logoutVariant,
                                      color: themeData.colorScheme.onPrimary,
                                      size: MySize.size18,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: MySize.size16!),
                                      child: Text(
                                        "LOGOUT",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            letterSpacing: 0.3,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ));
      },
    );
  }

  Widget singleOption({IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MySize.size8!, horizontal: 0),
      child: InkWell(
        onTap: () {
          if(navigation!=null)
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: MySize.size22,
                color: themeData.colorScheme.onBackground,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: MySize.size16!),
                child: Text(option,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600)),
              ),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: MySize.size22,
                  color: themeData.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
