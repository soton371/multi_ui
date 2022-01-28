/*
* File : Music Podcast
* Version : 1.0.0
* */

import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MusicPodcastScreen extends StatefulWidget {
  @override
  _MusicPodcastScreenState createState() => _MusicPodcastScreenState();
}

class _MusicPodcastScreenState extends State<MusicPodcastScreen> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return SafeArea(
          top: true,
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
              home: Scaffold(
                  body: ListView(
                padding: EdgeInsets.only(top: 16),
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text("Podcast",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Recent Shows",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600,
                              letterSpacing: 0),
                        ),
                        Text(
                          "View All",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: MySize.size8!, left: MySize.size8!, top: MySize.size8!),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-1.jpg',
                          text: "UX",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-2.jpg',
                          text: "Corona",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-3.jpg',
                          text: "Design Studio",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-4.jpg',
                          text: "From Temple",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Popular Shows",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 700,
                              letterSpacing: 0),
                        ),
                        Text(
                          "View All",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(MySize.size8!),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-1.jpg',
                          text: "UX",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-2.jpg',
                          text: "Corona",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-3.jpg',
                          text: "Design Studio",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                        _SingleShowWidget(
                          image: './assets/images/music/podcast-4.jpg',
                          text: "From Temple",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size30!,
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
        );
      },
    );
  }
}

class _SingleShowWidget extends StatelessWidget {
  final String image, text;
  final double? height, radius;

  const _SingleShowWidget(
      {Key? key,
      required this.image,
      required this.text,
      required this.height,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(MySize.size8!),
      child: Column(
        children: <Widget>[
          ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(MySize.size16!),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: height,
                width: height,
              )),
          Container(
              margin: EdgeInsets.only(top: MySize.size4!),
              child: Text(
                text,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    letterSpacing: 0.2, fontWeight: 500),
              ))
        ],
      ),
    );
  }
}
