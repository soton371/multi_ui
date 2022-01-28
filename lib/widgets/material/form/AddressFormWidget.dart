/*
* File : Address Form
* Version : 1.0.0
* */

import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../AppTheme.dart';

class AddressFormWidget extends StatefulWidget {
  @override
  _AddressFormWidgetState createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends State<AddressFormWidget> {

  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Address Form",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  padding: EdgeInsets.all(16),
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Address 1",
                            border: themeData
                                .inputDecorationTheme
                                .border,
                            enabledBorder: themeData
                                .inputDecorationTheme
                                .border,
                            focusedBorder: themeData
                                .inputDecorationTheme
                                .focusedBorder,
                            prefixIcon:
                            Icon(MdiIcons.mapMarker, size: 24),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Address 2",
                              border: themeData
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: themeData
                                  .inputDecorationTheme
                                  .border,
                              focusedBorder: themeData
                                  .inputDecorationTheme
                                  .focusedBorder,
                              prefixIcon: Icon(
                                MdiIcons.mapMarkerPlus,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "House",
                                    border: themeData
                                        .inputDecorationTheme
                                        .border,
                                    enabledBorder: themeData
                                        .inputDecorationTheme
                                        .border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme
                                        .focusedBorder,
                                    prefixIcon: Icon(
                                      MdiIcons.homeOutline,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "PIN Code",
                                      border: themeData
                                          .inputDecorationTheme
                                          .border,
                                      enabledBorder: themeData
                                          .inputDecorationTheme
                                          .border,
                                      focusedBorder: themeData
                                          .inputDecorationTheme
                                          .focusedBorder,
                                      prefixIcon: Icon(
                                        MdiIcons.numeric,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "City",
                              border: themeData
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: themeData
                                  .inputDecorationTheme
                                  .border,
                              focusedBorder: themeData
                                  .inputDecorationTheme
                                  .focusedBorder,
                              prefixIcon: Icon(
                                MdiIcons.homeCity,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Contact",
                              border: themeData
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: themeData
                                  .inputDecorationTheme
                                  .border,
                              focusedBorder: themeData
                                  .inputDecorationTheme
                                  .focusedBorder,
                              prefixIcon: Icon(
                                MdiIcons.phone,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Delivery note",
                              border: themeData
                                  .inputDecorationTheme
                                  .border,
                              enabledBorder: themeData
                                  .inputDecorationTheme
                                  .border,
                              focusedBorder: themeData
                                  .inputDecorationTheme
                                  .focusedBorder,
                              prefixIcon: Icon(
                                MdiIcons.informationOutline,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(28),
                                  blurRadius: 4,
                                  offset: Offset(0,
                                      3), // changes position of shadow
                                ),
                              ],
                            ),

                            child: ElevatedButton(

                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),                                child: Text(
                                  "SAVE",
                                  style: AppTheme.getTextStyle(themeData
                                      .textTheme
                                      .bodyText2,fontWeight: 700,letterSpacing: 0.2,color: themeData.colorScheme.onPrimary)
                                )),
                          ),
                        )
                      ],
                    ))));
      },
    );
  }
}
