import 'package:UIKit/customapps/estate/controllers/estate_single_agent_controller.dart';
import 'package:UIKit/customapps/estate/models/agent.dart';
import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/builder.dart';
import 'package:flutx/core/state_management/controller_store.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import '../../../AppTheme.dart';
import '../../../LoadingScreens.dart';
import 'estate_single_estate_screen.dart';

class EstateSingleAgentScreen extends StatefulWidget {
  final Agent agent;
  const EstateSingleAgentScreen(this.agent);

  @override
  _EstateSingleAgentScreenState createState() =>
      _EstateSingleAgentScreenState();
}

class _EstateSingleAgentScreenState extends State<EstateSingleAgentScreen> {
  late ThemeData theme;
  late CustomAppTheme customTheme;
  late EstateSingleAgentController estateSingleAgentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSingleAgentController = FxControllerStore().putOrFind(EstateSingleAgentController(widget.agent));

  }

  Widget _buildSingleHouse(House house) {
    return FxCard(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: FxSpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
            clipBehavior: Clip.hardEdge,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(house.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.b1(
            house.name,
            fontWeight: 700,
          ),
          FxSpacing.height(4),
          FxText.caption(
            house.location,
            xMuted: true,
          ),
          FxSpacing.height(4),
          FxText.caption(
            house.price,

          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in estateSingleAgentController.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EstateSingleAgentController>(
        controller: estateSingleAgentController,
        builder: (estateSingleAgentController) {
          return Theme(
            data: FxAppTheme.theme.copyWith(
                colorScheme: AppTheme.theme.colorScheme.copyWith(
                    secondary: AppTheme.customTheme.estatePrimary.withAlpha(80))),
            child: Scaffold(

              body: Padding(
                padding: FxSpacing.top(32),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: estateSingleAgentController.showLoading
                          ? LinearProgressIndicator(
                        color: AppTheme.customTheme.estatePrimary,
                        minHeight: 2,
                      )
                          : Container(
                        height: 2,
                      ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (estateSingleAgentController.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingScreens.getSearchLoadingScreen(
            context,
            theme,
            customTheme,
          ));
    } else {
      return ListView(
        padding: FxSpacing.top(8),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FxContainer.bordered(
                    paddingAll: 4,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: FxAppTheme.theme.colorScheme.onBackground
                          .withAlpha(200),
                    ),
                  ),
                ),
                FxSpacing.width(64),
                FxText.b1(
                  'Agent Profile',
                  fontWeight: 700,
                ),

              ],
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: FxContainer(
              paddingAll: 12,
              borderRadiusAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: 12,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(estateSingleAgentController.agent.image),
                        ),
                      ),
                      FxSpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b1(
                            estateSingleAgentController.agent.name,
                            fontWeight: 700,
                          ),
                          FxSpacing.height(8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: FxAppTheme.theme.colorScheme.onBackground
                                    .withAlpha(180),
                              ),
                              FxSpacing.width(4),
                              FxText.caption(
                                estateSingleAgentController.agent.address,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.caption(
                    'Information',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: AppTheme.customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: AppTheme.customTheme.estatePrimary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.caption(
                        estateSingleAgentController.agent.number,
                      ),
                    ],
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: AppTheme.customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: AppTheme.customTheme.estatePrimary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.caption(
                        estateSingleAgentController.agent.properties,
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.caption(
                    'About Me',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: estateSingleAgentController.agent.description,
                          style: FxTextStyle.caption(
                            color: FxAppTheme.theme.colorScheme.onBackground,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: FxTextStyle.caption(
                          color: AppTheme.customTheme.estatePrimary,
                        ),
                      ),
                    ]),
                  ),
                  FxSpacing.height(16),
                  FxButton.block(
                    padding: FxSpacing.symmetric(horizontal: 24, vertical: 16),
                    onPressed: () {
                      estateSingleAgentController.goToAgentChat();
                    },
                    child: FxText.b2(
                      'Ask A Question',
                      color: AppTheme.customTheme.estateOnPrimary,
                      fontWeight: 700,
                    ),
                    backgroundColor: AppTheme.customTheme.estatePrimary,
                    borderRadiusAll: 12,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          FxSpacing.height(16),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b2(
                  'Agent Listings',
                  fontWeight: 700,
                ),
                FxText.overline(
                  'See All',
                  xMuted: true,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildHouseList(),
            ),
          ),
        ],
      );
    }
  }
}
