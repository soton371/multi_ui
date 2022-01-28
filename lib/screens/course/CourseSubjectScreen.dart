import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CourseSubjectScreen extends StatefulWidget {
  @override
  _CourseSubjectScreenState createState() => _CourseSubjectScreenState();
}

class _CourseSubjectScreenState extends State<CourseSubjectScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primary,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MySize.size16!),
                                  bottomRight: Radius.circular(MySize.size16!))),
                          padding: Spacing.fromLTRB(36, 48, 36, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    MdiIcons.chevronLeft,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size24,
                                  ),
                                ),
                              ),
                              Container(
                                margin: Spacing.top(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Biology",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.headline5,
                                              fontWeight: 700,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                        Text(
                                          "DS100",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              fontWeight: 500,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size24!)),
                                        child: Image(
                                            image: AssetImage(
                                                './assets/images/avatar-2.jpg'),
                                            width: MySize.size48,
                                            height: MySize.size48),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: Spacing.top(24),
                                child: Text(
                                  "60 / 62 students",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 500),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              padding: Spacing.zero,
                              children: <Widget>[
                                Container(
                                  padding: Spacing.fromLTRB(36, 16, 36, 0),
                                  margin: Spacing.top(16),
                                  child: Text(
                                    "Resources",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    physics: ClampingScrollPhysics(),
                                    crossAxisCount: 2,
                                    padding: Spacing.fromLTRB(32, 16, 32, 16),
                                    mainAxisSpacing: MySize.size24!,
                                    crossAxisSpacing: MySize.size24!,
                                    shrinkWrap: true,
                                    childAspectRatio: 1,
                                    children: <Widget>[
                                      singleResource(
                                          title: "All",
                                          isSelected: true,
                                          resource: "14 Files"),
                                      singleResource(
                                          title: "Lectures",
                                          iconData: MdiIcons.fileVideoOutline,
                                          resource: "3 Videos"),
                                      singleResource(
                                          title: "Reading Material",
                                          isSelected: false,
                                          iconData: MdiIcons.filePdfOutline,
                                          resource: "3 PDFs"),
                                      singleResource(
                                          title: "Assignment",
                                          isSelected: false,
                                          iconData: MdiIcons.fileEditOutline,
                                          resource: "3 Lessons"),
                                      singleResource(
                                          title: "Tasks",
                                          isSelected: false,
                                          resource: "3 Task"),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget singleResource(
      {required String title,
      required String resource,
      bool isSelected = false,
      IconData iconData = MdiIcons.fileOutline}) {
    return Container(
      padding: Spacing.all(16),
      decoration: BoxDecoration(
          color: isSelected
              ? themeData.colorScheme.primary
              : customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            boxShadow: [
              isSelected ? BoxShadow(
                color:themeData.colorScheme.primary.withAlpha(100),
                blurRadius: MySize.size4!,
                offset: Offset(0, MySize.size2)):BoxShadow(color: Colors.transparent)
          ],
          border: isSelected
              ? Border.symmetric()
              : Border.all(color: customAppTheme.bgLayer4, width: 1.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
                fontWeight: 600),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(
                  iconData,
                  color: isSelected
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground,
                  size: MySize.size18,
                ),
              ),
              Container(
                margin: Spacing.left(4),
                child: Text(
                  resource,
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.caption,
                    color: isSelected
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
