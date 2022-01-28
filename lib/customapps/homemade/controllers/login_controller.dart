import 'package:UIKit/customapps/homemade/views/forgot_password_screen.dart';
import 'package:UIKit/customapps/homemade/views/full_app.dart';
import 'package:UIKit/customapps/homemade/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class LogInController extends FxController{

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();


  void login() {

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FullApp()),
    );
  }


  void goToForgotPassword() {

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ForgotPasswordScreen()),
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
    return "login_controller";
  }





}