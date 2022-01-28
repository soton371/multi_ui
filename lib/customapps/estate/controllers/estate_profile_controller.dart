import 'package:flutx/core/state_management/controller.dart';

class EstateProfileController extends FxController{

  bool showLoading = true, uiLoading=true;
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
    return "estate_profile_controller";
  }

}