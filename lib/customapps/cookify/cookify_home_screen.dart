import 'dart:ui';

import 'package:UIKit/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import 'cookify_recipe_screen.dart';
import 'models/recipe.dart';

class CookifyHomeScreen extends StatefulWidget {
  @override
  _CookifyHomeScreenState createState() => _CookifyHomeScreenState();
}

class _CookifyHomeScreenState extends State<CookifyHomeScreen> {
  late Recipe recipe;
  late List<Recipe> trendingRecipe;

  @override
  void initState() {
    super.initState();
    recipe = Recipe.getOne();
    trendingRecipe = Recipe.getList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: FxSpacing.top(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: FxSpacing.x(16),
                  child: FxText.h6("Hello Den,",
                      color: AppTheme.customTheme.cookifyPrimary,
                      fontWeight: 800),
                ),
                Container(
                  margin: FxSpacing.x(16),
                  child: FxText.b2("Excited to cook something new today?",
                      color: AppTheme.theme.colorScheme.onBackground,
                      letterSpacing: 0,
                      xMuted: true,
                      fontWeight: 700),
                ),
                FxSpacing.height(16),
                FxContainer(
                    margin: FxSpacing.x(16),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CookifyRecipeScreen()));
                    },
                    splashColor:
                        AppTheme.customTheme.cookifyPrimary.withAlpha(40),
                    color: AppTheme.customTheme.cookifyPrimary.withAlpha(30),
                    child: Row(
                      children: [
                        FxTwoToneIcon(
                          FxTwoToneMdiIcons.outdoor_grill,
                          color: AppTheme.customTheme.cookifyPrimary,
                          size: 48,
                        ),
                        FxSpacing.width(16),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.caption(
                                "You have 12 recipes that\nyou haven\'t tried yet",
                                fontWeight: 700),
                            FxButton.text(
                                padding: FxSpacing.zero,
                                onPressed: () {},
                                splashColor: AppTheme.customTheme.cookifyPrimary
                                    .withAlpha(40),
                                child: FxText.button("See Recipes",
                                    color: AppTheme.customTheme.cookifyPrimary,
                                    decoration: TextDecoration.underline))
                          ],
                        ))
                      ],
                    )),
                FxSpacing.height(16),
                Container(
                  margin: FxSpacing.x(16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CookifyRecipeScreen()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Stack(
                        children: [
                          Image(
                            image: AssetImage(
                                recipe.image),
                          ),
                          Positioned(
                              left: 16,
                              top: 16,
                              child: FxContainer(
                                paddingAll: 8,
                                color: AppTheme.customTheme.cookifyPrimary
                                    .withAlpha(200),
                                child: FxText.button(recipe.tag,
                                    color:
                                        AppTheme.customTheme.cookifyOnPrimary,
                                    fontWeight: 600),
                              )),
                          Positioned(
                              right: 16,
                              top: 16,
                              child: Icon(
                                recipe.favorite
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: AppTheme.customTheme.cookifyPrimary,
                                size: 28,
                              )),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: FxSpacing.fromLTRB(16, 48, 16, 32),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      AppTheme.customTheme.cookifyPrimary
                                          .withAlpha(220),
                                      AppTheme.customTheme.cookifyPrimary
                                          .withAlpha(180),
                                      AppTheme.customTheme.cookifyPrimary
                                          .withAlpha(140),
                                      AppTheme.customTheme.cookifyPrimary
                                          .withAlpha(100),
                                      Colors.transparent
                                    ],
                                        stops: [
                                      0.1,
                                      0.25,
                                      0.5,
                                      0.7,
                                      1
                                    ])),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FxText.h5(recipe.title,
                                        color: Colors.white, fontWeight: 800),
                                    FxSpacing.height(16),
                                    FxText.caption(
                                        recipe.preparationTime.toString() +
                                            " Recipes | " +
                                            recipe.serving.toString() +
                                            " Serving",
                                        color: Colors.white,
                                        fontWeight: 600),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                FxSpacing.height(16),
                Container(
                    margin: FxSpacing.x(16),
                    child: FxText.sh1(
                      "Trending Recipe",
                      fontWeight: 800,
                    )),
                FxSpacing.height(16),
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: recipeList(),
                  ),
                ),
                FxSpacing.height(16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> recipeList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(16));

    for (int i = 0; i < trendingRecipe.length; i++) {
      list.add(singleRecipe(trendingRecipe[i]));
      list.add(FxSpacing.width(16));
    }

    return list;
  }

  Widget singleRecipe(Recipe recipe) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Image(
              image:
                  AssetImage(recipe.image),
              width: 240,
            ),
            Positioned(
                left: 16,
                top: 16,
                child: FxContainer(
                  paddingAll: 8,
                  color: Colors.black.withAlpha(200),
                  child: FxText.button(recipe.tag,
                      color: AppTheme.customTheme.cookifyOnPrimary,
                      fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: FxContainer(
                  padding: FxSpacing.xy(12, 16),
                  color: Color.lerp(AppTheme.customTheme.cookifyPrimary,
                          Colors.black, 0.9)!
                      .withAlpha(160),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FxText.sh1(recipe.title,
                                color: Colors.white, fontWeight: 800),
                          ),
                          Icon(
                            recipe.favorite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: AppTheme.customTheme.cookifyPrimary,
                            size: 18,
                          )
                        ],
                      ),
                      FxSpacing.height(16),
                      FxText.overline(
                          recipe.preparationTime.toString() +
                              " Recipes | " +
                              recipe.serving.toString() +
                              " Serving",
                          color: Colors.white,
                          fontWeight: 600),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
