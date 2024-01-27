import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }

}