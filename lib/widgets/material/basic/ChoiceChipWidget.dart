/*
* File : Choice chip
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ChoiceChipWidget extends StatefulWidget {
  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  List<String> _reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil",
    "Other",
  ];

  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChoiceDialog(
              reportList: _reportList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Choice chip",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(20),
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(

                            onPressed: () {
                              _showDialog();
                            },
                            child: Text("Report".toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.button,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onPrimary))),
                      ),
                    ))));
      },
    );
  }
}

class ChoiceDialog extends StatefulWidget {
  final List<String> reportList;

  const ChoiceDialog({Key? key, required this.reportList}) : super(key: key);

  @override
  _ChoiceDialogState createState() => _ChoiceDialogState();
}

class _ChoiceDialogState extends State<ChoiceDialog> {
  List<String> selectedChoices = [];

  late ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(4.0),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: Text(
            item,
            style: themeData.textTheme.bodyText2!.merge(TextStyle(
                color: selectedChoices.contains(item)
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground)),
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

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return AlertDialog(
      title: Text(
        "Report Video",
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
            fontWeight: 600),
      ),
      content: Container(
        child: Wrap(
          children: _buildChoiceList(),
        ),
      ),
      actions: <Widget>[
        FxButton(
          borderRadiusAll: 4,
          backgroundColor: themeData.colorScheme.primary.withAlpha(40),
          child: Text(
            "REPORT",
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                fontWeight: 600,
                color: themeData.colorScheme.primary),
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
