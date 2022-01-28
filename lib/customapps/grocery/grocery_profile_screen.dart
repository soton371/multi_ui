import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import '../../AppTheme.dart';
import 'grocery_order_screen.dart';

class GroceryProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryProfileScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryProfileScreenState createState() => _GroceryProfileScreenState();
}

class _GroceryProfileScreenState extends State<GroceryProfileScreen>
    with SingleTickerProviderStateMixin {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: ListView(
          padding: Spacing.fromLTRB(24, 72, 24, 70),
          children: [
            Center(
              child: FxContainer.rounded(
                padding: Spacing.all(20),
                color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                child: Image.asset(
                  'assets/images/customapps/grocery/profile.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            FxSpacing.height(16),
            Center(
              child: FxText.b1("Kelvin Gonzalez", fontWeight: 600),
            ),
            FxSpacing.height(32),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryOrderScreen()));
                },
                child: getSingleSetting(
                    iconData: FeatherIcons.shoppingBag,
                    color: AppTheme.customTheme.brown,
                    title: "My Orders")),
            getSingleSetting(
                iconData: FeatherIcons.creditCard,
                color: AppTheme.customTheme.green,
                title: "Wallet"),
            getSingleSetting(
                iconData: FeatherIcons.tag,
                color: AppTheme.customTheme.purple,
                title: "Vouchers"),
            getSingleSetting(
                iconData: FeatherIcons.mapPin,
                color: AppTheme.customTheme.orange,
                title: "My Address"),
            getSingleSetting(
                iconData: FeatherIcons.logOut,
                color: AppTheme.customTheme.red,
                title: "Log Out"),
          ],
        ));
  }

  Widget getSingleSetting(
      {IconData? iconData, required Color color, required String title}) {
    return Container(
      margin: Spacing.bottom(16),
      child: Row(
        children: [
          FxContainer(
            color: color.withAlpha(24),
            child: Icon(
              iconData,
              color: color,
              size: 22,
            ),
          ),
          FxSpacing.width(24),
          FxText.b1(title, letterSpacing: 0.3, fontWeight: 600)
        ],
      ),
    );
  }
}
