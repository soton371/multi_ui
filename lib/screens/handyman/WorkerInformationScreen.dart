
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'BookServiceScreen.dart';

class WorkerInformationScreen extends StatefulWidget {
  @override
  _WorkerInformationScreenState createState() =>
      _WorkerInformationScreenState();
}

class _WorkerInformationScreenState extends State<WorkerInformationScreen> {
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
                backgroundColor: customAppTheme.bgLayer1,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer1,
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
                    "Sid Moore",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: ListView(
                  padding: EdgeInsets.all(MySize.size24!),
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8!)),
                            child: Image(
                              image: AssetImage('./assets/images/avatar-2.jpg'),
                              width: MySize.size140,
                              height: MySize.size140,
                            ),
                          ),
                        ),
                        Container(
                          margin: Spacing.left(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How far",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    xMuted: true),
                              ),
                              Text(
                                "3.2 km",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Container(
                                margin: Spacing.top(8),
                                child: Text(
                                  "Charges per hour",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      xMuted: true),
                                ),
                              ),
                              Text(
                                "\$ 19",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Container(
                                margin: Spacing.top(8),
                                child: Text(
                                  "Rating",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      xMuted: true),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    MdiIcons.star,
                                    color: Generator.starColor,
                                    size: MySize.size18,
                                  ),
                                  SizedBox(
                                    width: MySize.size4,
                                  ),
                                  Text(
                                    "4.5",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sid Moore",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              ), Text(
                                "Plumber",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    xMuted: true),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ClipOval(
                                child: Material(
                                  color: Colors.transparent, // button color
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(MySize.size28!),
                                      side: BorderSide(
                                          color: themeData.colorScheme.primary
                                      )
                                  ),
                                  child: InkWell(
                                    splashColor: themeData.colorScheme.primary.withAlpha(100),
                                    child: SizedBox(
                                        width: MySize.size38,
                                        height: MySize.size38,
                                        child: Icon(MdiIcons.phone,color: themeData.colorScheme.primary,size: 16,)),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                              Container(
                                margin: Spacing.left(10),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.transparent, // button color
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(MySize.size28!),
                                        side: BorderSide(
                                            color: themeData.colorScheme.primary
                                        )
                                    ),
                                    child: InkWell(
                                      splashColor: themeData.colorScheme.primary.withAlpha(100),
                                      child: SizedBox(
                                          width: MySize.size38,
                                          height: MySize.size38,
                                          child: Icon(MdiIcons.email,color: themeData.colorScheme.primary,size: 16,)),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: Text(
                        "About",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600,
                        ),
                      ),
                    ),
                    Container(
                      margin: Spacing.top(8),
                      child: Text(
                        Generator.getParagraphsText(
                            paragraph: 3, words: 20, noOfNewLine: 1),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            muted: true),
                      ),
                    ),
                    Container(
                      margin: Spacing.top(24),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => BookServiceScreen()));
                        },
                        child: Text(
                          "BOOK NOW",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              letterSpacing: 0.4,
                              fontWeight: 600,
                              color: themeData.colorScheme.onPrimary),
                        ),

                      ),
                    )
                  ],
                )));
      },
    );
  }
}
