import 'package:UIKit/customapps/homemade/models/chat.dart';
import 'package:flutx/core/state_management/controller.dart';

class SingleChatController extends FxController{

  bool showLoading = true, uiLoading=true;

  late Chat chat;

  SingleChatController(this.chat);

  @override
  initState(){
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async{

    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }


  @override
  String getTag() {
    return "estate_single_chat_controller";
  }

}