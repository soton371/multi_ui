import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'SelectServiceScreen.dart';
import 'WorkerInformationScreen.dart';

class HandymanHomeScreen extends StatefulWidget {
  @override
  _HandymanHomeScreenState createState() => _HandymanHomeScreenState();
}

class _HandymanHomeScreenState extends State<HandymanHomeScreen> {
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
                floatingActionButton: FloatingActionButton(
                    backgroundColor: themeData.colorScheme.primary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectServiceScreen()));
                    },
                    child: Icon(MdiIcons.plus,color: themeData.colorScheme.onPrimary,),),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.top(48),
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 0, 24, 0),
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          child: Image(
                            image: AssetImage('./assets/images/avatar-1.jpg'),
                            width: MySize.size44,
                            height: MySize.size44,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 0, 0),
                        child: Text(
                          "Hello",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              xMuted: true,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: Spacing.left(24),
                        child: Text(
                          "Denish!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline4,
                              letterSpacing: -0.5,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 24, 0),
                        child: Column(
                          children: [
                            singleWorker(
                                image: './assets/images/avatar.jpg',
                                name: "Dolcie Pineda",
                                profession: "Plumber",
                                perHour: 9.5,
                                rate: 4.5,
                                status: "Pending",
                                statusColor: customAppTheme.disabledColor),
                            singleWorker(
                                image: './assets/images/avatar-1.jpg',
                                name: "Dainton Mccoy",
                                profession: "Home Painter",
                                perHour: 15,
                                rate: 5,
                                status: "Approved",
                                statusColor: themeData.colorScheme.primary),
                            singleWorker(
                                image: './assets/images/avatar-2.jpg',
                                name: "Sid Moore",
                                profession: "Cleaner",
                                perHour: 8,
                                rate: 4,
                                status: "Rejected",
                                statusColor: customAppTheme.colorError),
                            singleWorker(
                                image: './assets/images/avatar-3.jpg',
                                name: "Eliana Rees",
                                profession: "Cook",
                                perHour: 10,
                                rate: 4.2,
                                status: "In Process",
                                statusColor: customAppTheme.colorInfo),
                          ],
                        ),
                      ),
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
      double? rate,
      required String status,
      Color? statusColor}) {
    return Container(
      margin: Spacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customAppTheme.bgLayer4, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      padding: Spacing.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkerInformationScreen()));
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
                        Text(
                          status,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: statusColor,
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
