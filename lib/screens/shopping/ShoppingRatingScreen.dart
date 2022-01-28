
import 'package:UIKit/AppThemeNotifier.dart';
import 'package:UIKit/utils/Generator.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';

class ShoppingRatingScreen extends StatefulWidget {
  @override
  _ShoppingRatingScreenState createState() => _ShoppingRatingScreenState();
}

class _ShoppingRatingScreenState extends State<ShoppingRatingScreen> {
  int _currentStep = 4;
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => RatingDialog());
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(), icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text("Rating",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  children: <Widget>[
                    Stepper(
                      // controlsBuilder: (BuildContext context,
                      //     {VoidCallback? onStepContinue,
                      //     VoidCallback? onStepCancel}) {
                      //   return Container();
                      // },
                      currentStep: _currentStep,
                      onStepTapped: (pos) {
                        setState(() {
                          _currentStep = pos;
                        });
                      },
                      steps: <Step>[
                        Step(
                          isActive: true,
                          state: StepState.complete,
                          title: Text('Order placed - 14 April',
                              style: themeData.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2))),
                          content: SizedBox(
                            child: Text("Order was received by seller",
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ),
                        ),
                        Step(
                          isActive: true,
                          state: StepState.complete,
                          title: Text('Payment confirmed - 14 april',
                              style: themeData.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2))),
                          content: SizedBox(
                            child: Text("Pay via debit card",
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ),
                        ),
                        Step(
                          isActive: true,
                          state: StepState.complete,
                          title: Text('Processing - 16 April',
                              style: themeData.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2))),
                          content: SizedBox(
                            child: Text(
                                "It may be take longer time than expected",
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ),
                        ),
                        Step(
                          isActive: true,
                          state: StepState.complete,
                          title: Text('Delivered - 2:30 PM, 18 April',
                              style: themeData.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color:
                                          themeData.colorScheme.onBackground,
                                      letterSpacing: 0.2))),
                          content: SizedBox(
                            child: Text(
                                "Today at 2:30 PM order has been delivered",
                                style: themeData.textTheme.subtitle2!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground))),
                          ),
                        ),
                        Step(
                            isActive: true,
                            state: StepState.indexed,
                            title: Text('Review \& Rating',
                                style: themeData.textTheme.bodyText1!.merge(
                                    TextStyle(
                                        color: themeData
                                            .colorScheme.onBackground,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w700))),
                            content: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("It's time to rate a product"),
                                ],
                              ),
                            )),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(

                          onPressed: () {
                            _showDialog();
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                          ),
                          child: Text(
                            "Rate".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .merge(TextStyle(
                                    color: themeData.colorScheme.onSecondary,
                                    letterSpacing: 0.5,
                                    wordSpacing: 0.5)),
                          )),
                    ),
                  ],
                )));
      },
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectRate = 5;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(MySize.size8!),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MySize.size24!, bottom: MySize.size24!),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Enjoying product?",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 700,
                            letterSpacing: 0)),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      child: Text("How would you rate our service?",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 500,
                              letterSpacing: 0.3)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24!),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: EdgeInsets.all(MySize.size2),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectRate = index + 1;
                                  });
                                },
                                child: index < _selectRate
                                    ? Icon(Icons.star,
                                        size: MySize.size32, color: Generator.starColor)
                                    : Icon(Icons.star_border,
                                        size: MySize.size32, color: Generator.starColor)),
                          );
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: MySize.size12!),
                        child: Text(
                          "Maybe next time",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
