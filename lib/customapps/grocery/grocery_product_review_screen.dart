import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/color_utils.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/utils/generators/star_rating.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';

class GroceryProductReviewScreen extends StatefulWidget {
  @override
  _GroceryProductReviewScreenState createState() =>
      _GroceryProductReviewScreenState();
}

class _GroceryProductReviewScreenState extends State<GroceryProductReviewScreen>
    with SingleTickerProviderStateMixin {


  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: FxAppTheme.customTheme.bgLayer2,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                MdiIcons.chevronLeft,
                size: 20,
                color: AppTheme.theme.colorScheme.onBackground,
              ),
            ),
            title: FxText("Reviews",fontWeight: 600
            ),
          ),
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          body: ListView(
            padding: Spacing.fromLTRB(24, 8, 24, 0),
            children: <Widget>[
              _buildRatingWidget(),
              FxSpacing.height(24),
              _singleReview(
                  image: "./assets/images/avatar-4.jpg",
                  name: "Tegan Payne",
                  rating: 5,
                  review: Generator.getDummyText(32),
                  time: "1 day ago"),
              _singleReview(
                  image: "./assets/images/avatar-3.jpg",
                  name: "Jamal Rossi",
                  rating: 4,
                  review: Generator.getDummyText(25),
                  time: "7 days ago"),
              _singleReview(
                  image: "./assets/images/avatar-2.jpg",
                  name: "Harvie Duncan",
                  rating: 4,
                  review: Generator.getDummyText(30),
                  time: "1 month ago"),
              // Space.height(8),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: FxText.b2("Write a Review",
                      letterSpacing: 0,
                      color: AppTheme.customTheme.groceryPrimary,
                      fontWeight: 600),
                ),
              )
            ],
          )),
    );
  }

  Widget _singleReview(
      {required String image,
      required String name,
      required double rating,
      required String time,
      required String review}) {
    return Container(
      margin: Spacing.bottom(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Container(
                  margin: Spacing.left(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.b2(name, fontWeight: 600),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FxStarRating.buildRatingStar(
                              rating: rating,
                              activeColor: AppTheme.customTheme.groceryPrimary,
                              showInactive: false,
                              spacing: 0),
                          FxSpacing.width(4),
                          FxText.b2(rating.toString(), fontWeight: 600)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              FxText.caption(
                time,
                muted: true,
                fontWeight: 600,
              )
            ],
          ),
          FxSpacing.height(8),
          FxText.caption(
            "- " + review,

          )
        ],
      ),
    );
  }

  Widget _buildRatingWidget() {
    List<int> ratingList = [0, 1, 2, 3, 4, 5];
    List<Widget> list = [];
    int maxRating = 5;
    for (int i = 5; i > 0; i--) {
      int progress = ((ratingList[i] / maxRating) * 100).ceil();
      list.add(Row(
        children: [
          Container(
            child: FxText.caption(i.toString(),
                color: AppTheme.theme.colorScheme.onBackground,
                fontWeight: 600),
          ),
          FxSpacing.width(4),
          Icon(
            MdiIcons.starOutline,
            color: AppTheme.theme.colorScheme.onBackground,
            size: 10,
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(8),
              height: 4,
              decoration: BoxDecoration(
                  color: AppTheme.theme.colorScheme.onBackground.withAlpha(60),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: progress,
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                          color: FxColorUtils.getColorByRating()[i],
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                    ),
                  ),
                  Expanded(
                    flex: 100 - progress,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: Spacing.left(8),
            child: FxText.caption(
              ratingList[i].toString(),color: AppTheme.theme.colorScheme.onBackground, muted: true
            ),
          )
        ],
      ));
    }

    return FxContainer(
      padding: Spacing.all(16),

      bordered: true,
      border: Border.all(color: FxAppTheme.customTheme.border2),
      color: FxAppTheme.customTheme.bgLayer2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  margin: Spacing.fromLTRB(8, 0, 16, 0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: Spacing.fromLTRB(0, 4, 2, 0),
                              child: FxText.sh2(
                                "4.6",fontWeight: 600,
                                  letterSpacing: 0.25

                              ),
                            ),
                            Icon(
                              MdiIcons.starOutline,
                              color: AppTheme.theme.colorScheme.onBackground,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(4),
                        child: FxText.caption(
                          "15 Ratings",muted: true

                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: list,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
