/*
* File : Hotel Room
* Version : 1.0.0
* */


import 'dart:async';
import 'package:UIKit/screens/hotel/HotelReviewScreen.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class HotelRoomScreen extends StatefulWidget {
  @override
  _HotelRoomScreenState createState() => _HotelRoomScreenState();
}

class _HotelRoomScreenState extends State<HotelRoomScreen>
    with TickerProviderStateMixin {
  late ThemeData themeData;
  int _currentPage = 0, _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  late Timer timerAnimation;

  void initState() {
    super.initState();
    timerAnimation = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    // TODO:  dispose
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
  }

  final String _aboutText =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups.";

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: ListView(
              padding: EdgeInsets.zero,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage(
                                  './assets/images/hotel/room-1.jpg'),
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Image(
                              image: AssetImage(
                                  './assets/images/hotel/room-2.jpg'),
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Image(
                              image: AssetImage(
                                  './assets/images/hotel/room-3.jpg'),
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 24,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(MdiIcons.chevronLeft,color: Colors.black,),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(MySize.size16!),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Mandarin Oriental",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight:600,
                                  letterSpacing: 0),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size4!),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.mapMarker,
                                    color: themeData.colorScheme.onBackground,
                                    size: MySize.size16,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: MySize.size2),
                                      child: Text("London bridge",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 500))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color:
                                  themeData.colorScheme.primary.withAlpha(24),
                              child: InkWell(
                                splashColor: themeData.colorScheme.primary
                                    .withAlpha(100),
                                highlightColor:
                                    themeData.primaryColor.withAlpha(20),
                                child: SizedBox(
                                    width: MySize.size44,
                                    height: MySize.size44,
                                    child: Icon(
                                      MdiIcons.shareOutline,
                                      size: MySize.size22,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(240),
                                    )),
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size8!),
                            child: ClipOval(
                              child: Material(
                                color:
                                    themeData.colorScheme.primary.withAlpha(24),
                                child: InkWell(
                                  highlightColor:
                                      themeData.primaryColor.withAlpha(20),
                                  splashColor:
                                      themeData.primaryColor.withAlpha(100),
                                  child: SizedBox(
                                      width: MySize.size44,
                                      height: MySize.size44,
                                      child: Icon(
                                        MdiIcons.heartOutline,
                                        size: MySize.size20,
                                        color: themeData.colorScheme.primary,
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: MySize.size8!, left: MySize.size16!, right: MySize.size16!),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Price",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 500),
                          ),
                          Text(
                            "350 \$",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 700),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: MySize.size32!),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Rating",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "4.6",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 700),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: MySize.size4!),
                                    child:
                                        Generator.buildRatingStar(rating: 4.1))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!, left: MySize.size8!, right: MySize.size8!),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: _FacilityWidget(
                            iconData: MdiIcons.currencyUsd,
                            text: "Low Cost",
                          )),
                          Expanded(
                              child: _FacilityWidget(
                            iconData: MdiIcons.car,
                            text: "Parking",
                          )),
                          Expanded(
                              child: _FacilityWidget(
                            iconData: MdiIcons.partyPopper,
                            text: "Party",
                          )),
                          Expanded(
                              child: _FacilityWidget(
                            iconData: MdiIcons.theater,
                            text: "Theater",
                          )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: _FacilityWidget(
                              iconData: MdiIcons.glassWine,
                              text: "Bar",
                            )),
                            Expanded(
                                child: _FacilityWidget(
                              iconData: MdiIcons.pool,
                              text: "Pool",
                            )),
                            Expanded(
                                child: _FacilityWidget(
                              iconData: MdiIcons.spa,
                              text: "Spa",
                            )),
                            Expanded(
                                child: _FacilityWidget(
                              iconData: MdiIcons.gamepad,
                              text: "Games",
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: MySize.size24!, left: MySize.size16!, right: MySize.size16!),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "About",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            fontWeight: 600),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: MySize.size8!),
                          child: Text(_aboutText,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500)))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: MySize.size8!, top: MySize.size8!),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: TextButton(

                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  transitionsBuilder: (
                                    BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child,
                                  ) =>
                                      FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ),
                                  pageBuilder: (_, __, ___) =>
                                      HotelReviewScreen()));
                        },
                        child: Text(
                          "REVIEW",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
                              color: themeData.colorScheme.primary),
                        )),
                  ),
                ),
              ],
            )));
      },
    );
  }
}

class _FacilityWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const _FacilityWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: MySize.size8!, right: MySize.size8!),
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(28),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: themeData.colorScheme.primary,
              size: 28,
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!),
              child: Text(
                text,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    letterSpacing: 0,
                    fontWeight: 600,
                    color: themeData.colorScheme.onBackground),
              ),
            )
          ],
        ),
      ),
    );
  }
}
