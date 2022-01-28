/*
* File : Hotel Locations
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class HotelLocationScreen extends StatefulWidget {
  @override
  _HotelLocationScreenState createState() => _HotelLocationScreenState();
}

class _HotelLocationScreenState extends State<HotelLocationScreen>
    with AutomaticKeepAliveClientMixin<HotelLocationScreen> {
  late GoogleMapController mapController;
  ThemeData? themeData;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  int _currentPage = 0;

  final Set<Marker> _marker = {};

  onMarkerTap(int position) {
    setState(() {
      _currentPage = position;
    });

    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  onPageChange(int position) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _marker.toList()[position].position, zoom: 10.5)));
  }

  @override
  void initState() {
    super.initState();
    _marker.add(
      Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(45.121563, -122.977433),
        onTap: () {
          onMarkerTap(0);
        },
      ),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-2"),
          position: LatLng(45.121563, -122.777433),
          onTap: () {
            onMarkerTap(1);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-3"),
          position: LatLng(45.521563, -122.377433),
          onTap: () {
            onMarkerTap(2);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-4"),
          position: LatLng(45.721563, -122.377433),
          onTap: () {
            onMarkerTap(3);
          }),
    );
    _marker.add(
      Marker(
          markerId: MarkerId("id-5"),
          position: LatLng(45.121563, -122.377433),
          onTap: () {
            onMarkerTap(4);
          }),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              body: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(45.521563, -122.677433),
                      zoom: 7.0,
                    ),
                    mapToolbarEnabled: false,
                    zoomControlsEnabled: false,
                    markers: _marker,
                  ),
                  Positioned(
                    bottom: MySize.size16,
                    child: Container(
                      height: 116,
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: onPageChange,
                        children: <Widget>[
                          _SinglePosition(
                            rate: 5,
                            image: './assets/images/hotel/room-1.jpg',
                            name: "Mandarin Oriental",
                            place: "London Bridge",
                            rateCount: 215,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size8!),
                            child: _SinglePosition(
                              rate: 4.6,
                              image: './assets/images/hotel/room-2.jpg',
                              name: "Moody Moon",
                              place: "Covent Garden",
                              rateCount: 125,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size8!),
                            child: _SinglePosition(
                              rate: 3.8,
                              image: './assets/images/hotel/room-3.jpg',
                              name: "Mandarin Oriental",
                              place: "Oxford Street",
                              rateCount: 100,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size8!),
                            child: _SinglePosition(
                              rate: 4,
                              image: './assets/images/hotel/hotel-1.jpg',
                              name: "Radisson Hotel",
                              place: "Westminster",
                              rateCount: 185,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size8!),
                            child: _SinglePosition(
                              rate: 3,
                              image: './assets/images/hotel/hotel-2.jpg',
                              name: "The Bay Club",
                              place: "East End",
                              rateCount: 478,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  // For keep Alive until widget dispose
  bool get wantKeepAlive => true;
}

class _SinglePosition extends StatelessWidget {
  final String image, name, place;
  final double rate;
  final int rateCount;

  const _SinglePosition(
      {Key? key,
      required this.name,
      required this.place,
      required this.rate,
      required this.image,
      required this.rateCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: themeData.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor!.withAlpha(32),
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!, left: MySize.size16!),
      margin: EdgeInsets.only(bottom: MySize.size8!, left: MySize.size8!, right: MySize.size8!),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(MySize.size8!),
            child: Image(image: AssetImage(image),fit: BoxFit.cover,width: MySize.size72,height: MySize.size72,),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size16!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size4!),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.mapMarker,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: MySize.size2),
                            child: Text(place,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 400))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size4!),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Generator.buildRatingStar(
                              rating: rate,inactiveColor: themeData.colorScheme.onBackground),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size8!),
                          child: Text(
                            "($rateCount)",
                            style: themeData.textTheme.caption!.merge(TextStyle(
                                color: themeData.colorScheme.onBackground)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
