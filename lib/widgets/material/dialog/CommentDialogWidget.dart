/*
* File : Comment Dialog
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class CommentDialogWidget extends StatefulWidget {
  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentDialogWidget> {
  late ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _CommentDialog());
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
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Comment",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                    width: MediaQuery.of(context).size.width,
                    color: themeData.backgroundColor,
                    child: Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image(
                              image:
                                  AssetImage('./assets/images/all/all-l3.jpg'),
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 4, right: 12, top: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('At Mountain',
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight:700)),
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text(
                                        'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 500)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          MdiIcons.heart,
                                          color:
                                              themeData.colorScheme.secondary,
                                          size: 20,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text(220.toString(),
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontWeight:600)),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _showDialog();
                                          },
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 16),
                                                  child: Icon(
                                                    MdiIcons.comment,
                                                    color: themeData
                                                        .colorScheme.primary,
                                                    size: 20,
                                                  )),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                child: Text('Comment',
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .caption,
                                                            fontWeight:600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ))));
      },
    );
  }
}

class _CommentDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  MdiIcons.thumbUpOutline,
                  color: themeData.colorScheme.primary,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: RichText(
                    text: TextSpan(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Will Allen",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 700)),
                          TextSpan(text: " and "),
                          TextSpan(
                              text: "17 others",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 700)),
                          TextSpan(text: " like this."),
                        ]),
                  ),
                )
              ],
            ),
            Divider(),
            _SingleComment(
              name: 'Hamaad Brock',
              image: './assets/images/avatar-3.jpg',
              comment: 'It\'s cool',
              time: '1 hour ago',
            ),
            _SingleComment(
              name: 'Roseanna Rowe',
              image: './assets/images/avatar-4.jpg',
              comment: 'Niceeeee',
              time: '5 hour ago',
            ),
            _SingleComment(
              name: 'Zidane Brewer',
              image: './assets/images/avatar-2.jpg',
              comment: 'Lorem ipsum, or lipsum as it is sometimes known',
              time: '3 days ago',
            ),
            Container(
              child: Center(
                child: TextButton(

                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: AppTheme.getTextStyle(themeData.textTheme.button,
                          fontWeight: 600,
                          color: themeData.colorScheme.primary),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleComment extends StatelessWidget {
  final String name, image, comment, time;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style: AppTheme.getTextStyle(
                        themeData.textTheme.subtitle2,
                        fontWeight:700,
                      )),
                  Text(
                    comment,
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText2,
                      fontWeight: 500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: <Widget>[
                      Text(time,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              fontWeight: 400,
                              height: 1.2)),
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text('Like',
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.primary,
                                  fontWeight: 500))),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  const _SingleComment(
      {Key? key,
      required this.name,
      required this.image,
      required this.comment,
      required this.time})
      : super(key: key);
}
