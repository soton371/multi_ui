import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class MusicPlayListScreen extends StatefulWidget {
  @override
  _MusicPlayListScreenState createState() => _MusicPlayListScreenState();
}

class _MusicPlayListScreenState extends State<MusicPlayListScreen> {
  late ThemeData themeData;


  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  body: Container(
                height: MediaQuery.of(context).size.height,
                color: themeData.backgroundColor,
                child: ListView(
                  padding: EdgeInsets.only(top: 16),
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text("Playlist",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,
                                fontWeight: 700,
                                letterSpacing: 0.2)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16!),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: MySize.size8!),
                              child: _SinglePlaylistWidget(
                                  image: './assets/images/music/all-1.jpg',
                                  title: 'Travel'),
                            ),
                            _SinglePlaylistWidget(
                                image: './assets/images/music/all-2.jpg',
                                title: 'Albums'),
                            _SinglePlaylistWidget(
                                image: './assets/images/music/singer-3.jpg',
                                title: 'Favourite'),
                            Container(
                              margin: EdgeInsets.only(right: MySize.size8!),
                              child: _SinglePlaylistWidget(
                                  image: './assets/images/music/singer-4.jpg',
                                  title: 'Old'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size8!, left: MySize.size16!),
                        child: Text(
                          "All Tracks",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700),
                        )),
                    Container(
                      padding: EdgeInsets.only(left: MySize.size16!, right: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          _SingleTrackWidget(
                              image: './assets/images/music/event-1.jpg',
                              name: 'What\'s My Name',
                              album: 'Album - 1',
                              duration: '4:20'),
                          _SingleTrackWidget(
                              image: './assets/images/music/event-2.jpg',
                              name: 'What\'s My Name',
                              album: 'Album - 1',
                              duration: '4:20'),
                          _SingleTrackWidget(
                              image: './assets/images/music/event-3.jpg',
                              name: 'What\'s My Name',
                              album: 'Album - 1',
                              duration: '4:20'),
                          _SingleTrackWidget(
                              image: './assets/images/music/singer-4.jpg',
                              name: 'What\'s My Name',
                              album: 'Album - 1',
                              duration: '4:20'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ));
      },
    );
  }

}


class _SinglePlaylistWidget extends StatelessWidget {
  final String image, title;

  const _SinglePlaylistWidget(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.all(MySize.size12!),
          child: Column(
            children: <Widget>[
              Container(
                width: MySize.size100,
                height: MySize.size100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size8!),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      fontWeight: 600, letterSpacing: 0.2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SingleTrackWidget extends StatelessWidget {
  final String image, name, album, duration;

  const _SingleTrackWidget(
      {Key? key,
      required this.image,
      required this.name,
      required this.album,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size8!, bottom: MySize.size8!),
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
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600, letterSpacing: 0.2),
                  ),
                  Text(
                    album,
                    style: themeData.textTheme.subtitle2!.merge(TextStyle(
                        color: themeData.colorScheme.onBackground,
                        letterSpacing: 0.10)),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Text(
              duration,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                  fontWeight:600, letterSpacing: 0.2),
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
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
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
    );
  }
}
