import 'dart:ui';

import 'package:UIKit/AppTheme.dart';
import 'package:UIKit/customapps/cookify/models/category.dart';
import 'package:UIKit/customapps/cookify/models/showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:flutx/widgets/text_field/text_field.dart';

import 'cookify_recipe_screen.dart';

class CookifyShowcaseScreen extends StatefulWidget {
  @override
  _CookifyShowcaseScreenState createState() => _CookifyShowcaseScreenState();
}

class _CookifyShowcaseScreenState extends State<CookifyShowcaseScreen> {
  late List<Showcase> showcases;
  late List<Category> categories;

  @override
  void initState() {
    super.initState();
    showcases = Showcase.getList();
    categories = Category.getList();
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
                  padding: FxSpacing.x(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: FxTextField(
                          prefixIcon: Icon(Icons.search,
                              color: AppTheme.theme.colorScheme.onBackground
                                  .withAlpha(160)),
                          filled: true,
                          labelTextColor:
                          AppTheme.theme.colorScheme.onBackground.withAlpha(200),
                          labelText: "Search",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          cursorColor: AppTheme.customTheme.cookifyPrimary,
                          focusedBorderColor: Colors.transparent,
                          fillColor: FxAppTheme.customTheme.bgLayer2,

                        ),
                      ),
                      FxSpacing.width(16),
                      FxContainer(
                        padding: FxSpacing.all(12),
                        color: AppTheme.customTheme.cookifyPrimary.withAlpha(80),
                        child: Icon(Icons.local_dining_outlined,size: 24,color: AppTheme.customTheme.cookifyPrimary,),
                      ),
                    ],
                  ),
                ),
                FxSpacing.height(16), 
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: buildCategories(),
                  ),
                ),

                Container(
                  padding: FxSpacing.fromLTRB(16,24,16,0),
                  child: Column(
                    children: buildShowcases(),
                  ),
                ),
                Center(child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.customTheme.cookifyPrimary),
                        strokeWidth: 2)),),
                FxSpacing.height(24)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildShowcases() {
    List<Widget> list = [];

    for (Showcase showcase in showcases) {
      list.add(singleShowcase(showcase));
    }

    return list;
  }

  Widget singleShowcase(Showcase showcase) {
    return FxContainer(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CookifyRecipeScreen()));
      },
      color: Colors.transparent,
      padding: FxSpacing.bottom(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              image: AssetImage(showcase.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.b1(
            showcase.title,fontWeight: 700,letterSpacing: 0
          ),
          FxText.button(
            showcase.body,muted: true, fontWeight: 500,letterSpacing: -0.1
          ),
          FxSpacing.height(16),
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                size: 16,
                color: AppTheme.theme.colorScheme.onBackground.withAlpha(200),
              ),
              FxSpacing.width(4),
              FxText.caption(
                showcase.likes.toString(),muted: true
              ),
              FxSpacing.width(16),
              Icon(
                Icons.schedule,
                size: 16,
                color: AppTheme.theme.colorScheme.onBackground.withAlpha(200),
              ),
              FxSpacing.width(4),
              FxText.caption(
                showcase.timeInMinutes.toString() + "'",muted: true
              ),
              FxSpacing.width(24),
              FxText.caption(
                showcase.ingredients.toString() + " Ingredients",muted: true
              )
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildCategories(){
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for(Category category in categories){
      list.add(singleCategory(category));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget singleCategory(Category category){
    return FxContainer(
      paddingAll: 16,
      color: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
      child: Column(
        children: [
          FxTwoToneIcon(category.icon,color: AppTheme.customTheme.cookifyPrimary,size: 28,),
          FxSpacing.height(8),
          FxText.caption(category.title,color: AppTheme.customTheme.cookifyPrimary,)
        ],
      ),
    );
  }
}
