import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/event/EventFilterDialog.dart';
import 'package:UIKit/screens/event/EventSingleEventScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int? selectedCategory = 0;

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
                padding: Spacing.top(48),
                children: [
                  Container(
                    margin: Spacing.fromLTRB(24, 0, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today 24 Aug, 2020",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 400,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Container(
                                child: Text(
                                  "Discover Events",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontSize: 24,
                                      fontWeight: 700,
                                      letterSpacing: -0.3,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              padding: Spacing.all(10),
                              decoration: BoxDecoration(
                                  color: customAppTheme.bgLayer1,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: customAppTheme.shadowColor,
                                        blurRadius: MySize.size4!)
                                  ]),
                              child: Icon(
                                MdiIcons.bell,
                                size: MySize.size18,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(160),
                              ),
                            ),
                            Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                width: MySize.size6,
                                height: MySize.size6,
                                decoration: BoxDecoration(
                                    color: customAppTheme.colorError,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8!)),
                            child: Image(
                              image: AssetImage('./assets/images/avatar-2.jpg'),
                              width: MySize.size36,
                              height: MySize.size36,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 24, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: Spacing.vertical(4),
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                border: Border.all(
                                    color: customAppTheme.bgLayer3, width: 1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!))),
                            child: Row(
                              children: [
                                Container(
                                  margin: Spacing.left(12),
                                  child: Icon(
                                    MdiIcons.magnify,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                    size: MySize.size16,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: Spacing.left(12),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      decoration: InputDecoration(
                                        fillColor: customAppTheme.bgLayer1,
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            muted: true,
                                            fontWeight: 500),
                                        hintText: "Find Events...",
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: true,
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    EventFilterDialog());
                          },
                          child: Container(
                            margin: Spacing.left(16),
                            padding: Spacing.all(8),
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.primary,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!)),
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.colorScheme.primary
                                          .withAlpha(80),
                                      blurRadius: MySize.size4!,
                                      offset: Offset(0, MySize.size2))
                                ]),
                            child: Icon(
                              MdiIcons.tune,
                              size: MySize.size20,
                              color: themeData.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(8),
                    padding: Spacing.vertical(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: Spacing.left(12),
                            child: singleCategory(
                                title: "All",
                                iconData: MdiIcons.ballotOutline,
                                index: 0),
                          ),
                          singleCategory(
                              title: "Birthday",
                              iconData: MdiIcons.cakeVariant,
                              index: 1),
                          singleCategory(
                              title: "Party",
                              iconData: MdiIcons.partyPopper,
                              index: 2),
                          singleCategory(
                              title: "Talks",
                              iconData: MdiIcons.chatOutline,
                              index: 3),
                          Container(
                            margin: Spacing.right(24),
                            child: singleCategory(
                                title: "Food",
                                iconData: MdiIcons.food,
                                index: 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 4, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Popular",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ),
                        Text(
                          "View All",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 600,
                              color: themeData.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: Spacing.left(24),
                            child: singleEvent(
                                title: "Flutter Test",
                                image: './assets/design/pattern-1.png',
                                date: "04",
                                month: "May",
                                subject: "California, US",
                                time: "07:30 PM - 09:00 PM",
                                width: MySize.safeWidth! * 0.6),
                          ),
                          Container(
                            margin: Spacing.left(16),
                            child: singleEvent(
                                title: "Flutter Dev",
                                image: './assets/images/social/post-l1.jpg',
                                date: "29",
                                month: "Feb",
                                subject: "California, US",
                                time: "07:30 PM - 09:00 PM",
                                width: MySize.safeWidth! * 0.6),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(16,0,24,0),
                            child: singleEvent(
                                title: "Flutter Test",
                                image: './assets/design/pattern-1.png',
                                date: "04",
                                month: "May",
                                subject: "California, US",
                                time: "07:30 PM - 09:00 PM",
                                width: MySize.safeWidth! * 0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    child: Text(
                      "This Weekend",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700,
                          color: themeData.colorScheme.onBackground),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 16),
                    child: singleEvent(
                        title: "Flutter Test",
                        image: './assets/design/pattern-1.png',
                        date: "04",
                        month: "May",
                        subject: "California, US",
                        time: "07:30 PM - 09:00 PM",
                        width: MySize.safeWidth! - MySize.size48!),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget singleCategory({IconData? iconData, required String title, int? index}) {
    bool isSelected = (selectedCategory == index);
    return InkWell(
        onTap: () {
          if (!isSelected) {
            setState(() {
              selectedCategory = index;
            });
          }
        },
        child: Container(
          margin: Spacing.fromLTRB(12, 8, 0, 8),
          decoration: BoxDecoration(
              color: isSelected
                  ? themeData.colorScheme.primary
                  : customAppTheme.bgLayer1,
              border: Border.all(
                  color: customAppTheme.bgLayer3, width: isSelected ? 0 : 0.8),
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(80),
                          blurRadius: MySize.size6!,
                          spreadRadius: 1,
                          offset: Offset(0, MySize.size2))
                    ]
                  : []),
          padding: Spacing.fromLTRB(16, 8, 16, 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: MySize.size22,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
              ),
              Container(
                margin: Spacing.left(8),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: isSelected
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.onBackground),
                ),
              )
            ],
          ),
        ));
  }

  Widget singleEvent(
      {required String image,
      required String date,
      required String month,
      required String title,
      required String subject,
      required String time,
      required double width}) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventSingleEventScreen()));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            border: Border.all(color: customAppTheme.bgLayer3, width: 0.8),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size8!),
                        topRight: Radius.circular(MySize.size8!)),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      width: width,
                      height: width * 0.55,
                    ),
                  ),
                  Positioned(
                    bottom: -MySize.size16!,
                    left: MySize.size16,
                    child: Container(
                      padding: Spacing.fromLTRB(8, 4, 8, 4),
                      decoration: BoxDecoration(
                          color: customAppTheme.bgLayer1,
                          border: Border.all(
                              color: customAppTheme.bgLayer3, width: 0.5),
                          boxShadow: [
                            BoxShadow(
                                color: customAppTheme.shadowColor.withAlpha(150),
                                blurRadius: 1,
                                offset: Offset(0, 1))
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!))),
                      child: Column(
                        children: [
                          Text(
                            date,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            month,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                fontSize: 11,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: Spacing.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Container(
                    margin: Spacing.top(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontSize: 12,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    xMuted: true),
                              ),
                              Container(
                                margin: Spacing.top(2),
                                child: Text(
                                  time,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 10,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Icon(
                            MdiIcons.heartOutline,
                            color: themeData.colorScheme.primary,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
