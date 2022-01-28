import 'package:UIKit/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/styles/shadow.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/text_utils.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import 'models/full_recipe.dart';

class CookifyRecipeScreen extends StatefulWidget {
  @override
  _CookifyRecipeScreenState createState() => _CookifyRecipeScreenState();
}

class _CookifyRecipeScreenState extends State<CookifyRecipeScreen> {
  late FullRecipe recipe;

  @override
  void initState() {
    super.initState();

    recipe = FullRecipe.getSingle();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.cookifyPrimary.withAlpha(80))),
      child: Scaffold(
        backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: FxAppTheme.customTheme.bgLayer1,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: AppTheme.theme.colorScheme.onBackground,
            ),
          ),
          actions: [
            Icon(
              Icons.favorite_border,
              color: AppTheme.customTheme.cookifyPrimary,
            ),
            FxSpacing.width(16)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppTheme.customTheme.cookifyPrimary,
          label: FxText.b2(
            "Watch Video", color: AppTheme.customTheme.cookifyOnPrimary, fontWeight: 600

          ),
          icon: Icon(
            Icons.play_circle_fill,
            color: AppTheme.customTheme.cookifyOnPrimary,
          ),
        ),
        body: Container(
          color: FxAppTheme.theme.scaffoldBackgroundColor,
          child: ListView(
            padding: FxSpacing.fromLTRB(24, 4, 24, 0),
            children: [
              FxText.h5(
                recipe.title,fontWeight: 800, letterSpacing: -0.2
              ),
              FxSpacing.height(8),
              FxText.b2(
                recipe.body,color:
              AppTheme.theme.colorScheme.onBackground.withAlpha(140),
                  letterSpacing: 0,
                  fontWeight: 600

              ),
              FxSpacing.height(24),
              Row(
                children: [
                  Column(
                    children: [
                      FxText.h6(
                        "Nutritions",fontWeight: 700, letterSpacing: -0.2

                      ),
                      FxSpacing.height(16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildNutritionList()),
                    ],
                  ),
                  FxSpacing.width(24),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image(
                        image: AssetImage(recipe.image),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              FxSpacing.height(24),
              FxText.h6(
                "Ingredients",fontWeight: 700, letterSpacing: -0.2
              ),
              FxSpacing.height(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildIngredientList(),
              ),
              FxSpacing.height(24),
              FxText.h6(
                "Preparation",fontWeight: 700, letterSpacing: -0.2

              ),
              FxSpacing.height(16),
              FxText.b2(
                recipe.preparation,fontWeight: 500, letterSpacing: 0, muted: true
              ),
              FxSpacing.height(80)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < recipe.nutritions.length; i++) {
      list.add(singleNutrition(recipe.nutritions[i]));
      if (i + 1 < recipe.nutritions.length) list.add(FxSpacing.height(16));
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return FxCard(
      borderRadiusAll: 50,
      padding: FxSpacing.fromLTRB(8, 8, 12, 8),
      color: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
      shadow: FxShadow(elevation: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FxContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: AppTheme.customTheme.cookifyPrimary.withAlpha(200),
              border: Border.all(
                  color: AppTheme.customTheme.cookifyPrimary, width: 1),
              child: Center(
                  child: FxText.caption(
                FxTextUtils.doubleToString(
                  nutrition.unit,
                ), letterSpacing: 0,
                      color: AppTheme.customTheme.cookifyOnPrimary))),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.button(
                nutrition.name,fontWeight: 600
              ),
              FxText.overline(
                nutrition.unitType,xMuted: true, fontWeight: 600
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildIngredientList() {
    List<Widget> list = [];
    for (Ingredient ingredient in recipe.ingredients) {
      list.add(FxText.button(
        ingredient.ingredient,muted: true, height: 1.7, letterSpacing: 0
      ));
    }
    return list;
  }
}
