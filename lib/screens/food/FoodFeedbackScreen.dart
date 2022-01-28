import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FoodFeedbackScreen extends StatefulWidget {
  @override
  _FoodFeedbackScreenState createState() => _FoodFeedbackScreenState();
}

class _FoodFeedbackScreenState extends State<FoodFeedbackScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  bool? checkDT = true, checkQTY = false, checkQ = true, checkOther = false;

  int selectedEmote = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => RatingDialog());
  }

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24!) / ((width / 2 - MySize.size24!) + 50);
  }

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
                appBar: AppBar(
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      size: MySize.size24,
                    ),
                  ),
                  title: Text(
                    "Feedback",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                    color: customAppTheme.bgLayer1,
                    child: ListView(
                      padding: EdgeInsets.only(
                          top: MySize.size24!, bottom: MySize.size24!),
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Text(
                              "How was last order?",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size24!,
                              left: MySize.size24!,
                              right: MySize.size24!),
                          child: feedbackEmote(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size48!,
                              right: MySize.size48!,
                              top: MySize.size32!),
                          child: Column(
                            children: <Widget>[
                              Divider(),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      checkQ = !checkQ!;
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        onChanged: (value) {
                                          setState(() {
                                            checkQ = value;
                                          });
                                        },
                                        visualDensity: VisualDensity.compact,
                                        value: checkQ,
                                        activeColor:
                                            themeData.colorScheme.primary,
                                      ),
                                      Text(
                                        "Quality",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      checkDT = !checkDT!;
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        onChanged: (value) {
                                          setState(() {
                                            checkDT = value;
                                          });
                                        },
                                        visualDensity: VisualDensity.compact,
                                        value: checkDT,
                                        activeColor:
                                            themeData.colorScheme.primary,
                                      ),
                                      Text(
                                        "Delivery Time",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      checkQTY = !checkQTY!;
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        onChanged: (value) {
                                          setState(() {
                                            checkQTY = value;
                                          });
                                        },
                                        visualDensity: VisualDensity.compact,
                                        value: checkQTY,
                                        activeColor:
                                            themeData.colorScheme.primary,
                                      ),
                                      Text(
                                        "Quantity",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      checkOther = !checkOther!;
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        onChanged: (value) {
                                          setState(() {
                                            checkOther = value;
                                          });
                                        },
                                        visualDensity: VisualDensity.compact,
                                        value: checkOther,
                                        activeColor:
                                            themeData.colorScheme.primary,
                                      ),
                                      Text(
                                        "Other",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MySize.size24!,
                              left: MySize.size32!,
                              right: MySize.size32!),
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
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: MySize.size16!),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(14),
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(

                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Review".toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.8)),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget feedbackEmote() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 0;
              });
            },
            child: Icon(
              selectedEmote == 0
                  ? MdiIcons.emoticonSad
                  : MdiIcons.emoticonSadOutline,
              color: selectedEmote == 0
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: MySize.size40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 1;
              });
            },
            child: Icon(
              selectedEmote == 1
                  ? MdiIcons.emoticonNeutral
                  : MdiIcons.emoticonNeutralOutline,
              color: selectedEmote == 1
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: MySize.size40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 2;
              });
            },
            child: Icon(
              selectedEmote == 2
                  ? MdiIcons.emoticonHappy
                  : MdiIcons.emoticonHappyOutline,
              color: selectedEmote == 2
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: MySize.size40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 3;
              });
            },
            child: Icon(
              selectedEmote == 3 ? MdiIcons.emoticon : MdiIcons.emoticonOutline,
              color: selectedEmote == 3
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: MySize.size40,
            ),
          ),
        ],
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(MySize.size8!),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: MySize.size24!,
                  bottom: MySize.size24!,
                  left: MySize.size24!,
                  right: MySize.size24!),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Enjoying Food?",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 700,
                            letterSpacing: 0)),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      child: Text("How would you rate our service?",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              letterSpacing: 0.3)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextButton(

                              onPressed: () {  },
                              child: Text(
                                "NOT NOW",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground),
                              )),
                          TextButton(

                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "RATE IT",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 600),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
