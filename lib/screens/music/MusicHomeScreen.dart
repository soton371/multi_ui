/*
* File : Music Home
* Version : 1.0.0
* */


import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MusicHomeScreen extends StatefulWidget {
  @override
  _MusicHomeScreenState createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
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
                padding: EdgeInsets.only(top: MySize.size16!),
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text("Home",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              fontWeight:600,
                              letterSpacing: 0.2)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size12!, left: MySize.size16!, bottom: MySize.size4!),
                    child: Text(
                      "Recently",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600,
                          letterSpacing: 0),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: MySize.size8!),
                          child: _SingleSongWidget(
                            image: './assets/images/music/singer-1.jpg',
                            text: "Song one",
                            height: 110,
                            radius: 6,
                          ),
                        ),
                        _SingleSongWidget(
                          image: './assets/images/music/singer-2.jpg',
                          text: "Song two",
                          height: 110,
                          radius: 6,
                        ),
                        _SingleSongWidget(
                          image: './assets/images/music/singer-3.jpg',
                          text: "Song three",
                          height: 110,
                          radius: 6,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: MySize.size8!),
                          child: _SingleSongWidget(
                            image: './assets/images/music/singer-4.jpg',
                            text: "Song four",
                            height: 110,
                            radius: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, bottom: MySize.size4!),
                    child: Text(
                      "Trending",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600,
                          letterSpacing: 0),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: MySize.size8!),
                          child: _SingleSongWidget(
                            image: './assets/images/music/singer-4.jpg',
                            text: "Trend one",
                            height: 110,
                            radius: 6,
                          ),
                        ),
                        _SingleSongWidget(
                          image: './assets/images/music/singer-3.jpg',
                          text: "Trend two",
                          height: 110,
                          radius: 6,
                        ),
                        _SingleSongWidget(
                          image: './assets/images/music/singer-2.jpg',
                          text: "Trend three",
                          height: 110,
                          radius: 6,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: MySize.size8!),
                          child: _SingleSongWidget(
                            image: './assets/images/music/singer-1.jpg',
                            text: "Trend four",
                            height: 110,
                            radius: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!),
                    child: Text("Events of 2020",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            fontWeight: 600,
                            letterSpacing: 0)),
                  ),
                  Container(
                    margin: EdgeInsets.all(MySize.size8!),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        _SingleSongWidget(
                          image: './assets/images/music/event-1.jpg',
                          text: "Event one",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size24!,
                        ),
                        _SingleSongWidget(
                          image: './assets/images/music/event-2.jpg',
                          text: "Event two",
                          height: MediaQuery.of(context).size.width * 0.5 - MySize.size24!,
                        ),
                        _SingleSongWidget(
                            image: './assets/images/music/event-3.jpg',
                            text: "Event three",
                            height:
                                MediaQuery.of(context).size.width * 0.5 - MySize.size24!),
                        _SingleSongWidget(
                            image: './assets/images/music/event-1.jpg',
                            text: "Event four",
                            height:
                                MediaQuery.of(context).size.width * 0.5 - MySize.size24!),
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

class _SingleSongWidget extends StatelessWidget {
  final String image, text;
  final double? height, radius;

  const _SingleSongWidget(
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
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius:
                  BorderRadius.circular(radius == null ? 8.0 : radius!),
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
                    fontWeight: 500),
              ))
        ],
      ),
    );
  }
}
