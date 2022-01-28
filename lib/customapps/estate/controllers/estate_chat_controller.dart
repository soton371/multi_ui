import 'package:UIKit/customapps/estate/models/chat.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateChatController extends FxController{

  bool showLoading = true, uiLoading=true;
  List<Chat>? chats;

  @override
  initState(){
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async{

    await Future.delayed(Duration(seconds: 1));

    chats=Chat.chatList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "estate_chat_controller";
  }

}