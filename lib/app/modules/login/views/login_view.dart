import 'package:butomy/app/modules/home/views/home_view.dart';
import 'package:butomy/app/modules/login/views/login_screen_widgets.dart';
import 'package:butomy/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final LoginController loginctrler = Get.put(LoginController());
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
            top: 180,
            child: SizedBox(
                height: 180,
                width: 180,
                child: Image.asset('assets/firebase.png'))),
        Positioned(
            top: 550,
            child: Column(
              children: [
                LoginWidgets().social_media_login_button(
                    container_color: Colors.blue,
                    buttonicon: 'assets/google.jpeg',
                    buttontext: 'Google',
                    onTap: () {
                      loginctrler.signInWithGoogle();
                      Get.to(HomeView());
                    }),
                LoginWidgets().Spacer(),
                LoginWidgets().social_media_login_button(
                    container_color: Colors.green,
                    buttonicon: 'assets/phone.png',
                    buttontext: 'Phone',
                    onTap: () {
                      Get.to(HomeView());
                    }),
              ],
            ))
      ]),
    );
  }

  //
}
