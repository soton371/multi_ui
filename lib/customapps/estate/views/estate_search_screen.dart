import 'package:UIKit/customapps/estate/controllers/estate_search_controller.dart';
import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';

class EstateSearchScreen extends StatefulWidget {
  const EstateSearchScreen({Key? key}) : super(key: key);

  @override
  _EstateSearchScreenState createState() => _EstateSearchScreenState();
}

class _EstateSearchScreenState extends State<EstateSearchScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;
  late EstateSearchController estateSearchController;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSearchController =
        FxControllerStore().putOrFind(EstateSearchController());
    estateSearchController.addMarkers();
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];

    for (House house in estateSearchController.houses!) {
      list.add(_SinglePosition(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateSearchController>(
        controller: estateSearchController,
        builder: (estateSearchController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary:
                        AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: 2,
                      child: estateSearchController.showLoading
                          ? LinearProgressIndicator(
                              color: AppTheme.customTheme.estatePrimary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 0,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateSearchController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingScreens.getSearchLoadingScreen(
            context,
            theme,
            customTheme,
          ));
    } else {
      return Stack(
        children: [
          GoogleMap(
            markers: estateSearchController.marker,
            onMapCreated: estateSearchController.onMapCreated,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                () => new EagerGestureRecognizer(),
              ),
            ].toSet(),
            initialCameraPosition: CameraPosition(
              target: estateSearchController.center,
              zoom: 7.0,
            ),
          ),
          Positioned(
            top: 16,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: FxTextField(
                    textFieldStyle: FxTextFieldStyle.outlined,
                    filled: true,
                    fillColor: FxAppTheme.customTheme.bgLayer2,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    autoFocusedBorder: true,
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: AppTheme.customTheme.estatePrimary,
                      size: 20,
                    ),
                    labelTextColor: AppTheme.customTheme.estatePrimary,
                    cursorColor: AppTheme.customTheme.estatePrimary,
                    labelText: 'Search Location',
                    labelStyle: TextStyle(
                        fontSize: 12,
                        color: AppTheme.customTheme.estatePrimary),
                    focusedBorderColor: AppTheme.customTheme.estatePrimary,
                    enabledBorderColor: AppTheme.customTheme.estatePrimary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 100,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: estateSearchController.pageController,
                onPageChanged: estateSearchController.onPageChange,
                children: _buildHouseList(),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class _SinglePosition extends StatelessWidget {
  final House house;

  const _SinglePosition(this.house);

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
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(house.image),
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    house.name,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          MdiIcons.mapMarker,
                          color: themeData.colorScheme.onBackground,
                          size: 14,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(house.location,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontWeight: 400))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
