import 'package:UIKit/customapps/homemade/models/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutx/core/state_management/controller.dart';

class ChatController extends FxController{

  bool showLoading = true, uiLoading=true;
  List<Chat>? chats;
  late TextEditingController searchController;

  @override
  initState(){
    super.initState();
    searchController=TextEditingController();
    fetchData();

  }

  void fetchData()async{

    await Future.delayed(Duration(seconds: 1));
    chats=await Chat.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();

  }

  @override
  String getTag() {
    return "chat_controller";
  }

}