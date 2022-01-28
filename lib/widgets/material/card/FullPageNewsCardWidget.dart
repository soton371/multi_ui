/*
* File : Full Page News Card
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class FullPageNewsCardWidget extends StatefulWidget {
  @override
  _FullPageNewsCardWidgetState createState() => _FullPageNewsCardWidgetState();
}

class _FullPageNewsCardWidgetState extends State<FullPageNewsCardWidget> {
  late ThemeData themeData;

  String _newsContent =
      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.";

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    print(MediaQuery.of(context).size);
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
                  title: Text("News",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    padding: EdgeInsets.all(MySize.size16!),
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Image(
                              image:
                                  AssetImage('./assets/images/all/all-p3.jpg'),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MySize.size24!,
                                right: MySize.size24!,
                                top: MySize.size24!,
                                bottom: MySize.size8!),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("March 20, 2020",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 700,
                                        )),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: MySize.size16!),
                                      child: Text("What happened At CUBA?",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.headline6,
                                              fontWeight: 700)),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: MySize.size16!),
                                      child: Text(_newsContent,
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 500,
                                              height: 1.2)),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: MySize.size8!),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size16!),
                                              child: Icon(
                                                MdiIcons.eye,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                                size: 20,
                                              )),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MySize.size8!),
                                            child: Text("220".toString(),
                                                style: AppTheme.getTextStyle(
                                                    themeData.textTheme.caption,
                                                    fontWeight: 600,
                                                    letterSpacing: 0.3)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: ElevatedButton(

                                            onPressed: () {},
                                            child: Text("READ MORE",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight: 700,
                                                    color: themeData.colorScheme
                                                        .onPrimary))),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))));
      },
    );
  }
}
