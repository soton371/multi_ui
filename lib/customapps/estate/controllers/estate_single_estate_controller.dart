import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateSingleEstateController extends FxController{

  bool showLoading = true, uiLoading=true;
  late House house;

  EstateSingleEstateController(this.house);

  @override
  initState(){
    super.save = false;
    super.initState();
    getHouse();
  }

  getHouse() async {

    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "estate_single_estate_controller";
  }

}