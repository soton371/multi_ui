import 'package:UIKit/customapps/homemade/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutx/core/state_management/controller.dart';

class ProfileController extends FxController{

  bool showLoading = true, uiLoading=true;
  bool notification = true, offlineReading = false;
  late User user;

  @override
  initState(){
    super.initState();

    fetchData();

  }


  void fetchData()async{

    user=await User.getOne();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();

  }


  void logout() {
    Navigator.pop(context);
  }


  @override
  String getTag() {
    return "profile_controller";
  }

}