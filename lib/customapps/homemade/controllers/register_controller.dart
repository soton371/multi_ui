import 'package:UIKit/customapps/homemade/views/full_app.dart';
import 'package:UIKit/customapps/homemade/views/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/core/state_management/controller.dart';

class RegisterController extends FxController{

  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();



  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              FullApp()),
    );
  }

  void goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LogInScreen()),
    );
  }

  @override
  String getTag() {
    return "register_controller";
  }


}