/*
* File : Material Widget Home Page
* Version : 1.0.0
* */

import 'package:UIKit/SingleGridItem.dart';
import 'package:UIKit/screens/mail/MailComposeScreen.dart';
import 'package:UIKit/widgets/material/FormsHomePage.dart';
import 'package:UIKit/widgets/material/advanced/AnimatedSwitcherWidget.dart';
import 'package:UIKit/widgets/material/advanced/GoogleMapWidget.dart';
import 'package:UIKit/widgets/material/advanced/InteractiveViewerWidget.dart';
import 'package:UIKit/widgets/material/advanced/OnboardingWidget.dart';
import 'package:UIKit/widgets/material/advanced/PerspectiveTransformWidget.dart';
import 'package:UIKit/widgets/material/advanced/TextLiquidFillWidget.dart';
import 'package:UIKit/widgets/material/advanced/TriangleClipper.dart';
import 'package:UIKit/widgets/material/appbar/AppBarWidget.dart';
import 'package:UIKit/widgets/material/appbar/SearchBarWidget.dart';
import 'package:UIKit/widgets/material/appbar/SliverAppBarWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/DraggableScrollableSheetWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/QuickActionBottomSheetWidget.dart';
import 'package:UIKit/widgets/material/button/AnimatedIconWidget.dart';
import 'package:UIKit/widgets/material/button/ToggleButtonWidget.dart';
import 'package:UIKit/widgets/material/card/ShoppingCardWidget.dart';
// import 'package:UIKit/widgets/material/chart/GroupBarChartWidget.dart';
// import 'package:UIKit/widgets/material/chart/GroupStackBarChartWidget.dart';
// import 'package:UIKit/widgets/material/chart/SimpleBarChartWidget.dart';
// import 'package:UIKit/widgets/material/chart/StackBarChartWidget.dart';
import 'package:UIKit/widgets/material/dialog/CommentDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/DropdownWidget.dart';
import 'package:UIKit/widgets/material/dialog/PopupMenuWidget.dart';
import 'package:UIKit/widgets/material/list/RefreshListWidget.dart';
import 'package:UIKit/widgets/material/list/ReorderableListWidget.dart';
import 'package:UIKit/widgets/material/navigation/NavigationDrawer.dart';
import 'package:UIKit/widgets/material/search/FilterSearchWidget.dart';
import 'package:UIKit/widgets/material/search/HistorySearchWidget.dart';
import 'package:UIKit/widgets/material/search/ProductsSearchWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/AccountBottomSheetWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/FileManagerBottomSheetWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/FingerprintLockBottomSheetWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/GalleryBottomSheetWidget.dart';
import 'package:UIKit/widgets/material/button/ActionTextFABWidget.dart';
import 'package:UIKit/widgets/material/button/ExtendedFABWidget.dart';
import 'package:UIKit/widgets/material/button/FABWithTabsWidget.dart';
import 'package:UIKit/widgets/material/button/PositionedFABWidget.dart';
import 'package:UIKit/widgets/material/card/BeveledCardWidget.dart';
import 'package:UIKit/widgets/material/card/FullPageNewsCardWidget.dart';
import 'package:UIKit/widgets/material/card/ImagePostCardWidget.dart';
import 'package:UIKit/widgets/material/card/SimpleCardWidget.dart';
import 'package:UIKit/widgets/material/carousel/AnimatedCarouselWidget.dart';
import 'package:UIKit/widgets/material/carousel/HotelsCarouselWidget.dart';
import 'package:UIKit/widgets/material/carousel/NewsCarouselWidget.dart';
import 'package:UIKit/widgets/material/carousel/SimpleCarouselWidget.dart';
import 'package:UIKit/widgets/material/basic/ChoiceChipWidget.dart';
import 'package:UIKit/widgets/material/basic/SimpleChipWidget.dart';
import 'package:UIKit/widgets/material/dialog/AcceptPolicyDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/AccountDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/AddContactDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/FullScreenDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/ImagePostDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/ImportContactDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/LocationPermissionDialogWidget.dart';
import 'package:UIKit/widgets/material/dialog/SimpleDialogWidget.dart';
import 'package:UIKit/widgets/material/expansion/ExpansionPanelWidget.dart';
import 'package:UIKit/widgets/material/expansion/ExpansionTileWidget.dart';
import 'package:UIKit/widgets/material/expansion/InvoiceExpansionPage.dart';
import 'package:UIKit/widgets/material/grid/GridHeroWidget.dart';
import 'package:UIKit/widgets/material/grid/GridWidget.dart';
import 'package:UIKit/widgets/material/grid/PhotosActionGridViewWidget.dart';
import 'package:UIKit/widgets/material/grid/PhotosGridViewWidget.dart';
import 'package:UIKit/widgets/material/basic/SimpleImageWidget.dart';
import 'package:UIKit/widgets/material/list/ContactListWidget.dart';
import 'package:UIKit/widgets/material/list/ListWidget.dart';
import 'package:UIKit/widgets/material/list/SelectableListWidget.dart';
import 'package:UIKit/widgets/material/navigation/BottomNavigationWidget.dart';
import 'package:UIKit/widgets/material/navigation/CustomBottomNavigationWidget.dart';
import 'package:UIKit/widgets/material/navigation/NavigationRailWidget.dart';
import 'package:UIKit/widgets/material/navigation/TopNavigationWidget.dart';
import 'package:UIKit/widgets/material/navigation/TopScrollableNavigationWidget.dart';
import 'package:UIKit/widgets/material/progress/CreateAccountProgressWidget.dart';
import 'package:UIKit/widgets/material/progress/FailProgressWidget.dart';
import 'package:UIKit/widgets/material/progress/InternetCheckProgressWidget.dart';
import 'package:UIKit/widgets/material/progress/PaymentDoneProgressWidget.dart';
import 'package:UIKit/widgets/material/progress/UploadDoneProgressWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/BottomSheetWidget.dart';
import 'package:UIKit/widgets/material/list/DismissibleListWidget.dart';
import 'package:UIKit/widgets/material/button/IconButtonWidget.dart';
import 'package:UIKit/widgets/material/list/ListWheelScrollViewWidget.dart';
import 'package:UIKit/widgets/material/button/MiddleFABWidget.dart';
import 'package:UIKit/widgets/material/bottomsheet/SnackbarWidget.dart';
import 'package:UIKit/widgets/material/stepper/SimpleStepperWidget.dart';
import 'package:UIKit/widgets/material/stepper/TimelineStepperWidget.dart';
import 'package:flutter/material.dart';

import 'AppTheme.dart';

class MaterialWidgetsHome extends StatefulWidget {
  @override
  _MaterialWidgetsHomeState createState() => _MaterialWidgetsHomeState();
}

class _MaterialWidgetsHomeState extends State<MaterialWidgetsHome> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.25,
              crossAxisSpacing: 16.0,
              children: <Widget>[
                SingleGridItem(
                  title: "New in Flutter",
                  icon: './assets/icons/albums-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Interactive Viewer",
                      icon: './assets/icons/rocket-outline.png',
                      navigation: InteractiveViewerWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Advanced",
                  icon: './assets/icons/file-tray-full-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Google Map",
                      icon: './assets/icons/location-outline.png',
                      navigation: GoogleMapWidget(),
                    ),
                    SinglePageItem(
                      title: "Animated Switcher",
                      icon: './assets/icons/file-tray-full-outline.png',
                      navigation: AnimatedSwitcherWidget(),
                    ),
                    SinglePageItem(
                      title: "Text Liquid Fill",
                      icon: './assets/icons/file-tray-full-outline.png',
                      navigation: TextLiquidFillWidget(),
                    ),
                    SinglePageItem(
                      title: "Perspective Transform",
                      icon: './assets/icons/file-tray-full-outline.png',
                      navigation: PerspectiveTransformWidget(),
                    ),
                    SinglePageItem(
                      title: "On Boarding Wizard",
                      icon: './assets/icons/file-tray-full-outline.png',
                      navigation: OnBoardingWidget(),
                    ),
                    SinglePageItem(
                      title: "Triangle Clipper",
                      icon: './assets/icons/file-tray-full-outline.png',
                      navigation: TriangleClipper(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "App Bar",
                  icon: './assets/icons/browsers-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "App Bars",
                      icon: './assets/icons/browsers-outline.png',
                      navigation: AppBarWidget(),
                    ),
                    SinglePageItem(
                      title: "Search Bars",
                      icon: './assets/icons/browsers-outline.png',
                      navigation: SearchBarWidget(),
                    ),
                    SinglePageItem(
                      title: "Sliver Appbar",
                      icon: './assets/icons/browsers-outline.png',
                      navigation: SliverAppBarWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Basic",
                  icon: './assets/icons/shapes-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Images",
                      icon: './assets/icons/shapes-outline.png',
                      navigation: SimpleImageWidget(),
                    ),
                    SinglePageItem(
                      title: "Simple Chip",
                      icon: './assets/icons/shapes-outline.png',
                      navigation: SimpleChipWidget(),
                    ),
                    SinglePageItem(
                      title: "Choice Chip",
                      icon: './assets/icons/shapes-outline.png',
                      navigation: ChoiceChipWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Bottom Sheet",
                  icon: './assets/icons/download-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Snack Bars",
                      icon: './assets/icons/download-outline.png',
                      navigation: SnackbarWidget(),
                    ),
                    SinglePageItem(
                      title: "Bottom Sheets",
                      icon: './assets/icons/download-outline.png',
                      navigation: BottomSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Draggable",
                      icon: './assets/icons/download-outline.png',
                      navigation: DraggableScrollableSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Gallery",
                      icon: './assets/icons/download-outline.png',
                      navigation: GalleryBottomSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Account Setting",
                      icon: './assets/icons/download-outline.png',
                      navigation: AccountBottomSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Create",
                      icon: './assets/icons/download-outline.png',
                      navigation: FileManagerBottomSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Fingerprint",
                      icon: './assets/icons/download-outline.png',
                      navigation: FingerprintLockBottomSheetWidget(),
                    ),
                    SinglePageItem(
                      title: "Quick Action",
                      icon: './assets/icons/download-outline.png',
                      navigation: QuickActionBottomSheetWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Buttons",
                  icon: './assets/icons/toggle-outline.png',
                  items: <SinglePageItem>[

                    SinglePageItem(
                      title: "Icon Button",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: IconButtonWidget(),
                    ),
                    SinglePageItem(
                      title: "Animated Icon",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: AnimatedIconWidget(),
                    ),
                    SinglePageItem(
                      title: "Toggle Button",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: ToggleButtonWidget(),
                    ),
                    SinglePageItem(
                      title: "Positioned FAB",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: PositionedFABWidget(),
                    ),
                    SinglePageItem(
                      title: "Middle FAB",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: MiddleFABWidget(),
                    ),
                    SinglePageItem(
                      title: "Extended FAB",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: ExtendedFABWidget(),
                    ),
                    SinglePageItem(
                      title: "FAB with Actions",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: ActionTextFABWidget(),
                    ),
                    SinglePageItem(
                      title: "FAB with Tabs",
                      icon: './assets/icons/toggle-outline.png',
                      navigation: FABWithTabsWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Card",
                  icon: './assets/icons/tablet-landscape-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Cards",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: SimpleCardWidget(),
                    ),
                    SinglePageItem(
                      title: "Beveled Cards",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: BeveledCardWidget(),
                    ),
                    SinglePageItem(
                      title: "Image Post",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: ImagePostCardWidget(),
                    ),
                    SinglePageItem(
                      title: "News",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: FullPageNewsCardWidget(),
                    ),
                    SinglePageItem(
                      title: "Shopping",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: ShoppingCardWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Carousel",
                  icon: './assets/icons/code-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Carousel",
                      icon: './assets/icons/code-outline.png',
                      navigation: SimpleCarouselWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/code-outline.png',
                      title: "Animated",
                      navigation: AnimatedCarouselWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/code-outline.png',
                      title: "Hotels",
                      navigation: HotelsCarouselWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/code-outline.png',
                      title: "News",
                      navigation: NewsCarouselWidget(),
                    ),
                  ],
                ),
                // SingleGridItem(
                //   title: "Charts",
                //   icon: './assets/icons/stats-chart-outline.png',
                //   items: <SinglePageItem>[
                //     SinglePageItem(
                //       icon: './assets/icons/stats-chart-outline.png',
                //       title: "Bar",
                //       navigation: SimpleBarChartWidget(),
                //     ),
                //     SinglePageItem(
                //       icon: './assets/icons/stats-chart-outline.png',
                //       title: "Stacked Bar",
                //       navigation: StackBarChartWidget(),
                //     ),
                //     SinglePageItem(
                //       icon: './assets/icons/stats-chart-outline.png',
                //       title: "Grouped Bar",
                //       navigation: GroupBarChartWidget(),
                //     ),
                //     SinglePageItem(
                //       icon: './assets/icons/stats-chart-outline.png',
                //       title: "Grouped Stacked",
                //       navigation: GroupStackChartWidget(),
                //     ),
                //   ],
                // ),
                SingleGridItem(
                  title: "Dialogs",
                  icon: './assets/icons/albums-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      icon: './assets/icons/albums-outline.png',
                      title: "Simple Dialog",
                      navigation: SimpleDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Popups",
                      icon: './assets/icons/albums-outline.png',
                      navigation: PopupMenuWidget(),
                    ),
                    SinglePageItem(
                      title: "Account Dialog",
                      icon: './assets/icons/albums-outline.png',
                      navigation: AccountDialogWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/albums-outline.png',
                      title: "Full Screen",
                      navigation: FullScreenDialogWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/albums-outline.png',
                      title: "Compose Mail",
                      navigation: MailComposeScreen(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/albums-outline.png',
                      title: "Add Contact",
                      navigation: AddContactDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Import Contact",
                      icon: './assets/icons/albums-outline.png',
                      navigation: ImportContactDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Image Post",
                      icon: './assets/icons/albums-outline.png',
                      navigation: ImagePostDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Accept Terms",
                      icon: './assets/icons/albums-outline.png',
                      navigation: AcceptPolicyDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Location permission",
                      icon: './assets/icons/albums-outline.png',
                      navigation: LocationPermissionDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Comment",
                      icon: './assets/icons/albums-outline.png',
                      navigation: CommentDialogWidget(),
                    ),
                    SinglePageItem(
                      title: "Dropdown",
                      icon: './assets/icons/albums-outline.png',
                      navigation: DropdownWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Expansions",
                  icon: './assets/icons/resize-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      icon: './assets/icons/resize-outline.png',
                      title: "Tile",
                      navigation: ExpansionTileWidget(),
                    ),
                    SinglePageItem(
                      title: "Panel",
                      icon: './assets/icons/resize-outline.png',
                      navigation: ExpansionPanelWidget(),
                    ),
                    SinglePageItem(
                      title: "Invoice",
                      icon: './assets/icons/resize-outline.png',
                      navigation: InvoiceExpansionPage(),
                    ),
                  ],
                ),
                SinglePageItem(
                  title: "Forms",
                  icon: './assets/icons/reader-outline.png',
                  navigation: FormsHomePage(),
                ),
                SingleGridItem(
                  title: "Grid",
                  icon: './assets/icons/grid-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Simple",
                      icon: './assets/icons/grid-outline.png',
                      navigation: GridWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/grid-outline.png',
                      title: "Hero Transition",
                      navigation: GridHeroWidget(),
                    ),
                    SinglePageItem(
                      title: "Photos",
                      icon: './assets/icons/grid-outline.png',
                      navigation: PhotosGridViewWidget(),
                    ),
                    SinglePageItem(
                      title: "Actions",
                      icon: './assets/icons/grid-outline.png',
                      navigation: PhotosActionGridViewWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "List",
                  icon: './assets/icons/list-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Simple List",
                      navigation: ListWidget(),
                      icon: './assets/icons/list-outline.png',
                    ),
                    SinglePageItem(
                      title: "Selectable",
                      navigation: SelectableListWidget(),
                      icon: './assets/icons/list-outline.png',
                    ),
                    SinglePageItem(
                      icon: './assets/icons/list-outline.png',
                      title: "Dismissible",
                      navigation: DismissibleListWidget(),
                    ),
                    SinglePageItem(
                      title: "Refresh",
                      icon: './assets/icons/list-outline.png',
                      navigation: RefreshListWidget(),
                    ),
                    SinglePageItem(
                      title: "Reorderable",
                      icon: './assets/icons/list-outline.png',
                      navigation: ReorderableListWidget(),
                    ),
                    SinglePageItem(
                      title: "Scroll Wheel",
                      icon: './assets/icons/list-outline.png',
                      navigation: ListWheelScrollViewWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/list-outline.png',
                      title: "Contacts",
                      navigation: ContactListWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Navigation",
                  icon: './assets/icons/ellipsis-vertical-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Top",
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      navigation: TopNavigationWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      title: "Scrollable",
                      navigation: TopScrollableNavigationWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      title: "Rail",
                      navigation: NavigationRailWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      title: "Bottom",
                      navigation: BottomNavigationWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      title: "Drawer",
                      navigation: NavigationDrawerWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/ellipsis-vertical-outline.png',
                      title: "Custom Bottom",
                      navigation: CustomBottomNavigationWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Progress",
                  icon: './assets/icons/hourglass-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      icon: './assets/icons/hourglass-outline.png',
                      title: "Payment",
                      navigation: PaymentDoneProgressWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/hourglass-outline.png',
                      title: "Upload file",
                      navigation: UploadDoneProgressWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/hourglass-outline.png',
                      title: "Create Account",
                      navigation: CreateAccountProgressWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/hourglass-outline.png',
                      title: "Failed",
                      navigation: FailProgressWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/hourglass-outline.png',
                      title: "Internet",
                      navigation: InternetCheckProgressWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Search",
                  icon: './assets/icons/search-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Product",
                      icon: './assets/icons/search-outline.png',
                      navigation: ProductsSearchWidget(),
                    ),
                    SinglePageItem(
                      title: "History",
                      icon: './assets/icons/search-outline.png',
                      navigation: HistorySearchWidget(),
                    ),
                    SinglePageItem(
                      title: "Filter",
                      icon: './assets/icons/search-outline.png',
                      navigation: FilterSearchWidget(),
                    ),
                  ],
                ),
                SingleGridItem(
                  title: "Stepper",
                  icon: './assets/icons/analytics-outline.png',
                  items: <SinglePageItem>[
                    SinglePageItem(
                      title: "Simple",
                      icon: './assets/icons/analytics-outline.png',
                      navigation: SimpleStepperWidget(),
                    ),
                    SinglePageItem(
                      icon: './assets/icons/analytics-outline.png',
                      title: "Timeline",
                      navigation: TimelineStepperWidget(),
                    ),
                  ],
                ),
              ]),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 16),
            child: Center(
              child: Text("More widgets are coming soon...",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                     letterSpacing: 0.5,fontWeight: 500,)),
            ),
          )
        ],
      ),
    );
  }
}
