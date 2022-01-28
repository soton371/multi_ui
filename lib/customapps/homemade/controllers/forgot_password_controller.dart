import 'package:UIKit/customapps/homemade/views/full_app.dart';
import 'package:UIKit/customapps/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class ForgotPasswordController extends FxController {
  late TextEditingController emailController = TextEditingController();

  void forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FullApp()),
    );
  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RegisterScreen()),
    );
  }


  @override
  String getTag() {
    return "forgot_password_controller";
  }




}
