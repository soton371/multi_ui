import 'package:flutter/cupertino.dart';
import 'package:flutx/core/state_management/controller.dart';

class SplashController extends FxController{

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();


  @override
  String getTag() {
    return "splash_controller";
  }

}
