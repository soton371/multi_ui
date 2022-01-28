import 'package:UIKit/customapps/dating/models/profile.dart';
import 'package:UIKit/customapps/dating/views/dating_home_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_single_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class DatingMatchedProfileController extends FxController {
  Profile profile;
  DatingMatchedProfileController(this.profile);

  bool showLoading = true, uiLoading = true;
  @override
  initState() {
    super.initState();
    this.save = false;
    fetchData();
  }

  void fetchData() async {
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToHomeScreen() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DatingHomeScreen()));
  }

  void goToChatScreen() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DatingSingleChatScreen(profile)));
  }

  @override
  String getTag() {
    return "dating_matched_profile_controller";
  }
}
