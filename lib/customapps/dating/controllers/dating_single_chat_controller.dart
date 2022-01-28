import 'package:UIKit/customapps/dating/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DatingSingleChatController extends FxController{
  Profile profile;
  DatingSingleChatController(this.profile);

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

  @override
  String getTag() {
    return "dating_single_chat_controller";
  }

}