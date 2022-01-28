import 'package:UIKit/screens/chat/ChatWhatsAppPage.dart';
import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SingleNewsScreen.dart';

class NewsEditorProfileScreen extends StatefulWidget {
  @override
  _NewsEditorProfileScreenState createState() =>
      _NewsEditorProfileScreenState();
}

class _NewsEditorProfileScreenState extends State<NewsEditorProfileScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              child: ListView(
                padding: Spacing.all(24),
                children: [
                  Container(
                    margin: Spacing.top(24),
                    padding: Spacing.all(24),
                    decoration: BoxDecoration(
                        color: customAppTheme.bgLayer1,
                        borderRadius: BorderRadius.circular(MySize.size16!),
                        boxShadow: [
                          BoxShadow(
                              color: customAppTheme.shadowColor,
                              blurRadius: MySize.size20!,
                              spreadRadius: MySize.size2,
                              offset: Offset(0, MySize.size4!))
                        ]),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8!)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/images/avatar-2.jpg'),
                                  height: MySize.size100,
                                  width: MySize.size100,
                                )),
                            SizedBox(
                              width: MySize.size24,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Maria M. Boyles",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 700),
                                  ),
                                  Text(
                                    "Main Editor",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        letterSpacing: 0,
                                        muted: true,
                                        fontWeight: 600),
                                  ),
                                  SizedBox(
                                    height: MySize.size8,
                                  ),
                                  Container(
                                    padding: Spacing.all(12),
                                    decoration: BoxDecoration(
                                        color: customAppTheme.bgLayer3,
                                        borderRadius: BorderRadius.circular(
                                            MySize.size8!)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Articles",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 11,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                  letterSpacing: -0.2,
                                                  xMuted: true),
                                            ),
                                            Text(
                                              "54",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Followers",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 11,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                  letterSpacing: -0.2,
                                                  xMuted: true),
                                            ),
                                            Text(
                                              "670",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Rating",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 11,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 600,
                                                  letterSpacing: -0.2,
                                                  xMuted: true),
                                            ),
                                            Text(
                                              "8.8",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MySize.size8,),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatWhatsAppPage()));
                                },
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                child: Text(
                                  "Chat",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onBackground,
                                      xMuted: true,
                                      fontWeight: 600),
                                ),
                              ),
                            ),
                            SizedBox(width: MySize.size16,),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                                child: Text(
                                  "Follow",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 600),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(16),
                    child: Text("Popular works",style: AppTheme.getTextStyle(themeData.textTheme.headline6,color: themeData.colorScheme.onBackground,fontWeight: 700,letterSpacing: 0),),
                  ),
                Container(
                    margin: Spacing.top(4),
                    child: Text("Based on the popularity of articles",style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,color: themeData.colorScheme.onBackground,fontWeight: 600,letterSpacing: 0,xMuted: true),),
                  ),
                  _singleNews(image: './assets/images/all/all-3.jpg',topic: "Politics",author: "Jennifer S. Smith",date: "Nov 6, 2020",headline: "Here's What's Keeping JasminAfter Bigg Boss 14",timeToRead: "10 min read"),
                  _singleNews(image: './assets/images/all/all-4.jpg',topic: "Food",author: "Selena M. Waters",date: "March 12, 2020",headline: "Hunar Haat In Lucknow: When, Where, How Items",timeToRead: "3 min read"),
                  _singleNews(image: './assets/images/all/all-5.jpg',topic: "Lifestyle",author: "Briana G. Holland",date: "April 31, 2020",headline: "5 Common Myths About Thyroid Disease Believing",timeToRead: "5 min read"),
                  _singleNews(image: './assets/images/all/all-2.jpg',topic: "Science",author: "Emily G. Trice",date: "Dec 23, 2020",headline: "Joe Biden Plans Day One Orders To Reverse Trump Decisions.",timeToRead: "2 min read"),

                ],
              ),
            )));
      },
    );
  }

  _singleNews({required String image,required String topic,required String headline,required String author,required String date, required String timeToRead}){
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleNewsScreen()));
      },
      child: Container(
        margin: Spacing.top(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.all(
                    Radius.circular(MySize.size12!)),child: Image.asset(image,width: MySize.size100,height: MySize.size100,fit: BoxFit.cover,)),
            SizedBox(width:MySize.size16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(topic,style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,color: themeData.colorScheme.onBackground,fontWeight: 600,xMuted: true),),
                  SizedBox(height: MySize.size4,),
                  Text(headline,style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,color: themeData.colorScheme.onBackground,fontWeight: 600),),
                  SizedBox(height: MySize.size8,),
                  Text(author,style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,color: themeData.colorScheme.onBackground,fontWeight: 600),),
                  Row(
                    children: [
                      Text(date,style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,color: themeData.colorScheme.onBackground,xMuted: true),),
                      SizedBox(width: MySize.size12,),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.onBackground.withAlpha(100),
                            shape: BoxShape.circle
                        ),
                        width: MySize.size6,
                        height: MySize.size6,
                      ),
                      SizedBox(width: MySize.size4,),
                      Text(timeToRead,style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,color: themeData.colorScheme.onBackground,xMuted: true),),
                      SizedBox(width: MySize.size12,),
                      Icon(MdiIcons.bookmark,color: themeData.colorScheme.primary,size: MySize.size16,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
