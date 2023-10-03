import 'package:app_spot_task/controller/authControoler.dart';
import 'package:app_spot_task/screens/authScreen/signUpScreen.dart';
import 'package:app_spot_task/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var auth=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var mq=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Column(
              children: [
                Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: mq.height*.2,),
                TextField(
                  controller: auth.email,
                  decoration: InputDecoration(
                      hintText: "Email"
                  )
                ),
                SizedBox(height:10),
                TextField(
                  controller: auth.password,
                  decoration: InputDecoration(
                      hintText: "Email"
                  )
                ),
                SizedBox(height:20),
                ElevatedButton(onPressed: (){
                  auth.handleLogin();
                }, child: Text("Login")),
                SizedBox(height:20),
                TextButton(onPressed: (){
                  Get.to(()=>SignUpScreen());
                }, child: Text("Create and Account"))
              ],
            )


          ],
        ),
      ),
    );
  }
}
