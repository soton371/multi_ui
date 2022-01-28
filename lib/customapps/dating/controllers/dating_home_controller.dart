import 'dart:developer';

import 'package:UIKit/customapps/dating/models/profile.dart';
import 'package:UIKit/customapps/dating/views/dating_matched_profile_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_profile_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_single_chat_screen.dart';
import 'package:UIKit/customapps/dating/views/dating_single_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class DatingHomeController extends FxController {
  bool showLoading = true, uiLoading = true;

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numPages = 10;
  List<Profile>? profiles;

  @override
  initState() {
    super.initState();
    super.save = false;
    fetchData();
  }

  nextPage() async {
    if (currentPage == numPages) {



      /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => FullApp()));*/
    } else {
      await pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }
  void goToMatchedProfileScreen(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingMatchedProfileScreen(profiles![currentPage])));
  }

  void goToSingleChatScreen(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingSingleChatScreen(profiles![currentPage])));
  }

  void goToProfileScreen(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingProfileScreen()));
  }


  previousPage() async {
    if (currentPage == 1) {
      /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => FullApp()));*/
    } else {
      await pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  onPageChanged(int page, {bool fromUser = false}) async {
    if (!fromUser) currentPage = page;
    update();
    if (fromUser) {
      await pageController.animateToPage(
        page,
        duration: Duration(milliseconds: 600),
        curve: Curves.ease,
      );
    }
  }

  void goToSingleProfileScreen(Profile profile){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatingSingleProfileScreen(profile)));
  }





  @override
  void dispose() {

    if(pageController.hasClients)
       pageController.dispose();
    super.dispose();
  }

  void fetchData() async {

    profiles=await Profile.getDummyList();

    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "dating_home_controller";
  }
}
