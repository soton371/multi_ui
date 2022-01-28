/*
* File : Product Search
* Version : 1.0.0
* */


import 'dart:async';
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ProductsSearchWidget extends StatefulWidget {
  @override
  _ProductsSearchWidgetState createState() => _ProductsSearchWidgetState();
}

class _ProductsSearchWidgetState extends State<ProductsSearchWidget> {
  bool _isInProgress = false;
  Timer? _timer;
  late ThemeData themeData;

  void _onSubmit(text) {
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => startTimer());
  }

  void startTimer() {
    setState(() {
      _isInProgress = true;
    });
    const oneSec = const Duration(milliseconds: 2500);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer!.cancel(),
              setState(
                () {
                  _isInProgress = false;
                },
              )
            });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_timer != null) _timer!.cancel();
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
                body: Column(
              children: <Widget>[
                FxSpacing.height(32),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 8, right: 12, bottom: 8),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                MdiIcons.chevronLeft,
                                size: 24,
                                color: themeData.colorScheme.onBackground
                                    .withAlpha(240),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Try to search",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    isDense: true,
                                  ),
                                  autofocus: false,
                                  maxLines: 1,
                                  textInputAction: TextInputAction.search,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSubmitted: _onSubmit,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: themeData.colorScheme.secondary,
                            child: Text(
                              "A",
                              style: themeData.textTheme.subtitle2!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onSecondary)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _isInProgress
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                              themeData.colorScheme.primary,
                            )),
                          ),
                        )
                      : Container(
                          color: themeData.backgroundColor,
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Text(
                                  "RESULT",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      child: _SimpleCard(
                                        image:
                                            './assets/images/shopping/product/product-7.jpg',
                                        name: 'Product-1',
                                        description:
                                            'Lorem ipsum, or lipsum as it is sometimes',
                                        star: 4,
                                        countStar: 15,
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: _SimpleCard(
                                        image:
                                            './assets/images/shopping/product/product-8.jpg',
                                        name: 'Product-1',
                                        description:
                                            'Lorem ipsum, or lipsum as it is sometimes',
                                        star: 5,
                                        countStar: 2,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16, bottom: 4),
                                child: Text(
                                  "RECOMMENDED",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight:600),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 16, bottom: 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-3.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 4,
                                          countStar: 15,
                                          width: 160,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 16, bottom: 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-5.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 5,
                                          countStar: 2,
                                          width: 160,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 16, right: 16, bottom: 8),
                                        child: _SimpleCard(
                                          image:
                                              './assets/images/shopping/product/product-2.jpg',
                                          name: 'Product-1',
                                          description:
                                              'Lorem ipsum, or lipsum as it is sometimes',
                                          star: 5,
                                          countStar: 2,
                                          width: 160,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                ),
              ],
            )));
      },
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final String? image, name, description;
  final int? star, countStar;
  final double? width;

  const _SimpleCard({
    Key? key,
    this.image,
    this.name,
    this.description,
    this.star,
    this.countStar,
    this.width,
  }) : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData themeData;


  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Card(
      child: Container(
        width: widget.width == null
            ? MediaQuery.of(context).size.width
            : widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(widget.image!),
              width: widget.width == null
                  ? MediaQuery.of(context).size.width
                  : widget.width,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.name!,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600)),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Text(
                          widget.description!,
                          style: themeData.textTheme.caption!.merge(TextStyle(
                            color: themeData.colorScheme.onBackground,
                            letterSpacing: 0.15,
                            height: 1.2,
                          )),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Row(
                          children: <Widget>[
                            Generator.buildRatingStar(rating: widget.star!.toDouble(),inactiveColor: Generator.starColor),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                "(" + widget.countStar.toString() + ")",
                                style: themeData.textTheme.bodyText2!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground,
                                        letterSpacing: 0.2)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
