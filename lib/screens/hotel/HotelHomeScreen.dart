/*
* File : Hotel Home
* Version : 1.0.0
* */


import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/hotel/HotelRoomScreen.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class HotelHomeScreen extends StatefulWidget {
  final BuildContext buildContext;

  const HotelHomeScreen({Key? key, required this.buildContext})
      : super(key: key);

  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  Animation<Offset>? offset;
  late ThemeData themeData;


  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    offset = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));
  }

  dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    controller.forward();
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size16!, left: MySize.size16!, right: MySize.size16!, bottom: MySize.size8!),
                        child: _SearchWidget(),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(MySize.size16!),
                          children: <Widget>[
                            Container(
                                child: _SingleHotelItem(
                                  image:
                                  './assets/images/hotel/room-1.jpg',
                                  name: "Mandarin Oriental",
                                  price: 400,
                                  address: "Wartennal, London ",
                                  rating: 4.4,
                                  buildContext: widget.buildContext,
                                )),
                            Container(
                                margin: EdgeInsets.only(top: MySize.size24!),
                                child: _SingleHotelItem(
                                  image:
                                  './assets/images/hotel/room-2.jpg',
                                  name: "Moody Moon",
                                  price: 700,
                                  address: "Duck Creek Road",
                                  rating: 4.8,
                                  buildContext: widget.buildContext,
                                )),
                            Container(
                                margin: EdgeInsets.only(top: MySize.size24!),
                                child: _SingleHotelItem(
                                  buildContext: widget.buildContext,
                                  image:
                                  './assets/images/hotel/room-3.jpg',
                                  name: "Four Seasons Hotel",
                                  price: 340,
                                  address: "Juniper Drive",
                                  rating: 3.8,
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                top: MySize.size16!,),
                              child: Center(
                                child: Container(
                                  width: MySize.size20,
                                  height: MySize.size20,
                                  child: CircularProgressIndicator(
                                      valueColor:
                                      AlwaysStoppedAnimation<
                                          Color>(
                                          themeData.colorScheme
                                              .primary),
                                      strokeWidth: 1.5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _pickDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: themeData.backgroundColor,
          borderRadius: BorderRadius.all(
              Radius.circular(MySize.size16!)),
          boxShadow: [
            BoxShadow(
                blurRadius: 6.0,
                color: themeData
                    .cardTheme.shadowColor!
                    .withOpacity(0.16),
                offset: Offset(0.0, 0.0)),
          ]),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight:500,),
                    decoration: InputDecoration(
                      hintStyle: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2,fontWeight: 500),
                      hintText: "Hotels near me",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        MdiIcons.magnify,
                        size: MySize.size22,
                        color: themeData.colorScheme.onBackground,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: MySize.size14!),
                    ),
                    autofocus: false,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.sentences,
                    controller: TextEditingController(text: ""),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: MySize.size16!, left: MySize.size16!),
                  child: InkWell(
                    onTap: () {
                      _pickDate(context);
                    },
                    child: Icon(
                      MdiIcons.calendarOutline,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 0,
              color: themeData.dividerColor,
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Check in",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 500),
                            ),
                            Text(
                              "28 May",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Check out",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 500),
                            ),
                            Text(
                              "31 May",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Person",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight:500),
                            ),
                            Text(
                              "2 Couple",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleHotelItem extends StatefulWidget {
  final String name, address, image;
  final int price;
  final double rating;
  final BuildContext buildContext;

  const _SingleHotelItem({Key? key,
    required this.name,
    required this.address,
    required this.image,
    required this.price,
    required this.rating,
    required this.buildContext})
      : super(key: key);

  @override
  _SingleHotelItemState createState() => _SingleHotelItemState();
}

class _SingleHotelItemState extends State<_SingleHotelItem> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.buildContext,
            PageRouteBuilder(
                transitionDuration:
                Duration(milliseconds: 500),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<
                        double> secondaryAnimation,
                    Widget child,) =>
                    FadeTransition(
                      opacity: animation,
                      child: child,
                    ),

                pageBuilder: (_, __, ___) =>
                    HotelRoomScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: themeData.colorScheme.surface,width: 1),
          color: themeData.backgroundColor,
          borderRadius: BorderRadius.all(
              Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor!
                  .withAlpha(32),
              blurRadius: 6,
              offset: Offset(0,
                  0),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MySize.size16!),
                    topRight: Radius.circular(MySize.size16!)),
                child: Image(
                  image: AssetImage(widget.image),
                  height: 200,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.fill,
                )),
            Container(
              padding:
              EdgeInsets.all(MySize.size16!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                      Text("\$" + widget.price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size8!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  MdiIcons.mapMarker,
                                  color: themeData.colorScheme.onBackground,
                                  size: MySize.size14,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: MySize.size2),
                                    child: Text(widget.address,
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            fontWeight: 500))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size2),
                              child: Row(
                                children: <Widget>[
                                  Icon(MdiIcons.star,
                                      color:
                                      themeData.colorScheme.onBackground,
                                      size: 14),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(
                                      widget.rating.toString() + " Ratings",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          fontWeight: 500),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        TextButton(

                            onPressed: () {
                              Navigator.push(
                                  widget.buildContext,
                                  PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 500),
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<
                                              double> secondaryAnimation,
                                          Widget child,) =>
                                          FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),

                                      pageBuilder: (_, __, ___) =>
                                          HotelRoomScreen()));
                            },
                            child: Text(
                              "BOOK NOW",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
