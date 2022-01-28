import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/color_utils.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'shopping_add_card_screen.dart';
import 'shopping_category_screen.dart';
import 'shopping_chat_screen.dart';
import 'shopping_favourite_screen.dart';
import 'shopping_mega_menu_screen.dart';
import 'shopping_order_screen.dart';

class ShoppingProfileScreen extends StatefulWidget {


  final BuildContext root;

  const ShoppingProfileScreen({Key? key, required this.root}) : super(key: key);

  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {



  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: FxAppTheme.theme.colorScheme
              .copyWith(secondary: FxAppTheme.theme.primaryColor.withAlpha(10))),
      child: SafeArea(
        child: Scaffold(
            body: ListView(
              padding: FxSpacing.all(24),
              children: <Widget>[
                FxSpacing.height(16),
                Column(
                  children: <Widget>[
                    FxContainer.rounded(
                      paddingAll: 0,
                      width: 80,
                      height: 80,
                      child: Image(
                          image: AssetImage("./assets/images/avatar-3.jpg"),
                          fit: BoxFit.fill),
                    ),
                    FxSpacing.height(8),
                    FxText.sh1("Derrick Malone",
                        fontWeight: 600, letterSpacing: 0),
                  ],
                ),
                FxSpacing.height(24),
                FxContainer(
                  color: FxAppTheme.theme.colorScheme.primary,
                  padding: FxSpacing.xy(16, 8),
                  borderRadiusAll: 4,
                  child: Row(
                    children: <Widget>[
                      Icon(MdiIcons.informationOutline,
                          color: FxAppTheme.theme.colorScheme.onPrimary,
                          size: 18),
                      FxSpacing.width(16),
                      Expanded(
                        child: FxText.b2("Gold member",
                            color: FxColorUtils.goldColor,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      ),
                      FxSpacing.width(16),
                      FxText.caption(
                        "Upgrade",
                        fontWeight: 600,
                        letterSpacing: 0.2,
                        color: FxAppTheme.theme.colorScheme.onPrimary,
                      )
                    ],
                  ),
                ),
                FxSpacing.height(24),
                Column(
                  children: <Widget>[
                    singleOption(
                        iconData: MdiIcons.shapeOutline,
                        option: "Category",
                        navigation: ShoppingCategoryScreen()),
                    Divider(),
                    singleOption(
                        iconData: MdiIcons.contentPaste,
                        option: "History",
                        navigation: ShoppingOrderScreen()),
                    Divider(),
                    singleOption(
                        iconData: MdiIcons.heartOutline,
                        option: "Favourite",
                        navigation: ShoppingFavouriteScreen()),
                    Divider(),
                    singleOption(
                        iconData: MdiIcons.creditCardOutline,
                        option: "Payment",
                        navigation: ShoppingAddCardScreen()),
                    Divider(),
                    singleOption(
                        iconData: MdiIcons.menu,
                        option: "Mega Menu",
                        navigation: ShoppingMegaMenuScreen()),
                    Divider(),
                    singleOption(
                        iconData: MdiIcons.faceAgent,
                        option: "Help \& Support",
                        navigation: ShoppingChatScreen()),
                    FxSpacing.height(24),
                    Center(
                      child: FxButton(
                        elevation: 0,
                        backgroundColor: FxAppTheme.theme.colorScheme.primary,
                        borderRadiusAll: 4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              MdiIcons.logoutVariant,
                              color: FxAppTheme.theme.colorScheme.onPrimary,
                              size: 18,
                            ),
                            FxSpacing.width(16),
                            FxText.caption("LOGOUT",
                                letterSpacing: 0.3,
                                fontWeight: 600,
                                color: FxAppTheme.theme.colorScheme.onPrimary)
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(widget.root);
                        },
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: FxSpacing.y(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation!));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: 22,
                color: FxAppTheme.theme.colorScheme.onBackground,
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: FxText.b1(option,fontWeight: 600),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: 22,
                  color: FxAppTheme.theme.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
