import 'package:app_spot_task/screens/authScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authControoler.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var auth = Get.put(AuthController());
  @override

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: mq.height * 0.2),
                  TextFormField(
                    controller: auth.name,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: auth.email,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You can add more specific email validation here if needed.
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: auth.password,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';

                      }
                      // You can add more password validation rules here if needed.
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                       auth.signup();
                       auth.name.text="";
                       auth.email.text="";
                       auth.password.text="";
                      }
                    },
                    child: Text("Sign Up"),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text("Already Have an Account"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
