import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';

class EventFilterDialog extends StatefulWidget {
  @override
  _EventFilterDialogState createState() => _EventFilterDialogState();
}

class _EventFilterDialogState extends State<EventFilterDialog> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

  double _startValue = 30;
  double _endValue = 60;
  int selectedLocation = 0, selectedDate = 2, selectedTOD = 1;

  _pickDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  _pickTime(BuildContext context) async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: Spacing.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          MdiIcons.close,
                          color: themeData.colorScheme.onBackground,
                          size: MySize.size16,
                        ),
                      ),
                      Text(
                        "Filter".toUpperCase(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,
                            fontWeight: 700,
                            color: themeData.colorScheme.onBackground),
                      ),
                      Text(
                        "Reset",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption,fontSize: 12,
                            xMuted: true,letterSpacing: 0,fontWeight: 600,
                            color: themeData.colorScheme.onBackground),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: Text(
                    "Location",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 700),
                  ),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 12, 24, 0),
                  child: locationWidget(),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: Text(
                    "Date",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 700),
                  ),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 12, 24, 0),
                  child: dateWidget(),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: Text(
                    "Time of day",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 700),
                  ),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 12, 24, 0),
                  child: todWidget(),
                ),
                Container(
                  margin: Spacing.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 700),
                      ),
                      Container(
                        margin: Spacing.top(4),
                        child: Text(
                          ((_startValue == 0)
                                  ? "Free"
                                  : "\$" + _startValue.floor().toString()) +
                              " - \$" +
                              _endValue.floor().toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: Spacing.fromLTRB(12, 0, 12, 0),
                  child: SliderTheme(
                    data: SliderThemeData(
                      rangeThumbShape:
                          RoundRangeSliderThumbShape(enabledThumbRadius: 7),
                      trackHeight: 2,
                    ),
                    child: RangeSlider(
                      values: RangeValues(_startValue, _endValue),
                      min: 0,
                      max: 199,
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start.roundToDouble();
                          _endValue = values.end.roundToDouble();
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: Spacing.vertical(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "CANCEL",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  color: themeData.colorScheme.primary,
                                  letterSpacing: 0.5,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                            ),
                            onPressed: () {
                              Navigator.pop(context);

                            },
                            child: Text(
                              "APPLY",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                  color: themeData.colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }

  Widget locationWidget() {
    return Container(
      child: Wrap(
        spacing: MySize.size8!,
        runSpacing: MySize.size8!,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 0;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 0,
                text: "Current location",
                iconData: MdiIcons.mapMarkerOutline),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedLocation = 1;
              });
            },
            child: singleChip(
                isSelected: selectedLocation == 1,
                text: "Search",
                iconData: MdiIcons.magnify),
          ),
        ],
      ),
    );
  }

  Widget todWidget() {
    return Container(
      child: Wrap(
        spacing: MySize.size12!,
        runSpacing: MySize.size12!,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 0;
              });
            },
            child: singleChip(isSelected: selectedTOD == 0, text: "Day"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 1;
              });
            },
            child: singleChip(isSelected: selectedTOD == 1, text: "Night"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedTOD = 2;
                _pickTime(context);
              });
            },
            child: singleChip(
                isSelected: selectedTOD == 2,
                text: "Choose time",
                iconData: MdiIcons.clockOutline),
          ),
        ],
      ),
    );
  }

  Widget dateWidget() {
    return Container(
      child: Wrap(
        spacing: MySize.size12!,
        runSpacing: MySize.size12!,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 0;
              });
            },
            child: singleChip(isSelected: selectedDate == 0, text: "Today"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 1;
              });
            },
            child: singleChip(isSelected: selectedDate == 1, text: "Tomorrow"),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 2;
              });
            },
            child: singleChip(
              isSelected: selectedDate == 2,
              text: "This week",
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedDate = 3;
                _pickDate(context);
              });
            },
            child: singleChip(
                isSelected: selectedDate == 3,
                text: "Choose a date",
                iconData: MdiIcons.calendarOutline),
          ),
        ],
      ),
    );
  }

  Widget singleChip({IconData? iconData, String? text, bool? isSelected}) {
    if (iconData != null) {
      return Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: isSelected!
            ? themeData.colorScheme.primary
            : themeData.colorScheme.primary.withAlpha(24),
        avatar: Icon(iconData,
            size: MySize.size16,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.primary),
        label: Text(
          text!,
          style: AppTheme.getTextStyle(themeData.textTheme.caption,
              fontSize: 12.5,
              color: isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.primary,
              letterSpacing: 0,
              wordSpacing: 0,
              fontWeight: 500),
        ),
        padding: Spacing.fromLTRB(12, 6, 12, 6),
      );
    }

    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: isSelected!
          ? themeData.colorScheme.primary
          : themeData.colorScheme.primary.withAlpha(24),
      label: Text(
        text!,
        style: AppTheme.getTextStyle(themeData.textTheme.caption,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.primary,
            letterSpacing: 0,
            wordSpacing: 0,
            fontWeight: 500),
      ),
      padding: Spacing.fromLTRB(12, 6, 12, 6),
    );
  }
}
