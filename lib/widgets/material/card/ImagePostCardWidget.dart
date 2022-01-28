/*
* File : Image Post Card
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class ImagePostCardWidget extends StatefulWidget {
  @override
  _ImagePostCardWidgetState createState() => _ImagePostCardWidgetState();
}

class _ImagePostCardWidgetState extends State<ImagePostCardWidget> {
  late ThemeData themeData;

  double _elevation = 3;

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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Post",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    color: themeData.backgroundColor,
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size16!,
                              right: MySize.size16!,
                              top: MySize.size16!),
                          child: Text("Recent Post",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size16!,
                              right: MySize.size16!,
                              top: MySize.size16!),
                          child: _SimpleCard(
                            elevation: _elevation,
                            image: './assets/images/all/all-l3.jpg',
                            title: 'At Mountain',
                            description:
                                'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                            like: 254,
                            height: 220,
                            view: 563,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: MySize.size16!,
                            right: MySize.size16!,
                            top: MySize.size16!,
                          ),
                          child: Text("Old Posts",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 700)),
                        ),
                        Container(
                          margin: EdgeInsets.all(MySize.size16!),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: MySize.size8!),
                                  child: _SimpleCard(
                                    elevation: _elevation,
                                    image: './assets/images/all/all-l2.jpg',
                                    title: 'Ice',
                                    description:
                                        'Lorem ipsum, or lipsum as it is sometimes known',
                                    like: 158,
                                    view: 353,
                                    height: 150,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size8!),
                                  child: _SimpleCard(
                                    elevation: _elevation,
                                    image: './assets/images/all/all-p3.jpg',
                                    title: 'With Nature',
                                    height: 150,
                                    description:
                                        'Lorem ipsum, or lipsum as it is sometimes known',
                                    like: 215,
                                    view: 314,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))));
      },
    );
  }
}

class _SimpleCard extends StatefulWidget {
  final double elevation;
  final String? image, title, description;
  final int? like, view, height;

  const _SimpleCard(
      {Key? key,
      this.elevation = 1,
      this.image,
      this.title,
      this.description,
      this.like,
      this.view,
      this.height})
      : super(key: key);

  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<_SimpleCard> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: widget.elevation,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(widget.image!),
              height: widget.height!.toDouble(),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.title!,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Text(widget.description!,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 500,
                                height: 1.2)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.heart,
                              color: themeData.colorScheme.secondary,
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(widget.like.toString(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 600)),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Icon(
                                  MdiIcons.eye,
                                  color: themeData.colorScheme.onBackground,
                                  size: 20,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(widget.view.toString(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 600)),
                            ),
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
