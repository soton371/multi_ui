/*
* File : Hotel Review
* Version : 1.0.0
* */


import 'dart:async';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class HotelReviewScreen extends StatefulWidget {
  @override
  _HotelReviewScreenState createState() => _HotelReviewScreenState();
}

class _HotelReviewScreenState extends State<HotelReviewScreen>
    with TickerProviderStateMixin {
  int _currentPage = 0, _numPages = 3;
  late ThemeData themeData;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer timerAnimation;

  List<String> _commentType = [
    "Motels",
    "Low Cost",
    "Suburb",
    "City Center",
    "Service",
    "Other",
  ];

  List<String> _selectedChoices = [
    "Service",
    "Suburb",
  ];

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
    super.dispose();
    timerAnimation.cancel();
    _pageController.dispose();
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
                body: Container(
              child: ListView(
                padding: EdgeInsets.zero,
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
                          icon: Icon(
                            MdiIcons.chevronLeft,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: MySize.size16!, left: MySize.size16!, right: MySize.size16!),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Mandarin Oriental",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.mapMarker,
                                    color: themeData.colorScheme.onBackground,
                                    size: 16,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: MySize.size2),
                                      child: Text("London bridge",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 500))),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "4.6",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size8!),
                                    child: Generator.buildRatingStar(
                                        rating: 4.6,
                                        inactiveColor:
                                            themeData.colorScheme.onBackground),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size8!),
                    child: Divider(
                      color: themeData.dividerColor,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: MySize.size16!, top: MySize.size8!),
                      child: Text(
                        "REVIEWS",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 600,
                            letterSpacing: 0.3),
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16!, top: MySize.size16!, bottom: MySize.size8!, right: MySize.size16!),
                    child: Wrap(
                      children: _buildChoiceList(),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: MySize.size16!, top: MySize.size8!, bottom: MySize.size8!, right: MySize.size16!),
                    child: Column(
                      children: <Widget>[
                        _SingleReview(
                            image: './assets/images/avatar.jpg',
                            name: 'Jeevan Bouvet',
                            review:
                                'Lorem ipsum is a pseudo-Latin text used in web design,'),
                        _SingleReview(
                            image: './assets/images/avatar-4.jpg',
                            name: 'Omer Nichols',
                            review:
                                'metus dictum. Faucibus interdum posuere lorem ipsum'),
                        _SingleReview(
                            image: './assets/images/avatar-2.jpg',
                            name: 'Safah French',
                            review: ' Amet venenatis urna cursus eget.'),
                        Container(
                          child: Center(
                            child: TextButton(

                                onPressed: () {},
                                child: Text(
                                  "VIEW ALL",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.primary,
                                      letterSpacing: 0.4),
                                )),
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

  _buildChoiceList() {
    List<Widget> choices = [];
    _commentType.forEach((item) {
      choices.add(Container(
        padding:  EdgeInsets.only(left: MySize.size2, right: MySize.size2, top: MySize.size4!, bottom: MySize.size4!),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          backgroundColor: themeData.colorScheme.background,
          label: Text(item,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: _selectedChoices.contains(item)
                      ? themeData.colorScheme.onSecondary
                      : themeData.colorScheme.onBackground)),
          selected: _selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              _selectedChoices.contains(item)
                  ? _selectedChoices.remove(item)
                  : _selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }
}

class _SingleReview extends StatelessWidget {
  final String image, name, review;

  const _SingleReview(
      {Key? key,
      required this.image,
      required this.name,
      required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                        fontWeight: 500),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: MySize.size4!),
                      child: Text(
                        "- " + review,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            height: 1.15,
                            fontWeight: 400),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
