import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import 'WorkerInformationScreen.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  int selectedDate = 1;

  _pickDate(BuildContext context) async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }


  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer1,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(
                    "Book a Worker",
                    style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.fromLTRB(24, 16, 24, 0),
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WorkerInformationScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: customAppTheme.bgLayer4, width: 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!))),
                          padding: Spacing.all(16),
                          child: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!)),
                                  child: Image(
                                    image:
                                        AssetImage('./assets/images/avatar.jpg'),
                                    width: MySize.size72,
                                    height: MySize.size72,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: Spacing.left(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dolcie Pineda",
                                        style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      Text(
                                        "Plumber",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600,
                                            xMuted: true),
                                      ),
                                      Container(
                                        margin: Spacing.top(4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  MdiIcons.star,
                                                  color: Generator.starColor,
                                                  size: MySize.size18,
                                                ),
                                                SizedBox(
                                                  width: MySize.size4,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText2,
                                                      color: themeData.colorScheme
                                                          .onBackground,
                                                      fontWeight: 600),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "\$10 per Hour",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 500,
                                                  letterSpacing: 0),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "DATE & TIME",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground,
                                  muted: true,
                                  fontWeight: 700),
                            ),
                            InkWell(
                              onTap: (){
                                _pickDate(context);
                              },
                              child: Icon(
                                MdiIcons.calendarOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground,
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: Spacing.top(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            singleDateWidget(date: "12\nTue", index: 0),
                            singleDateWidget(date: "13\nWed", index: 1),
                            singleDateWidget(date: "14\nThu", index: 2),
                            singleDateWidget(date: "15\nFri", index: 3),
                            singleDateWidget(date: "16\nSat", index: 4),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(24),
                        child: Text(
                          "ADDRESS",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: themeData.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 700),
                        ),
                      ),
                      Container(
                        margin: Spacing.top(16),
                        decoration: BoxDecoration(
                          color: themeData.cardTheme.color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size16!)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(28),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Address",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(MdiIcons.mapMarkerOutline,
                                    size: MySize.size24),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                            ),
                            Divider(
                              height: 0,
                            ),
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Phone",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.phoneOutline,
                                  size: MySize.size24,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            Divider(
                              height: 0,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 500,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: "City",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                          borderSide: BorderSide.none),
                                      prefixIcon: Icon(
                                        MdiIcons.homeCityOutline,
                                        size: MySize.size24,
                                      ),
                                    ),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size8!),
                                    child: TextFormField(
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 500,
                                          letterSpacing: 0.2),
                                      decoration: InputDecoration(
                                        hintStyle: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2,
                                            fontWeight: 500,
                                            letterSpacing: 0,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180)),
                                        hintText: "PIN",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide.none),
                                        prefixIcon: Icon(
                                          MdiIcons.numeric,
                                          size: MySize.size24,
                                        ),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                            ),
                            TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500,
                                  letterSpacing: 0.2),
                              decoration: InputDecoration(
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(180)),
                                hintText: "Work",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(
                                  MdiIcons.informationOutline,
                                  size: MySize.size24,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.top(32),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                onPressed: () {},
                                child: Text("BOOK NOW",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary,
                                        letterSpacing: 0.5))),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleDateWidget({String? date, required int index}) {
    if (selectedDate == index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedDate = index;
          });
        },
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
            color: themeData.colorScheme.primary,
          ),
          padding: Spacing.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              Text(
                date!,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 600,
                    color: themeData.colorScheme.onPrimary,
                    height: 1.9),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: Spacing.top(12),
                height: MySize.size8,
                width: MySize.size8,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.onPrimary,
                    shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size6!)),
            color: customAppTheme.bgLayer1,
            boxShadow: [
              BoxShadow(
                color: customAppTheme.shadowColor,
                blurRadius: MySize.size10!,
                spreadRadius: MySize.size2,
                offset: Offset(0, MySize.size8!),
              )
            ]),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              date!,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600,
                  color: themeData.colorScheme.onBackground,
                  height: 1.9),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }


  Widget singleWorker(
      {required String image,
      required String name,
      required String profession,
      double? perHour,
      double? rate}) {
    return Container(
      margin: Spacing.bottom(16),
      decoration: BoxDecoration(
          border: Border.all(color: customAppTheme.bgLayer4, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      padding: Spacing.all(16),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              child: Image(
                image: AssetImage(image),
                width: MySize.size72,
                height: MySize.size72,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTheme.getTextStyle(
                      themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600,
                    ),
                  ),
                  Text(
                    profession,
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true),
                  ),
                  Container(
                    margin: Spacing.top(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              MdiIcons.star,
                              color: Generator.starColor,
                              size: MySize.size18,
                            ),
                            SizedBox(
                              width: MySize.size4,
                            ),
                            Text(
                              rate.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            )
                          ],
                        ),
                        Text(
                          "\$" + perHour.toString() + " per Hour",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
