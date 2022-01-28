/*
* File : Sliver Appbar widget
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppThemeNotifier.dart';

class SliverAppBarWidget extends StatefulWidget {
  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  late ThemeData themeData;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return Scaffold(
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    backgroundColor: themeData.colorScheme.primary,
                    leading: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(MdiIcons.chevronLeft,color: themeData.colorScheme.onPrimary,),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("Collapsing Toolbar",
                            style: TextStyle(
                              color: themeData.colorScheme.onPrimary,
                              fontSize: 16.0,
                            )),
                        background:  Image(
                          image: AssetImage('./assets/images/all/all-l3.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(icon: Icon(Icons.info), text: "Tab 1"),
                          Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: Center(
                child: Text("Sample text"),
              ),
            ),
          ),
        );
      },
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
