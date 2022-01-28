import 'dart:math';
import 'dart:ui';

import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';
import 'grocery_single_product_screen.dart';
import 'models/product.dart';

class GrocerySearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GrocerySearchScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen>
    with SingleTickerProviderStateMixin {

  late List<Product> products;


  initState() {
    super.initState();
    products = Product.getList();
  }



  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: ListView(
          padding: Spacing.fromLTRB(24, 48, 24, 70),
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: FxTextField(
                      hintText: "Search",
                      prefixIcon: Icon(
                        FeatherIcons.search,
                        size: 18,
                        color: AppTheme.theme.colorScheme.onBackground
                            .withAlpha(150),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: AppTheme.customTheme.groceryBg2,
                      hintStyle: FxTextStyle.b2(),
                      labelStyle: FxTextStyle.b2(),
                      style: FxTextStyle.b2(),
                      textCapitalization: TextCapitalization.sentences,
                      labelText: "Search",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      cursorColor: AppTheme.customTheme.groceryPrimary,
                      focusedBorderColor: Colors.transparent,
                    ),
                  ),
                  FxSpacing.width(16),
                  //Space.width(16),
                  FxContainer(
                    color:
                        AppTheme.customTheme.groceryPrimary.withAlpha(32),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Icon(
                        FeatherIcons.sliders,
                        color: AppTheme.customTheme.groceryPrimary,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            FxSpacing.height(24),
            FxText.b2("Search for Vegetables",
                letterSpacing: 0, fontWeight: 600),
            FxSpacing.height(16),
            Column(
              children: buildProducts(),
            )
          ],
        ));
  }



  List<Widget> buildProducts() {
    List<Widget> list = [];
    for (Product product in products) {
      list.add(getSingleProduct(product));
    }
    return list;
  }

  Widget getSingleProduct(Product product) {
    String heroKey = Generator.getRandomString(10);

    return InkWell(
      onTap: () {
        Navigator.push(
            widget.rootContext,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => GrocerySingleProductScreen(product,heroKey)));
      },
      child: FxContainer(
        margin: Spacing.bottom(16),
        color: AppTheme.customTheme.groceryBg2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxContainer(
              color: AppTheme.customTheme.groceryPrimary.withAlpha(32),
              padding: Spacing.all(8),
              child: Hero(
                tag: heroKey,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    product.image,
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
            ),
            FxSpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.b2(product.name,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                  FxSpacing.height(8),

                  FxText.overline(product.description,
                      color: AppTheme.theme.colorScheme.onBackground, muted: true),
                  FxSpacing.height(8),
                  product.discountedPrice != product.price
                      ? Row(
                    children: [
                      FxText.caption(
                          "\$" +
                              FxTextUtils.doubleToString(product.price),
                          decoration: TextDecoration.lineThrough,
                          fontWeight: 500),
                      // Space.width(8),
                      FxSpacing.width(8),
                      FxText.b2(
                          "\$" +
                              FxTextUtils.doubleToString(
                                  product.discountedPrice),
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 700),
                    ],
                  )
                      : FxText.b2(
                      "\$" + FxTextUtils.doubleToString(product.price),
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 700),
                ],
              ),
            ),
            // Space.width(8),
            Icon(
              MdiIcons.heartOutline,
              color: AppTheme.customTheme.groceryPrimary,
              size: 18,
            )
          ],
        ),
      ),
    );
  }


}
