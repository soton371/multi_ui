import 'package:UIKit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SingleNewsScreen.dart';

class NewsVideoScreen extends StatefulWidget {
  @override
  _NewsVideoScreenState createState() => _NewsVideoScreenState();
}

class _NewsVideoScreenState extends State<NewsVideoScreen> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: Text("Videos",style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,color: themeData.colorScheme.onBackground,fontWeight: 600),),
                    centerTitle: true,
                  ),
                  body: ListView(
                padding:Spacing.fromLTRB(24,0,24,24),
                children: <Widget>[
                  _singleVideoNews(image: './assets/images/all/all-7.jpg',title: "The Man Who Paid Rs. 55 Lakh To Increase His Height",duration: "22:30",views: "25k"),
                  _singleVideoNews(image: './assets/images/all/all-8.jpg',title: "MINI India Sells 512 Vehicles In 2020",duration: "5:45",views: "1M"),
                  _singleVideoNews(image: './assets/images/all/all-9.jpg',title: "Steve Smith Released By Rajasthan Royals Ahead Auctions",duration: "10:45",views: "3M"),
                  _singleVideoNews(image: './assets/images/all/all-10.jpg',title: "5 Common Myths About Thyroid Disease You Believing",duration: "14:55",views: "5k"),
                  _singleVideoNews(image: './assets/images/all/all-11.jpg',title: "Hunar Haat In Lucknow: When, Where, How Handmade Items",duration: "20:00",views: "700"),
                ],
              )),
            ));
      },
    );
  }


  _singleVideoNews({required String image,required String title,required String duration,required String views}){
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
                  Text(title,style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,color: themeData.colorScheme.onBackground,fontWeight: 600),),
                  SizedBox(height: MySize.size16,),
                  Row(
                    children: [
                      Icon(MdiIcons.clockOutline,color: themeData.colorScheme.onBackground.withAlpha(200),size: MySize.size16,),
                      SizedBox(width: MySize.size8,),
                      Text(duration,style: AppTheme.getTextStyle(themeData.textTheme.caption,color: themeData.colorScheme.onBackground),),
                    ],
                  ),
                  SizedBox(height: MySize.size4,),
                  Row(
                    children: [
                      Icon(MdiIcons.eyeOutline,color: themeData.colorScheme.onBackground.withAlpha(200),size: MySize.size16,),
                      SizedBox(width: MySize.size8,),
                      Text(views +" views",style: AppTheme.getTextStyle(themeData.textTheme.caption,color: themeData.colorScheme.onBackground),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
