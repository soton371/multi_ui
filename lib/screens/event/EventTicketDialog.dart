import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/DashedDivider.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class EventTicketDialog extends StatefulWidget {
  @override
  _EventTicketDialogState createState() => _EventTicketDialogState();
}

class _EventTicketDialogState extends State<EventTicketDialog> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

  int selectedCategory = 0;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySize.size8!),
                      topRight: Radius.circular(MySize.size8!)),
                  child: Image(
                    image: AssetImage('./assets/design/pattern-1.png'),
                    width: MySize.safeWidth,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Flutter Event - 1",
                  style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color:
                                themeData.colorScheme.onBackground,
                                xMuted: true),
                          ),
                          Text(
                            "Fri, April 12, 2020",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color:
                                themeData.colorScheme.onBackground),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color:
                                themeData.colorScheme.onBackground,
                                xMuted: true),
                          ),
                          Text(
                            "8:15 AM",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color:
                                themeData.colorScheme.onBackground),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: Spacing.fromLTRB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Place",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.caption,
                          xMuted: true,
                          color: themeData.colorScheme.onBackground),
                    ),
                    Text(
                      "Parker Drive\n35, County Line Road",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                    )
                  ],
                ),
              ),
              Container(
                margin: Spacing.top(24),
                child: DashedDivider(
                  height: 1,
                  color:
                  themeData.colorScheme.onBackground.withAlpha(60),
                  dashWidth: 7,
                ),
              ),
              Container(
                margin: Spacing.vertical(32),
                child: Center(
                    child: Image(
                      image: AssetImage('./assets/other/barcode.png'),
                      width: MySize.safeWidth! * 0.5,
                      fit: BoxFit.fill,
                    )),
              )
            ],
          )
        );
      },
    );
  }
}
