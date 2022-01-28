import 'package:UIKit/customapps/dating/models/profile.dart';
import 'package:UIKit/customapps/dating/views/dating_matched_profile_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_single_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DatingSingleProfileController extends FxController {
  Profile profile;
  DatingSingleProfileController(this.profile);

  bool showLoading = true, uiLoading = true;
  @override
  initState() {
    super.initState();
    this.save=false;
    fetchData();
  }

  void fetchData() async {

    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack(){
    Navigator.pop(context);
  }

  void goToSingleChatScreen(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingSingleChatScreen(profile)));
  }



  @override
  String getTag() {
    return "dating_single_profile_controller";
  }
}
