/*
* File : Hotel Carousel
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class HotelsCarouselWidget extends StatefulWidget {
  @override
  _HotelsCarouselWidgetState createState() => _HotelsCarouselWidgetState();
}

class _HotelsCarouselWidgetState extends State<HotelsCarouselWidget> {
  late ThemeData themeData;
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicatorStatic() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? themeData.colorScheme.primary
            : themeData.colorScheme.primary.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Our Hotels",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    child: Container(
                        child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
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
                            _SingleHotelPage(
                              image: './assets/images/place/cuba.jpg',
                              name: 'Cuba',
                            ),
                            _SingleHotelPage(
                              name: 'London',
                              image: './assets/images/place/london.jpg',
                            ),
                            _SingleHotelPage(
                              image: './assets/images/place/paris.jpg',
                              name: 'Paris',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicatorStatic(),
                      ),
                    ),
                  ],
                )))));
      },
    );
  }
}

class _SingleHotelPage extends StatelessWidget {
  final String image, name;

  const _SingleHotelPage({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 16, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name.toUpperCase(),
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.headline5,
                      fontWeight: 700,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text('St. James\'s Club Morgan Bay',
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 500))),
                  Text('Hotel Nacional de Cuba',
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 500)),
                  Text(
                    'Memories Trinidad Del Mar',
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ElevatedButton(

                          onPressed: () {},
                          child: Text(
                            ("Book at " + name),
                            style: themeData.textTheme.bodyText1!.merge(
                                TextStyle(
                                    color: themeData.colorScheme.onSecondary,
                                    letterSpacing: 0.2)),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        margin: EdgeInsets.all(0),
      ),
    );
  }
}
