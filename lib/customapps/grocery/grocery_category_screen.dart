import 'dart:ui';

import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';
import 'grocery_single_product_screen.dart';
import 'models/category.dart';
import 'models/product.dart';

class GroceryCategoryScreen extends StatefulWidget {
  final BuildContext rootContext;
  final Category category;
  final String heroTag;

  const GroceryCategoryScreen(this.rootContext, this.category, this.heroTag);

  @override
  _GroceryCategoryScreenState createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen>
    with SingleTickerProviderStateMixin {
  late List<Product> products;

  initState() {
    super.initState();
    products = Product.getList();
  }

  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
          backgroundColor: AppTheme.customTheme.groceryBg1,
          appBar: AppBar(
            backgroundColor: AppTheme.customTheme.groceryBg1,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: AppTheme.theme.colorScheme.onBackground,
              ),
            ),
          ),
          body: ListView(
            padding: Spacing.fromLTRB(24, 0, 24, 0),
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Hero(
                      tag: widget.heroTag,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: widget.category.color,
                        ),
                        padding: Spacing.all(20),
                        child: Image.asset(
                          widget.category.image,
                          width: 52,
                          height: 52,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                    FxText.sh1(
                      widget.category.title,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600,
                    )
                  ],
                ),
              ),
              FxSpacing.height(24),
              Column(
                children: buildProducts(),
              )
            ],
          )),
    );
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
                      color: AppTheme.theme.colorScheme.onBackground,
                      muted: true),
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
