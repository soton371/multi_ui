import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../AppTheme.dart';

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme
              .copyWith(secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: FxText.sh1("Notification", fontWeight: 600),
          actions: <Widget>[
            Container(
              margin: Spacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.notificationClearAll,
                  size: 24,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          padding: Spacing.all(16),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FxText.b1(
                    "Offers",
                    fontWeight: 600,
                  ),
                  FxContainer.rounded(
                    margin: Spacing.left(8),
                    width: 18,
                    paddingAll: 0,
                    height: 18,
                    color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                    child: Center(
                        child: FxText.overline(
                      "2",
                      fontWeight: 600,
                      color: AppTheme.customTheme.groceryPrimary,
                    )),
                  )
                ],
              ),
            ),
            Spacing.height(24),
            singleNotification(
                image: './assets/grocery/product-5.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "50% OFF ",
                        style: FxTextStyle.button(
                            color: AppTheme.customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                      text: "in ultraboost all puma ltd shoes",
                      style: FxTextStyle.button(
                          color: AppTheme.theme.colorScheme.onBackground,
                          fontWeight: 500,
                          letterSpacing: 0.2),
                    )
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/grocery/product-2.png',
                text: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "30% OFF ",
                        style: FxTextStyle.button(
                            color: AppTheme.customTheme.groceryPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                    TextSpan(
                        text: "in all cake till 31 july",
                        style: FxTextStyle.button(
                            color: AppTheme.theme.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2))
                  ]),
                ),
                time: "9:35 AM"),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.b1(
                  "Orders",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "8",
                    fontWeight: 600,
                    color: AppTheme.customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/grocery/product-3.png',
                text: FxText.button(
                    "Your cake order has been delivered at Himalaya",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "Just Now"),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/grocery/product-2.png',
                text: FxText.button("last order has been cancelled by seller",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "14 July"),
            FxSpacing.height(24),
            Center(
              child: FxButton.text(
                splashColor: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                child: FxText.button("View all",
                    color: AppTheme.customTheme.groceryPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.2),
                onPressed: () {},
              ),
            ),
            FxSpacing.height(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FxText.b1(
                  "Security",
                  fontWeight: 600,
                ),
                FxContainer.rounded(
                  margin: Spacing.left(8),
                  width: 18,
                  paddingAll: 0,
                  height: 18,
                  color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                  child: Center(
                      child: FxText.overline(
                    "1",
                    fontWeight: 600,
                    color: AppTheme.customTheme.groceryPrimary,
                  )),
                )
              ],
            ),
            FxSpacing.height(24),
            singleNotification(
                image: './assets/grocery/profile.png',
                text: FxText.button("Your account password has been changed",
                    color: AppTheme.theme.colorScheme.onBackground,
                    fontWeight: 500,
                    letterSpacing: 0),
                time: "2 days ago"),
          ],
        ),
      ),
    );
  }

  Widget singleNotification(
      {required String image, Widget? text, required String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FxContainer.rounded(
            width: 52,
            height: 52,
            padding: Spacing.all(10),
            color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
            child: Image.asset(image),
          ),
          Expanded(
            child: Container(margin: Spacing.horizontal(16), child: text),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FxText.caption(time,
                  muted: true, fontWeight: 500, letterSpacing: -0.2),
            ],
          )
        ],
      ),
    );
  }
}
