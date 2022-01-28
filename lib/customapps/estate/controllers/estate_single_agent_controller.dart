import 'package:UIKit/customapps/estate/models/agent.dart';
import 'package:UIKit/customapps/estate/models/chat.dart';
import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:UIKit/customapps/estate/views/estate_single_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateSingleAgentController extends FxController{
  bool showLoading = true, uiLoading=true;

  List<House>? houses;
  late Agent agent;

  EstateSingleAgentController(this.agent);

  @override
  initState(){
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async{

    await Future.delayed(Duration(seconds: 1));

    houses = House.houseList();

    showLoading = false;
    uiLoading = false;
    update();
  }


  void goToAgentChat(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EstateSingleChatScreen(Chat.getOne())));
  }



  @override
  String getTag() {
   return "estate_single_agent_controller";
  }

}