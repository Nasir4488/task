import 'package:app_spot_task/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var name=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  final auth=FirebaseAuth.instance;
  void signup() async{
    await auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
    await auth.currentUser!.updateDisplayName(name.text);
  }
  void handleLogin() async{
    try{
      await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      update();
      Get.offAll(() => HomeScreen());
    }
    catch (e) {
      // Display a snackbar with the error message
      Get.snackbar(
        "Login Error",
        "Wrong Email or Password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}