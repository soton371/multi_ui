/*
* File : Feedback Form
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FeedbackFormWidget extends StatefulWidget {
  @override
  _FeedbackFormWidgetState createState() => _FeedbackFormWidgetState();
}

class _FeedbackFormWidgetState extends State<FeedbackFormWidget> {
  int? _radioValue = 1;
  late ThemeData themeData;

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
                  title: Text("Feedback Form",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        color: themeData.colorScheme.background,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Send us your feedback!",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 700),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                    "Do you have a suggestion or found a bug?",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500))),
                            Text("Let us know by fill this form",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 500)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16, left: 16),
                        child: Text("How was your experience?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 16),
                        child: Row(
                          children: <Widget>[
                            Icon(MdiIcons.emoticonOutline,
                                color: themeData.colorScheme.primary, size: 32),
                            Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Icon(MdiIcons.emoticonNeutralOutline,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 32)),
                            Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Icon(MdiIcons.emoticonSadOutline,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(160),
                                    size: 32)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Describe your experience",
                            isDense: true,
                            filled: true,
                            fillColor: themeData.colorScheme.background,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          textCapitalization: TextCapitalization.sentences,
                          minLines: 5,
                          maxLines: 10,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              visualDensity: VisualDensity.compact,
                              activeColor: themeData.colorScheme.primary,
                              groupValue: _radioValue,
                              onChanged: (int? value) {
                                setState(() {
                                  _radioValue = value;
                                });
                              },
                            ),
                            Text("Bug",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 600)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Radio(
                                value: 2,
                                visualDensity: VisualDensity.compact,
                                activeColor: themeData.colorScheme.primary,
                                groupValue: _radioValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                },
                              ),
                            ),
                            Text("Suggestion",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 600)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Radio(
                                value: 3,
                                visualDensity: VisualDensity.compact,
                                activeColor: themeData.colorScheme.primary,
                                groupValue: _radioValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    _radioValue = value;
                                  });
                                },
                              ),
                            ),
                            Text("Others",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 600)),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 24, left: 24, right: 24, bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(28),
                              blurRadius: 4,
                              offset:
                                  Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(

                          onPressed: () {},
                          child: Text(
                            "Send Feedback",
                            style: themeData.textTheme.bodyText1!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.onSecondary)),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                          ),                        ),
                      ),
                    ],
                  ),
                ))));
      },
    );
  }
}
