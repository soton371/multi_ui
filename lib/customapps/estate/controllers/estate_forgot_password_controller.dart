import 'package:flutter/cupertino.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateForgotPasswordController extends FxController{

  late TextEditingController emailController = TextEditingController();

  @override
  String getTag() {
    return "estate_forgot_password_controller";
  }

}