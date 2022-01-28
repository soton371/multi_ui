import 'package:flutter/cupertino.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateRegisterController extends FxController{

  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();


  @override
  String getTag() {
    return "estate_register_controller";
  }

}