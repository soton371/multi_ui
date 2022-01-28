import 'package:UIKit/customapps/dating/views/dating_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DatingSplashController extends FxController{
  void goToHomeScreen(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingHomeScreen()));
  }

  @override
  String getTag() {
    return "dating_splash_controller";
  }

}
