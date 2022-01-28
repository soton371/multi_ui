/*
* File : Animated Icon
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class AnimatedIconWidget extends StatefulWidget {
  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> {
  late ThemeData themeData;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();


  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                    backgroundColor: themeData.appBarTheme.color,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                    ),
                    title: Text("Animated Icon",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600))),
                body: Container(
                    color: themeData.backgroundColor,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text("Animated Icon",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,fontWeight: 600)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.play_pause,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.add_event,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.arrow_menu,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.ellipsis_search,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.home_menu,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.view_list,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.menu_close,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.menu_arrow,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size24!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.play_pause,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.add_event,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.arrow_menu,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.ellipsis_search,
                                      isBackground: true,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size16!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.home_menu,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData: AnimatedIcons.view_list,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.menu_close,
                                      isBackground: true,
                                    ),
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.menu_arrow,
                                      isBackground: true,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size24!),
                                child: Text("Slow Motion",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,fontWeight:600)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size16!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                      animatedIconData:
                                          AnimatedIcons.play_pause,
                                      isBackground: true,
                                      isSlowMotion: true,
                                    ),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.add_event,
                                        isBackground: true,
                                        isSlowMotion: true),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.arrow_menu,
                                        isBackground: true,
                                        isSlowMotion: true),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.ellipsis_search,
                                        isBackground: true,
                                        isSlowMotion: true),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size16!),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.home_menu,
                                        isBackground: true,
                                        isSlowMotion: true),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.view_list,
                                        isBackground: true,
                                        isSlowMotion: true),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.menu_close,
                                        isBackground: true,
                                        isSlowMotion: true),
                                    SingleAnimatedIcon(
                                        animatedIconData:
                                            AnimatedIcons.menu_arrow,
                                        isBackground: true,
                                        isSlowMotion: true),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }

  void showSnackbarWithFloating(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class SingleAnimatedIcon extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final bool isBackground, isSlowMotion;

  const SingleAnimatedIcon(
      {Key? key,
      required this.animatedIconData,
      this.isBackground = false,
      this.isSlowMotion = false})
      : super(key: key);

  @override
  _SingleAnimatedIconState createState() => _SingleAnimatedIconState();
}

class _SingleAnimatedIconState extends State<SingleAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late ThemeData themeData;
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.isSlowMotion ? 1500 : 400));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      child: ClipOval(
        child: Material(
          color: widget.isBackground
              ? themeData.primaryColor.withAlpha(20)
              : Colors.transparent, // button color
          child: InkWell(
            splashColor: themeData.colorScheme.primary,
            // inkwell color
            child: SizedBox(
                width: MySize.size44,
                height: MySize.size44,
                child: IconButton(
                  iconSize: MySize.size24!,
                  icon: AnimatedIcon(
                    icon: widget.animatedIconData,
                    progress: _animationController,
                    color: themeData.colorScheme.primary,
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
                )),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
