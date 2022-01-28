/*
* File : Music App
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/screens/music/MusicHomeScreen.dart';
import 'package:UIKit/screens/music/MusicPlayerScreen.dart';
import 'package:UIKit/screens/music/MusicPlaylistScreen.dart';
import 'package:UIKit/screens/music/MusicPodcastScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'MusicProfileScreen.dart';

class MusicFullApp extends StatefulWidget {
  @override
  _MusicFullAppPageState createState() => _MusicFullAppPageState();
}

class _MusicFullAppPageState extends State<MusicFullApp>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 1);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  late ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
            bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                color: themeData.bottomAppBarTheme.color,
                boxShadow: [
                  BoxShadow(
                    color: themeData.cardTheme.shadowColor!.withAlpha(40),
                    blurRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: themeData.colorScheme.primary,
                tabs: <Widget>[
                  Container(
                    child: (_currentIndex == 0)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(MdiIcons.musicBox,color: themeData.colorScheme.primary,),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                decoration: BoxDecoration(
                                    color: themeData.primaryColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(2.5))),
                                height: 5,
                                width: 5,
                              )
                            ],
                          )
                        : Icon(MdiIcons.musicBoxOutline,color: themeData.colorScheme.onBackground,),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 24),
                      child: (_currentIndex == 1)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.googlePodcast,color: themeData.colorScheme.primary,),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: themeData.primaryColor,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(MdiIcons.googlePodcast,color: themeData.colorScheme.onBackground,)),
                  Container(
                      margin: EdgeInsets.only(left: 24),
                      child: (_currentIndex == 2)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.playlistMusic,color: themeData.colorScheme.primary,),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: themeData.primaryColor,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(MdiIcons.playlistMusicOutline,color: themeData.colorScheme.onBackground,)),
                  Container(
                      child: (_currentIndex == 3)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(MdiIcons.accountMusic,color: themeData.colorScheme.primary,),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  decoration: BoxDecoration(
                                      color: themeData.primaryColor,
                                      borderRadius: new BorderRadius.all(
                                          Radius.circular(2.5))),
                                  height: 5,
                                  width: 5,
                                )
                              ],
                            )
                          : Icon(MdiIcons.accountMusicOutline,color: themeData.colorScheme.onBackground,)),
                ],
              ),
            )),
            floatingActionButton: Hero(
          tag: 'music-fab',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color:themeData.colorScheme.primary
                      .withAlpha(50),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0,
                      2),
                ),
              ],
            ),
            child: FloatingActionButton(
              heroTag: null,
              tooltip: "Music Player",
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration:
                        Duration(milliseconds: 400),
                        pageBuilder: (_, __, ___) =>
                            MusicPlayerScreen()));
              },
              child: Icon(
                MdiIcons.play,
                size: 30,
                color: themeData.colorScheme.onPrimary,
              ),
              backgroundColor: themeData.colorScheme.primary,
              elevation: 0,
            ),
          ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MusicHomeScreen(),
            MusicPodcastScreen(),
            MusicPlayListScreen(),
            MusicProfileScreen()
          ],
            ),
          ),
        );
      },
    );
  }
}
