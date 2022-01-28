import 'package:UIKit/screens/news/NewsEditorProfileScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SingleNewsScreen extends StatefulWidget {
  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
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
                body: Container(
              padding: Spacing.all(24),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: Spacing.top(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: customAppTheme.bgLayer1,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: customAppTheme.shadowColor,
                                      spreadRadius: MySize.size2,
                                      blurRadius: MySize.size8!,
                                      offset: Offset(0, MySize.size4!))
                                ]),
                            padding: Spacing.all(12),
                            child: Icon(
                              MdiIcons.chevronLeft,
                              color: themeData.colorScheme.onBackground,
                              size: MySize.size20,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: customAppTheme.bgLayer1,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: customAppTheme.shadowColor,
                                    spreadRadius: MySize.size2,
                                    blurRadius: MySize.size8!,
                                    offset: Offset(0, MySize.size4!))
                              ]),
                          padding: Spacing.all(12),
                          child: Icon(
                            MdiIcons.bookmarkOutline,
                            color: themeData.colorScheme.onBackground,
                            size: MySize.size20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MySize.size8,),
                  Expanded(
                      child: ListView(
                    padding: Spacing.fromLTRB(0, 16, 0, 16),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size24!)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      customAppTheme.shadowColor.withAlpha(120),
                                  blurRadius: MySize.size24!,
                                  spreadRadius: MySize.size4!)
                            ]),
                        child: Column(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size24!)),
                              child: Image(
                                image: AssetImage(
                                    './assets/images/all/all-l2.jpg'),
                              ),
                            ),
                            Container(
                              padding: Spacing.all(16),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "14 Passengers Banned By Nona Airlines After bad Behaviour",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline6,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => NewsEditorProfileScreen()));
                                    },
                                    child: Container(
                                      margin: Spacing.top(16),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(MySize.size14!)),
                                            child: Image(
                                              image: AssetImage(
                                                  './assets/images/avatar-2.jpg'),
                                              height: MySize.size28,
                                              width: MySize.size28,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MySize.size16,
                                          ),
                                          Text(
                                            "John smith",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 600,
                                                xMuted: true),
                                          ),
                                          Expanded(child: Container()),
                                          Text(
                                            "10 Jan, 2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500,
                                                xMuted: true),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Text(Generator.getParagraphsText(
                            paragraph: 4,
                            words: 30,
                            noOfNewLine: 2,
                            withHyphen: false)),
                      ),
                    ],
                  )),
                  Container(
                    decoration: BoxDecoration(
                        color: customAppTheme.bgLayer1,
                        boxShadow: [
                          BoxShadow(
                              color: customAppTheme.shadowColor,
                              spreadRadius: 1,
                              blurRadius: MySize.size4!,
                              offset: Offset(0, MySize.size2))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    padding: Spacing.fromLTRB(16, 4, 16, 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Write a comment"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  themeData.colorScheme.primary.withAlpha(60)),
                          padding: Spacing.all(8),
                          child: Icon(
                            MdiIcons.sendOutline,
                            color: themeData.colorScheme.primary,
                            size: MySize.size20,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }
}
