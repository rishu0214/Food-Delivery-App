import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/routes.dart';


class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  bool _obscureText = true;
  bool _isobscureText = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String Cpassword = cPasswordController.text.trim();

    if (email == "" || password == "" || Cpassword == "") {
      log("Please fill in all fields");
    } else if (password != Cpassword) {
      log("Passwords do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        log("user created");
        if(userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushNamed(context, myroutes.newuserroute);
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Image.asset("assets/images/signupimage.png"),
              height: 300,
            ),
            SizedBox(height: 8.0),
            Text("SIGN UP",
              style: TextStyle(
                color: Color(hexColor("#f3bc54")),
                fontSize: 30,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Afacad",
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureText, // To hide the password
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            _obscureText =! _obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText ? Icons.visibility :
                              Icons.visibility_off
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    controller: cPasswordController,
                    obscureText: _isobscureText, // To hide the password
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            _isobscureText =! _isobscureText;
                          });
                        },
                        child: Icon(
                          _isobscureText ? Icons.visibility :
                              Icons.visibility_off
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 18.0),
            ElevatedButton(onPressed: (){
              createAccount();
            },
                child: Text("SignUp",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Afacad",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(hexColor("#f3bc54")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}


int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}