import 'dart:ui';

import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/dashed_divider/dashed_divider.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';
import 'grocery_checkout_screen.dart';
import 'grocery_coupon_screen.dart';
import 'models/cart.dart';

class GroceryCartScreen extends StatefulWidget {
  final BuildContext rootContext;

  const GroceryCartScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _GroceryCartScreenState createState() => _GroceryCartScreenState();
}

class _GroceryCartScreenState extends State<GroceryCartScreen>
    with SingleTickerProviderStateMixin {
  late List<Cart> carts;

  initState() {
    super.initState();
    carts = Cart.getList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppTheme.customTheme.groceryBg1,
          title: FxText.h6("Cart", fontWeight: 600),
        ),
        backgroundColor: AppTheme.customTheme.groceryBg1,
        body: ListView(
          padding: Spacing.fromLTRB(24, 8, 24, 70),
          children: <Widget>[
            Column(
              children: buildCarts(),
            ),
            FxSpacing.height(16),

            FxContainer(
              color: AppTheme.customTheme.groceryBg2,
              padding: Spacing.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: FxTextField(
                      hintText: "Promo Code",
                      hintStyle: FxTextStyle.b2(),
                      labelStyle: FxTextStyle.b2(),
                      style: FxTextStyle.b2(),
                      labelText: "Promo Code",
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: Spacing.right(16),
                      focusedBorderColor: Colors.transparent,
                      cursorColor: AppTheme.customTheme.groceryPrimary,
                      prefixIcon: Icon(
                        MdiIcons.ticketPercentOutline,
                        size: 22,
                        color: AppTheme.theme.colorScheme.onBackground
                            .withAlpha(150),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  FxButton.medium(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroceryCouponScreen()));
                    },
                    child: FxText.button("Find",
                        letterSpacing: 0.5,
                        fontWeight: 600,
                        color: AppTheme.customTheme.groceryOnPrimary),
                    backgroundColor: AppTheme.customTheme.groceryPrimary,
                    borderRadiusAll: 4,
                    padding: Spacing.xy(32, 12),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2("Subtotal", fontWeight: 600),
                    FxText.b2("\$86.50", letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2("Delivery", fontWeight: 600),
                    FxText.b2("\$18.50", letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b2("Tax & Fee", fontWeight: 600),
                    FxText.b2("\$9.99", letterSpacing: 0.25, fontWeight: 600),
                  ],
                ),
                FxSpacing.height(12),
                FxDashedDivider(
                  dashSpace: 6,
                  height: 1.2,
                  dashWidth: 8,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
                FxSpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b1("Total", fontWeight: 700),
                    FxText.b1("\$99.50", letterSpacing: 0.25, fontWeight: 700),
                  ],
                ),
              ],
            ),
            FxSpacing.height(24),
            Center(
              child: FxButton.medium(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryCheckoutScreen()));
                },
                child: FxText.button(
                  "CHECKOUT",
                  letterSpacing: 0.5,
                  fontWeight: 600,
                  color: AppTheme.customTheme.groceryOnPrimary,
                ),
                backgroundColor: AppTheme.customTheme.groceryPrimary,
                borderRadiusAll: 4,
                padding: Spacing.xy(32, 12),
                elevation: 2,
              ),
            )
          ],
        ));
  }

  List<Widget> buildCarts() {
    List<Widget> list = [];

    for (int i = 0; i < carts.length; i++) {
      list.add(SingleCartWidget(context, carts[i]));
      if (i + 1 < carts.length) list.add(FxSpacing.height(16));
    }

    return list;
  }
}

class SingleCartWidget extends StatefulWidget {
  final BuildContext rootContext;
  final Cart cart;

  const SingleCartWidget(this.rootContext, this.cart);

  @override
  _SingleCartWidgetState createState() => _SingleCartWidgetState();
}

class _SingleCartWidgetState extends State<SingleCartWidget> {
  late int quantity;
  late BuildContext rootContext;

  String? heroKey;

  @override
  void initState() {
    super.initState();
    quantity = widget.cart.quantity;
    rootContext = widget.rootContext;
    heroKey = Generator.getRandomString(10);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          color: AppTheme.customTheme.groceryBg1,
        ),
        secondaryBackground: Container(
          color: AppTheme.customTheme.groceryBg1,
          padding: Spacing.horizontal(20),
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: Spacing.right(8),
                padding: Spacing.all(16),
                decoration: BoxDecoration(
                    color: AppTheme.customTheme.red.withAlpha(40),
                    shape: BoxShape.circle),
                child: Icon(
                  FeatherIcons.trash,
                  size: 22,
                  color: AppTheme.customTheme.red,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            setState(() {
              //TODO: perform delete operation
            });
          }
        },
        child: FxContainer(
          color: AppTheme.customTheme.groceryBg2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxContainer(
                color: AppTheme.customTheme.groceryPrimary.withAlpha(32),
                padding: Spacing.all(8),
                child: Hero(
                  tag: heroKey!,
                  child: ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.cart.image,
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
                    FxText.b1(widget.cart.name, fontWeight: 600),
                    FxSpacing.height(8),
                    widget.cart.discountedPrice != widget.cart.price
                        ? Row(
                            children: [
                              FxText.caption(
                                  "\$" +
                                      FxTextUtils.doubleToString(
                                          widget.cart.price),
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: 500),
                              // Space.width(8),
                              FxSpacing.width(8),
                              FxText.b2(
                                  "\$" +
                                      FxTextUtils.doubleToString(
                                          widget.cart.discountedPrice),
                                  color:
                                      AppTheme.theme.colorScheme.onBackground,
                                  fontWeight: 700),
                            ],
                          )
                        : FxText.b2(
                            "\$" +
                                FxTextUtils.doubleToString(widget.cart.price),
                            color: AppTheme.theme.colorScheme.onBackground,
                            fontWeight: 700),
                    FxSpacing.height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FxContainer(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          paddingAll: 8,
                          borderRadiusAll: 4,
                          color:
                              AppTheme.customTheme.groceryPrimary.withAlpha(48),
                          child: Icon(
                            MdiIcons.minus,
                            size: 14,
                            color: AppTheme.customTheme.groceryPrimary,
                          ),
                        ),
                        FxSpacing.width(12),
                        FxText.b1(quantity.toString(), fontWeight: 600),
                        FxSpacing.width(12),
                        FxContainer(
                          padding: Spacing.all(8),
                          borderRadiusAll: 4,
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          color: AppTheme.customTheme.groceryPrimary,
                          child: Icon(
                            MdiIcons.plus,
                            size: 14,
                            color: AppTheme.customTheme.groceryOnPrimary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
