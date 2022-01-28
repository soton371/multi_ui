import 'package:flutter/material.dart';
import 'package:flutx/icons/two_tone/two_tone_icon.dart';
import 'package:flutx/icons/two_tone/two_tone_mdi_icons.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../AppTheme.dart';

class TwoToneIcons extends StatefulWidget {
  @override
  _TwoToneIconsState createState() => _TwoToneIconsState();
}

class _TwoToneIconsState extends State<TwoToneIcons> {


  @override
  Widget build(BuildContext context) {



        return Scaffold(
          backgroundColor: FxAppTheme.customTheme.bgLayer2,
          appBar: AppBar(
            elevation: 0,
            backgroundColor:FxAppTheme.customTheme.bgLayer2,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(MdiIcons.chevronLeft),
            ),
            title: FxText.sh1("Two Tone Icons",fontWeight: 600),
          ),

          body: ListView(
            padding: FxSpacing.vertical(16),
            children: [
              GridView.count(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 4,
                  padding: FxSpacing.all(8),
                  mainAxisSpacing: 16,
                  childAspectRatio: 3/ 2,
                  crossAxisSpacing: 16,children: <Widget>[

                FxTwoToneIcon(FxTwoToneMdiIcons.panorama_fish_eye,color: AppTheme.customTheme.violet,),
                FxTwoToneIcon(FxTwoToneMdiIcons.add_circle,color: AppTheme.customTheme.violet,),
                  FxTwoToneIcon(FxTwoToneMdiIcons.play_circle_filled,color: AppTheme.customTheme.violet,),
                FxTwoToneIcon(FxTwoToneMdiIcons.account_circle,color: AppTheme.customTheme.violet,),

                FxTwoToneIcon(FxTwoToneMdiIcons.check_box,color: AppTheme.customTheme.indigo,),
                FxTwoToneIcon(FxTwoToneMdiIcons.add_box,color: AppTheme.customTheme.indigo,),
                FxTwoToneIcon(FxTwoToneMdiIcons.slideshow,color: AppTheme.customTheme.indigo,),
                FxTwoToneIcon(FxTwoToneMdiIcons.account_box,color: AppTheme.customTheme.indigo,),

                FxTwoToneIcon(FxTwoToneMdiIcons.change_history,color: AppTheme.customTheme.blue,),
                FxTwoToneIcon(FxTwoToneMdiIcons.warning,color: AppTheme.customTheme.blue,),
                FxTwoToneIcon(FxTwoToneMdiIcons.details,color: AppTheme.customTheme.blue,),
                FxTwoToneIcon(FxTwoToneMdiIcons.eject,color: AppTheme.customTheme.blue,),

                FxTwoToneIcon(FxTwoToneMdiIcons.face,color: AppTheme.customTheme.green,),
                FxTwoToneIcon(FxTwoToneMdiIcons.sentiment_very_satisfied,color: AppTheme.customTheme.green,),
                FxTwoToneIcon(FxTwoToneMdiIcons.sentiment_neutral,color: AppTheme.customTheme.green,),
                FxTwoToneIcon(FxTwoToneMdiIcons.sentiment_very_dissatisfied,color: AppTheme.customTheme.green,),

                FxTwoToneIcon(FxTwoToneMdiIcons.star,color: AppTheme.customTheme.yellow,),
                FxTwoToneIcon(FxTwoToneMdiIcons.star_half,color: AppTheme.customTheme.yellow,),
                FxTwoToneIcon(FxTwoToneMdiIcons.stars,color: AppTheme.customTheme.yellow,),
                FxTwoToneIcon(FxTwoToneMdiIcons.new_releases,color: AppTheme.customTheme.yellow,),

                FxTwoToneIcon(FxTwoToneMdiIcons.home,color: AppTheme.customTheme.orange,),
                FxTwoToneIcon(FxTwoToneMdiIcons.home_work,color: AppTheme.customTheme.orange,),
                FxTwoToneIcon(FxTwoToneMdiIcons.deck,color: AppTheme.customTheme.orange,),
                FxTwoToneIcon(FxTwoToneMdiIcons.night_shelter,color: AppTheme.customTheme.orange,),

                FxTwoToneIcon(FxTwoToneMdiIcons.admin_panel_settings,color: AppTheme.customTheme.red,),
                FxTwoToneIcon(FxTwoToneMdiIcons.bookmark,color: AppTheme.customTheme.red,),
                FxTwoToneIcon(FxTwoToneMdiIcons.extension,color: AppTheme.customTheme.red,),
                FxTwoToneIcon(FxTwoToneMdiIcons.pan_tool,color: AppTheme.customTheme.red,),

              ]),

            ],
          ),
        );

  }
}
