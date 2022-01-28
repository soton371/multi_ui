import 'package:UIKit/screens/news/NewsFullApp.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class NewsCategoryScreen extends StatefulWidget {
  @override
  _NewsCategoryScreenState createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

  List<String> selectedChoices = [];

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
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    "Select Category",
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.subtitle1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600,
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsFullApp()));
                  },
                  elevation: 2,
                  label: Text(
                    "DONE",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600,
                        color: themeData.colorScheme.onPrimary,
                        letterSpacing: 0.3),
                  ),
                  icon: Icon(
                    MdiIcons.arrowRight,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  padding: Spacing.all(24),
                  child: Wrap(
                    children: _buildChoiceList(),
                  ),
                )));
      },
    );
  }

  _buildChoiceList() {
    List<String> categoryList = [
      "ECom",
      "Automobile",
      "Crimes",
      "Business",
      "Fitness",
      "Astro",
      "Politics",
      "Relationship",
      "Food",
      "Electronics",
      "Health",
      "Tech",
      "Entertainment",
      "World",
      "Sports",
      "Other",
    ];

    List<Widget> choices = [];
    categoryList.forEach((item) {
      choices.add(Container(
        padding: Spacing.all(8),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              selectedChoices.contains(item)
                  ? Icon(
                      MdiIcons.check,
                      size: MySize.size16,
                      color: themeData.colorScheme.onPrimary,
                    )
                  : Container(),
              selectedChoices.contains(item)
                  ? SizedBox(
                      width: MySize.size8,
                    )
                  : Container(),
              Text(
                item,
                style: themeData.textTheme.bodyText2!.merge(TextStyle(
                    color: selectedChoices.contains(item)
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.onBackground)),
              ),
            ],
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }
}
