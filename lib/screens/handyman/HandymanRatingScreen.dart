
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';


class HandymanRatingScreen extends StatefulWidget {
  @override
  _HandymanRatingScreenState createState() => _HandymanRatingScreenState();
}

class _HandymanRatingScreenState extends State<HandymanRatingScreen> {
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
                  centerTitle: true,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Send us Feedback",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: ListView(

                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding:
                              Spacing.symmetric(vertical: 24, horizontal: 16),
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
                                  margin: Spacing.top(4),
                                  child: Text(
                                      "Do you have a suggestion or found a mistakes?",
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
                          padding: Spacing.only(top: 16, left: 16),
                          child: Text("How was your experience?",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 700)),
                        ),
                        Container(
                          padding: Spacing.only(top: 8, left: 16),
                          child: Row(
                            children: <Widget>[
                              Icon(MdiIcons.emoticonOutline,
                                  color: themeData.colorScheme.primary, size: 32),
                              Container(
                                  margin: Spacing.left(4),
                                  child: Icon(MdiIcons.emoticonNeutralOutline,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(160),
                                      size: 32)),
                              Container(
                                  margin: Spacing.left(4),
                                  child: Icon(MdiIcons.emoticonSadOutline,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(160),
                                      size: 32)),
                            ],
                          ),
                        ),
                        Container(
                          padding: Spacing.only(top: 24, left: 16, right: 16),
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
                          padding: Spacing.only(top: 24, left: 16, right: 16),
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
                              Text("Suggestion",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600)),
                              Container(
                                margin: Spacing.left(8),
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
                              Text("Mistakes",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 600)),
                              Container(
                                margin: Spacing.left(8),
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
                          margin: Spacing.all(24),
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
                            ),
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }
}
