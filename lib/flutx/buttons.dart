import 'package:flutter/material.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: FxAppTheme.customTheme.bgLayer1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(MdiIcons.chevronLeft),
        ),
        title: FxText.sh1("Button", fontWeight: 600),
      ),
      body: ListView(
        padding: FxSpacing.all(24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                onPressed: () {},
                child: FxText.b2(
                  'Small',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),
                backgroundColor: FxAppTheme.theme.primaryColor,
              ),
              FxButton.medium(
                onPressed: () {},
                child: FxText.b2(
                  'Medium',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),
                backgroundColor: FxAppTheme.theme.primaryColor,
              ),
              FxButton.large(
                onPressed: () {},
                child: FxText.b2(
                  'Large',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),
                backgroundColor: FxAppTheme.theme.primaryColor,
              ),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                buttonType: FxButtonType.outlined,
                borderColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Small',
                  color: FxAppTheme.theme.primaryColor,
                ),
              ),
              FxButton.medium(
                buttonType: FxButtonType.outlined,
                borderColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Medium',
                  color: FxAppTheme.theme.primaryColor,
                ),
              ),
              FxButton.large(
                buttonType: FxButtonType.outlined,
                borderColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Large',
                  color: FxAppTheme.theme.primaryColor,
                ),
              ),

            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.small(
                borderRadiusAll: 4,
                backgroundColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Small',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),

              ),
              FxButton.medium(
                borderRadiusAll: 4,
                backgroundColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Medium',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),

              ),
              FxButton.large(
                borderRadiusAll: 4,
                backgroundColor: FxAppTheme.theme.primaryColor,
                onPressed: () {},
                child: FxText.b2(
                  'Large',
                  color: FxAppTheme.theme.colorScheme.onPrimary,
                ),

              ),

            ],
          ),
          FxSpacing.height(24),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxButton.small(onPressed: (){}, child:FxText.b2(
                    'Small',
                    color: FxAppTheme.theme.colorScheme.primary,
                  ),
                    splashColor: FxAppTheme.theme.primaryColor.withAlpha(40),
                    buttonType: FxButtonType.text,
                  ),
                  FxButton.medium(onPressed: (){}, child:FxText.b2(
                    'Medium',
                    color: FxAppTheme.theme.colorScheme.primary,
                  ),
                    buttonType: FxButtonType.text,
                    splashColor: FxAppTheme.theme.primaryColor.withAlpha(40),
                  ),
                  FxButton.large(onPressed: (){}, child:FxText.b2(
                    'Large',
                    color: FxAppTheme.theme.colorScheme.primary,
                  ),
                    buttonType: FxButtonType.text,
                    splashColor: FxAppTheme.theme.primaryColor.withAlpha(40),
                  ),
                ],
              ),
          FxSpacing.height(24),
          FxButton.block(onPressed: (){}, child: FxText.b2('Block',color: FxAppTheme.theme.colorScheme.onPrimary,),
          backgroundColor: FxAppTheme.theme.primaryColor,),
        ],
      ),
    );
  }
}
