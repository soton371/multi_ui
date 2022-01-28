import 'package:UIKit/customapps/estate/controllers/estate_home_controller.dart';
import 'package:UIKit/customapps/estate/models/category.dart';
import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:UIKit/customapps/estate/views/estate_single_estate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';

class EstateHomeScreen extends StatefulWidget {
  const EstateHomeScreen({Key? key}) : super(key: key);

  @override
  _EstateHomeScreenState createState() => _EstateHomeScreenState();
}

class _EstateHomeScreenState extends State<EstateHomeScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;

  late EstateHomeController estateHomeController;


  @override
  void initState() {
    super.initState();
    estateHomeController =
        FxControllerStore().putOrFind(EstateHomeController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (Category category in estateHomeController.categories!) {
      list.add(_buildSingleCategory(category));
    }
    return list;
  }

  List<Widget> _buildFilterCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (Category category in estateHomeController.categories!) {
      list.add(_buildFilterCategory(category));
    }
    return list;
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in estateHomeController.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Container(
      margin: FxSpacing.right(16),
      child: Column(
        children: [
          FxContainer.rounded(
            color: FxAppTheme.customTheme.bgLayer2.withAlpha(180),
            child: Icon(
              category.categoryIcon,
              color: AppTheme.customTheme.estatePrimary,
            ),
          ),
          FxSpacing.height(8),
          FxText.overline(
            category.category,
            xMuted: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(Category category) {
    return FxContainer(
      paddingAll: 8,
      borderRadiusAll: 8,
      margin: FxSpacing.right(8),
      bordered: true,
      splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
      color: FxAppTheme.customTheme.bgLayer2,
      child: Row(
        children: [
          Icon(
            category.categoryIcon,
            color: AppTheme.customTheme.estatePrimary,
            size: 16,
          ),
          FxSpacing.width(8),
          FxText.caption(
            category.category,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleHouse(House house) {
    return FxCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: FxSpacing.nTop(24),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: 16,
      child: Column(
        children: [
          Image(
            image: AssetImage(house.image),
            fit: BoxFit.fitWidth,
          ),
          FxContainer(
            paddingAll: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2(
                      house.name,
                      fontWeight: 700,
                    ),
                    FxText.b2(
                      house.price,
                      fontWeight: 600,
                      color: AppTheme.customTheme.estateSecondary,
                    ),
                  ],
                ),
                FxSpacing.height(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: FxAppTheme.theme.colorScheme.onBackground
                          .withAlpha(180),
                    ),
                    FxSpacing.width(4),
                    FxText.caption(
                      house.location,
                      xMuted: true,
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.king_bed,
                            size: 16,
                            color: FxAppTheme.theme.colorScheme.onBackground
                                .withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.caption(
                            house.bedrooms,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.bathtub,
                            size: 16,
                            color: FxAppTheme.theme.colorScheme.onBackground
                                .withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.caption(
                            house.bathrooms,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.square_foot,
                            size: 16,
                            color: FxAppTheme.theme.colorScheme.onBackground
                                .withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.caption(
                            house.floors,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.aspect_ratio,
                            size: 16,
                            color: FxAppTheme.theme.colorScheme.onBackground
                                .withAlpha(180),
                          ),
                          FxSpacing.width(4),
                          FxText.caption(
                            house.area,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateHomeController>(
        controller: estateHomeController,
        builder: (estateHomeController) {
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
                      child: estateHomeController.showLoading
                          ? LinearProgressIndicator(
                              color: AppTheme.customTheme.estatePrimary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
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
    if (estateHomeController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingScreens.getSearchLoadingScreen(
            context,
            theme,
            customTheme,
          ));
    } else {
      return ListView(
        padding: FxSpacing.top(16),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.caption(
                      'Location',
                      xMuted: true,
                    ),
                    FxSpacing.height(2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppTheme.customTheme.estatePrimary,
                          size: 14,
                        ),
                        FxSpacing.width(4),
                        FxText.b2(
                          'San Jose, CA',
                          fontWeight: 600,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: AppTheme.customTheme.estatePrimary,
                        ),
                      ],
                    ),
                  ],
                ),
                FxCard.bordered(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  paddingAll: 6,
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: FxAppTheme.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b1(
                  'Recommended',
                  fontWeight: 600,
                ),
                FxText.caption(
                  'More',
                  xMuted: true,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          Column(
            children: _buildHouseList(),
          ),
        ],
      );
    }
  }



  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return FxContainer(
                padding: FxSpacing.top(24),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxCard.rounded(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            paddingAll: 6,
                            color: AppTheme.customTheme.bgLayer2,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: AppTheme.theme.colorScheme.onBackground,
                            ),
                          ),
                          FxText.b2(
                            'Filters',
                            fontWeight: 600,
                          ),
                          FxText.caption(
                            'Reset',
                            color: AppTheme.customTheme.estatePrimary,
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.height(8),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Category',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _buildFilterCategoryList(),
                      ),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Price Range ( ' +'${estateHomeController.selectedRange.start.toInt().toString()} - '+'${estateHomeController.selectedRange.end.toInt().toString()} )',
                        fontWeight: 700,
                      ),
                    ),
                    RangeSlider(
                      activeColor: AppTheme.customTheme.estatePrimary,
                        inactiveColor: AppTheme.customTheme.estatePrimary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values:estateHomeController.selectedRange , onChanged: (RangeValues newRange){
                      setState(() => estateHomeController.selectedRange=newRange);
                    }),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Bed Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (estateHomeController.selectedBedRooms.contains(element)) {
                                  estateHomeController.selectedBedRooms.remove(element);
                                } else {
                                  estateHomeController.selectedBedRooms.add(element);
                                }
                              });
                            },
                            child: SingleBed(
                              bed: element,
                              selected: estateHomeController.selectedBedRooms.contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Bath Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (estateHomeController.selectedBathRooms.contains(element)) {
                                  estateHomeController.selectedBathRooms.remove(element);
                                } else {
                                  estateHomeController.selectedBathRooms.add(element);
                                }
                              });
                            },
                            child: SingleBath(
                              bath: element,
                              selected: estateHomeController.selectedBathRooms.contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxButton.block(
                        borderRadiusAll: 8,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: AppTheme.customTheme.estatePrimary,
                        child: FxText.sh2(
                          "Apply Filters",
                          fontWeight: 700,
                          color: AppTheme.customTheme.estateOnPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleBed extends StatefulWidget {
  final String bed;
  final bool selected;

  const SingleBed({Key? key, required this.bed, required this.selected})
      : super(key: key);

  @override
  _SingleBedState createState() => _SingleBedState();
}

class _SingleBedState extends State<SingleBed> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return FxCard(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(
          color: selected
              ? AppTheme.customTheme.estatePrimary
              : FxAppTheme.customTheme.border2),
      splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
      color: selected
          ? AppTheme.customTheme.estatePrimary
          : FxAppTheme.customTheme.bgLayer2,
      child: FxText.caption(
        widget.bed,
        fontWeight: 600,
        color: selected
            ? AppTheme.customTheme.estateOnPrimary
            : AppTheme.theme.colorScheme.onBackground,
      ),
    );
  }
}

class SingleBath extends StatefulWidget {
  final String bath;
  final bool selected;
  const SingleBath({Key? key, required this.bath, required this.selected})
      : super(key: key);

  @override
  _SingleBathState createState() => _SingleBathState();
}

class _SingleBathState extends State<SingleBath> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return FxCard(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(
          color: selected
              ? AppTheme.customTheme.estatePrimary
              : FxAppTheme.customTheme.border2),
      splashColor: AppTheme.customTheme.medicarePrimary.withAlpha(40),
      color: selected
          ? AppTheme.customTheme.estatePrimary
          : FxAppTheme.customTheme.bgLayer2,
      child: FxText.caption(
        widget.bath,
        fontWeight: 600,
        color: selected
            ? AppTheme.customTheme.estateOnPrimary
            : AppTheme.theme.colorScheme.onBackground,
      ), 
    );
  }
}
