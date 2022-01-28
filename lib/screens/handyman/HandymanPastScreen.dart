import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'HandymanRatingScreen.dart';

class HandymanPastScreen extends StatefulWidget {
  @override
  _HandymanPastScreenState createState() => _HandymanPastScreenState();
}

class _HandymanPastScreenState extends State<HandymanPastScreen> {
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
                  title: Text(
                    "Past Work",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  centerTitle: true,
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.zero,
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 8, 24, 0),
                        child: Column(
                          children: [
                            pastWork(
                                image: './assets/images/avatar-4.jpg',
                                name: "Sid Moore",
                                profession: "Plumber",
                                bill: 19,
                                rate: 4.5,
                                isRated: true),
                            pastWork(
                              image: './assets/images/avatar-5.jpg',
                              name: "Dainton Mccoy",
                              profession: "Home Painter",
                              bill: 15,
                              rate: 5,
                              isRated: true,
                            ),
                            pastWork(
                              image: './assets/images/avatar.jpg',
                              name: "Dolcie Pineda",
                              profession: "Cleaner",
                              bill: 8,
                              rate: 4,
                              isRated: false,
                            ),
                            pastWork(
                              image: './assets/images/avatar-5.jpg',
                              name: "Eliana Rees",
                              profession: "Cook",
                              bill: 27,
                              rate: 4.2,
                              isRated: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
      },
    );
  }

  Widget pastWork(
      {required String image,
      required String name,
      required String profession,
      double? bill,
      double? rate,
      required bool isRated}) {
    return Container(
      margin: Spacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customAppTheme.bgLayer4, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      padding: Spacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HandymanRatingScreen()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600,
                          ),
                        ),
                        isRated
                            ? Text(
                                "Rated",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: customAppTheme.disabledColor,
                                    fontWeight: 600),
                              )
                            : Text(
                                "Rate",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 600),
                              )
                      ],
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
                            "Payed \$" + bill.toString(),
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
