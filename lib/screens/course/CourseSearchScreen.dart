import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'CourseDetailsScreen.dart';

class CourseSearchScreen extends StatefulWidget {
  @override
  _CourseSearchScreenState createState() => _CourseSearchScreenState();
}

class _CourseSearchScreenState extends State<CourseSearchScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24!) / ((width / 2 - MySize.size24!) + 40);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return SafeArea(
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getThemeFromThemeMode(themeType),
              home: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                      color: customAppTheme.bgLayer1,
                      child: ListView(
                        padding: Spacing.top(24),
                        children: <Widget>[
                          Container(
                            margin: Spacing.horizontal(24),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: customAppTheme.bgLayer3,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8!)),

                                    ),
                                    padding: Spacing.all(6),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: MySize.size16!),
                                            child: TextFormField(
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  letterSpacing: 0,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500),
                                              decoration: InputDecoration(
                                                hintText:
                                                    "Search courses skills and videos",
                                                hintStyle:
                                                    AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .caption,
                                                        letterSpacing: 0,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground,
                                                        fontWeight: 500),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          MySize.size8!),
                                                    ),
                                                    borderSide:
                                                        BorderSide.none),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size8!),
                                                        ),
                                                        borderSide:
                                                            BorderSide.none),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size8!),
                                                        ),
                                                        borderSide:
                                                            BorderSide.none),
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                              ),
                                              textInputAction:
                                                  TextInputAction.search,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(MySize.size4!),
                                          decoration: BoxDecoration(
                                              color:
                                                  themeData.colorScheme.primary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size8!))),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                MySize.size8!),
                                            child: Icon(
                                              MdiIcons.magnify,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              size: MySize.size20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext buildContext) {
                                          return FilterWidget(
                                            themeType: value.themeMode(),
                                          );
                                        });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16!),
                                    decoration: BoxDecoration(
                                      color: themeData.backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8!)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: customAppTheme.shadowColor,
                                          blurRadius: MySize.size4!,
                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.all(MySize.size8!),
                                    child: Icon(
                                      MdiIcons.tune,
                                      color: themeData.colorScheme.primary,
                                      size: MySize.size20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 24, 0, 0),
                            child: Text(
                              "Category",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700),
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 0, 24, 0),
                            child: GridView.count(
                              physics: ClampingScrollPhysics(),
                              padding: Spacing.vertical(8),
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              childAspectRatio: 2,
                              crossAxisSpacing: MySize.size16!,
                              mainAxisSpacing: MySize.size16!,
                              children: <Widget>[
                                singleCategory(
                                    title: "UI",
                                    image:
                                        './assets/images/course/subject-1.jpg',
                                    courses: 25),
                                singleCategory(
                                    title: "Business",
                                    image:
                                        './assets/images/course/subject-2.jpg',
                                    courses: 80),
                                singleCategory(
                                    title: "Lifestyle",
                                    image:
                                        './assets/images/course/subject-3.jpg',
                                    courses: 120),
                                singleCategory(
                                    title: "Marketing",
                                    image:
                                        './assets/images/course/subject-4.jpg',
                                    courses: 50),
                                singleCategory(
                                    title: "UX",
                                    image:
                                        './assets/images/course/subject-5.jpg',
                                    courses: 145),
                                singleCategory(
                                    title: "Social",
                                    image:
                                        './assets/images/course/subject-6.jpg',
                                    courses: 15),
                              ],
                            ),
                          ),
                          Container(
                            margin: Spacing.fromLTRB(24, 8, 0, 0),
                            child: Text(
                              "Recommended",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700),
                            ),
                          ),
                          Container(
                            child: GridView.count(
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              padding: Spacing.fromLTRB(24, 16, 24, 16),
                              childAspectRatio: findAspectRatio(
                                  MediaQuery.of(context).size.width),
                              crossAxisSpacing: MySize.size24!,
                              mainAxisSpacing: MySize.size24!,
                              children: <Widget>[
                                singleResult(
                                    title: "React",
                                    image:
                                        "./assets/images/course/subject-1.jpg",
                                    price: 148),
                                singleResult(
                                    title: "Flutter",
                                    image:
                                        "./assets/images/course/subject-2.jpg",
                                    price: 259),
                                singleResult(
                                    title: "Web",
                                    image:
                                        "./assets/images/course/subject-6.jpg",
                                    price: 59),
                                singleResult(
                                    title: "UI / UX",
                                    image:
                                        "./assets/images/course/subject-4.jpg",
                                    price: 99),
                                singleResult(
                                    title: "React Native",
                                    image:
                                        "./assets/images/course/subject-5.jpg",
                                    price: 59),
                              ],
                            ),
                          )
                        ],
                      )))),
        );
      },
    );
  }

  Widget singleResult({required String title, required String image, int? price}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(
              Radius.circular(MySize.size8!),
            ),
            boxShadow: [
              BoxShadow(
                  color: customAppTheme.shadowColor,
                  blurRadius: MySize.size8!,
                  offset: Offset(0, MySize.size2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size8!),
                      topRight: Radius.circular(MySize.size8!)),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                Container(
                  padding: Spacing.fromLTRB(12, 6, 12, 6),
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.primary.withAlpha(240),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySize.size8!),
                        bottomRight: Radius.circular(MySize.size8!)),
                  ),
                  child: Text(
                    "\$ " + price.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onPrimary,
                        fontWeight: 500),
                  ),
                )
              ],
            ),
            Container(
              margin: Spacing.all(6),
              child: Text(
                title,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText1,
                  fontWeight: 600,
                  color: themeData.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleCategory({required String image, required String title, int? courses}) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer2,
            border: Border.all(width: 1.2, color: customAppTheme.bgLayer3),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
        child: Row(
          children: <Widget>[
            Container(
              margin: Spacing.left(8),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size44,
                    width: MySize.size44,
                  )),
            ),
            Container(
              margin: Spacing.horizontal(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                  Text(
                    courses.toString() + "+ Courses",
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0,
                        fontWeight: 500,
                        muted: true),
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

class FilterWidget extends StatefulWidget {
  final int themeType;

  const FilterWidget({Key? key, required this.themeType}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<String> _course,
      _selectedCourse,
      _duration,
      _selectedDuration,
      _type,
      _selectedType;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getThemeFromThemeMode(widget.themeType);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);
    _course = [
      "Physics",
      "Biology",
      "Computer",
      "Maths",
      "Chemistry",
      "Economics",
      "Sport",
      "History",
      "English",
      "Art"
    ];

    _duration = ["1-2 Week", "3-4 Week", "2 Month", "3 Month"];
    _type = ["Beginner", "Intermediate", "Advanced", "Expert"];

    _selectedCourse = ["Maths"];
    _selectedDuration = ["3-4 Week"];
    _selectedType = ["Intermediate"];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> courseWidget = [], durationWidget = [], typeWidget = [];
    int i = 0;
    for (i = 0; i < _course.length; i++) {
      courseWidget.add(InkWell(
        onTap: () {
          setState(() {
            if (_selectedCourse.contains(_course[i])) {
              _selectedCourse.remove(_course[i]);
            } else {
              _selectedCourse.add(_course[i]);
            }
          });
        },
        child: optionCourseChip(
            option: _course[i],
            isSelected: _selectedCourse.contains(_course[i])),
      ));
    }

    for (i = 0; i < _duration.length; i++) {
      durationWidget.add(InkWell(
        onTap: () {
          setState(() {
            if (_selectedDuration.contains(_duration[i])) {
              _selectedDuration.remove(_duration[i]);
            } else {
              _selectedDuration.add(_duration[i]);
            }
          });
        },
        child: optionDurationChip(
            isSelected: _selectedDuration.contains(_duration[i]),
            option: _duration[i]),
      ));
    }
    for (i = 0; i < _type.length; i++) {
      typeWidget.add(optionTypeChip(
          isSelected: _selectedType.contains(_type[i]), option: _type[i]));
    }

    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.size16!),
                topRight: Radius.circular(MySize.size16!))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MySize.size16!,
              left: MySize.size24!,
              right: MySize.size24!,
              bottom: MySize.size16!),
          child: ListView(
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Filter",
                          style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: Spacing.all(6),
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary.withAlpha(40),
                          shape: BoxShape.circle
                        ),
                        child: Icon(MdiIcons.check,color: themeData.colorScheme.primary,size: MySize.size20,),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: Spacing.top(24),
                child: Text(
                  "Course",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              Container(
                margin: Spacing.top(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: courseWidget,
                ),
              ),
              Container(
                margin: Spacing.top(24),
                child: Text(
                  "Type",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              Container(
                margin: Spacing.top(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: typeWidget,
                ),
              ),
              Container(
                margin: Spacing.top(24),
                child: Text(
                  "Duration",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              Container(
                margin: Spacing.top(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: durationWidget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget optionCourseChip({required String option, required bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedCourse.contains(option)) {
            _selectedCourse.remove(option);
          } else {
            _selectedCourse.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary : Colors.transparent,
            border: Border.all(
                color: isSelected
                    ? themeData.colorScheme.primary
                    : customAppTheme.bgLayer4,
                width: 1),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size16!))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }

  Widget optionTypeChip({required String option, required bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedType.contains(option)) {
            _selectedType.remove(option);
          } else {
            _selectedType.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary : Colors.transparent,
            border: Border.all(
                color: isSelected
                    ? themeData.colorScheme.primary
                    : customAppTheme.bgLayer4,
                width: 1),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size16!))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }

  Widget optionDurationChip({required String option, required bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedDuration.contains(option)) {
            _selectedDuration.remove(option);
          } else {
            _selectedDuration.add(option);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                isSelected ? themeData.colorScheme.primary : Colors.transparent,
            border: Border.all(
                color: isSelected
                    ? themeData.colorScheme.primary
                    : customAppTheme.bgLayer4,
                width: 1),
            borderRadius: BorderRadius.all(Radius.circular(MySize.size16!))),
        padding: Spacing.fromLTRB(10, 6, 10, 6),
        child: Text(
          option,
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}
