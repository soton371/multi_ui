import 'package:UIKit/customapps/estate/views/estate_login_screen.dart';
import 'package:UIKit/customapps/estate/views/estate_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/widgets/card/card.dart';
import 'package:flutx/widgets/text/text.dart';

import '../../../AppTheme.dart';

class EstateSplashScreen extends StatefulWidget {
  const EstateSplashScreen({Key? key}) : super(key: key);

  @override
  _EstateSplashScreenState createState() => _EstateSplashScreenState();
}

class _EstateSplashScreenState extends State<EstateSplashScreen> {

  @override
  initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            image: AssetImage("assets/estate/estate16.jpg"),
          ),
          Positioned(
            top: 132,
            left: 0,
            right: 0,
            child: FxText.h5(
              'Let\'s Find Your',
              color: AppTheme.customTheme.estateOnPrimary,
              textAlign: TextAlign.center, letterSpacing: 0.4,
            ),
          ),
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: FxText.h4(
              'Dream Home',
              color: AppTheme.customTheme.estateOnPrimary,
              textAlign: TextAlign.center,
              fontWeight: 800,
            ),
          ),
          Positioned(
            top: 320,
            child: FxCard(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EstateSearchScreen()),
                );
              },
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              width: MediaQuery.of(context).size.width-64,
              marginAll: 32,
              paddingAll: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxText.b2('Search by location...',fontWeight: 700, color: AppTheme.customTheme.estatePrimary,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 380,
            child: FxCard(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EstateLoginScreen()),
                );
              },
              paddingAll: 24,

              color: AppTheme.customTheme.estatePrimary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
              width: MediaQuery.of(context).size.width-64,
              marginAll: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxText.b2('Join Now',fontWeight: 700,color: AppTheme.customTheme.estateOnPrimary,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
