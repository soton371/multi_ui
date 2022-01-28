/*
* File : Draggable Scrollable Sheet
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class DraggableScrollableSheetWidget extends StatefulWidget {
  @override
  _DraggableScrollableSheetWidgetState createState() =>
      _DraggableScrollableSheetWidgetState();
}

class _DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {
  late ThemeData themeData;
  final List<String> _queueChoice = [
    "Move to Top",
    "Move to Bottom",
    "Remove",
    "Download"
  ];

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
                backgroundColor: themeData.appBarTheme.color,
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(MdiIcons.chevronLeft),
                ),
                title: Text("Draggable Scrollable",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        fontWeight: 600)),
              ),
              body: Container(
                child: DraggableScrollableSheet(
                  initialChildSize: 98 / MediaQuery.of(context).size.height,
                  minChildSize: 98 / MediaQuery.of(context).size.height,
                  maxChildSize: 0.8,
                  builder: (BuildContext context, controller) {
                    return _bottomSheet(controller);
                  },
                ),
              ),
            ));
      },
    );
  }

  Widget _bottomSheet(ScrollController controller) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: controller,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: MySize.size8!,
                  left: MySize.size16!,
                  right: MySize.size16!,
                  bottom: MySize.size20!),
              decoration: BoxDecoration(
                  color: themeData.colorScheme.background,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size16!),
                      topRight: Radius.circular(MySize.size16!))),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: MySize.size8!),
                    child: Center(
                        child: Container(
                      height: MySize.size4,
                      width: MySize.size40,
                      decoration: new BoxDecoration(
                          color:
                              themeData.colorScheme.onBackground.withAlpha(120),
                          borderRadius: new BorderRadius.all(
                              Radius.circular(MySize.size40!))),
                    )),
                  ),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(MySize.size6!),
                          child: Image(
                            image:
                                AssetImage('./assets/images/music/event-1.jpg'),
                            fit: BoxFit.cover,
                            height: MySize.size56,
                            width: MySize.size56,
                          )),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: MySize.size8!),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Love me",
                                style: themeData.textTheme.subtitle1!.merge(
                                    TextStyle(
                                        color:
                                            themeData.colorScheme.onBackground,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.w600)),
                              ),
                              Text(
                                "From older",
                                style: themeData.textTheme.bodyText1!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground
                                            .withAlpha(200),
                                        letterSpacing: 0.10)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SingleAnimatedIcon(
                              animatedIconData: AnimatedIcons.play_pause,
                              backgroundColor: themeData.colorScheme.primary,
                              iconColor: themeData.colorScheme.onPrimary,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size8!),
                              child: ClipOval(
                                child: Material(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size28!),
                                      side: BorderSide.none),
                                  child: InkWell(
                                    splashColor: themeData.colorScheme.primary,
                                    // inkwell color
                                    child: SizedBox(
                                        height: MySize.size40,
                                        width: MySize.size40,
                                        child: Icon(
                                          MdiIcons.skipNextOutline,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          size: MySize.size28,
                                        )),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: themeData.backgroundColor,
              padding: EdgeInsets.all(MySize.size16!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: MySize.size16!),
                    child: Text(
                      "Up Next",
                      style: themeData.textTheme.subtitle2!.merge(TextStyle(
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Container(
                    color: themeData.backgroundColor,
                    child: Column(
                      children: <Widget>[
                        _SingleQueueWidget(
                          image: './assets/images/music/singer-3.jpg',
                          name: 'Queue one',
                          singer: 'Singer - 1',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/music/singer-2.jpg',
                          name: 'Queue two',
                          singer: 'Singer - 2',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/music/singer-1.jpg',
                          name: 'Queue three',
                          singer: 'Singer - 3',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/music/singer-4.jpg',
                          name: 'Queue four',
                          singer: 'Singer - 4',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/music/event-1.jpg',
                          name: 'Queue five',
                          singer: 'Singer - 5',
                          choice: _queueChoice,
                        ),
                        Divider(),
                        _SingleQueueWidget(
                          image: './assets/images/music/event-2.jpg',
                          name: 'Queue six',
                          singer: 'Singer - 6',
                          choice: _queueChoice,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleQueueWidget extends StatelessWidget {
  final String image, name, singer;

  final List<String> choice;

  const _SingleQueueWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.singer,
      required this.choice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size2, bottom: MySize.size2),
      child: Row(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(MySize.size6!),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                height: MySize.size56,
                width: MySize.size56,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size8!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: themeData.textTheme.bodyText1!.merge(TextStyle(
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w600)),
                  ),
                  Text(
                    singer,
                    style: themeData.textTheme.subtitle2!.merge(TextStyle(
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0.10)),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: themeData.primaryColor.withAlpha(16),
                child: InkWell(
                  splashColor: themeData.colorScheme.primary.withAlpha(100),
                  highlightColor: themeData.primaryColor.withAlpha(16),
                  child: SizedBox(
                      width: MySize.size40,
                      height: MySize.size40,
                      child: Icon(
                        MdiIcons.heartOutline,
                        color: themeData.colorScheme.primary,
                        size: MySize.size22,
                      )),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return choice.map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice,
                        style: TextStyle(letterSpacing: 0.15).merge(
                            themeData.textTheme.bodyText2!.merge(TextStyle(
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: 0.2)))),
                  );
                }).toList();
              },
              icon: Icon(
                MdiIcons.dotsVertical,
                color: themeData.colorScheme.onBackground,
              ),
              color: themeData.colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final Color backgroundColor, iconColor;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      required this.backgroundColor,
      required this.iconColor})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size28!)),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.primary.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: Material(
          elevation: 5,
          color: widget.backgroundColor,
          child: InkWell(
            child: IconButton(
              iconSize: 28,
              icon: AnimatedIcon(
                icon: widget.animatedIconData,
                progress: _animationController,
                color: widget.iconColor,
              ),
              onPressed: () {
                if (isPlaying) {
                  _animationController.reverse();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  _animationController.forward();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
