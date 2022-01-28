import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'BookServiceScreen.dart';

class SingleServiceScreen extends StatefulWidget {
  @override
  _SingleServiceScreenState createState() => _SingleServiceScreenState();
}

class _SingleServiceScreenState extends State<SingleServiceScreen> {
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
                    "Cleaning",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.fromLTRB(24, 16, 24, 0),
                    children: [
                      singleWorker(
                          image: './assets/images/avatar.jpg',
                          name: "Dolcie Pineda",
                          profession: "Plumber",
                          perHour: 9.5,
                          rate: 4.5),
                      singleWorker(
                          image: './assets/images/avatar-1.jpg',
                          name: "Dainton Mccoy",
                          profession: "Home Painter",
                          perHour: 15,
                          rate: 5),
                      singleWorker(
                          image: './assets/images/avatar-2.jpg',
                          name: "Sid Moore",
                          profession: "Cleaner",
                          perHour: 8,
                          rate: 4),
                      singleWorker(
                          image: './assets/images/avatar-3.jpg',
                          name: "Eliana Rees",
                          profession: "Cook",
                          perHour: 10,
                          rate: 4.2),
                      singleWorker(
                          image: './assets/images/avatar-4.jpg',
                          name: "Giles Nunez",
                          profession: "Carpenter",
                          perHour: 11,
                          rate: 4.8),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "More",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.primary),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate}) {
    return Container(
      margin: Spacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customAppTheme.bgLayer4, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      padding: Spacing.all(16),
      child: InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookServiceScreen()));

        },
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                child: Image(
                  image: AssetImage(image),
                  width: MySize.size72,
                  height: MySize.size72,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                      ),
                    ),
                    Text(
                      profession,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600,
                          xMuted: true),
                    ),
                    Container(
                      margin: Spacing.top(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                rate.toString(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              )
                            ],
                          ),
                          Text(
                            "\$" + perHour.toString() + " per Hour",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500,
                                letterSpacing: 0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
