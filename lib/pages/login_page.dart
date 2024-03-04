import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/util/routes.dart';

void main() {
  runApp(MaterialApp());
}

class loginpage extends StatefulWidget {

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  bool _obscureText = true;
  bool isHover = false;
  String username = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email == " " || password == " "){
      log("Please fill all the fields!!");
    }
    else{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);
        if(userCredential != null){

          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage(username: username),)
          );
        }
      }on FirebaseAuthException catch(ex){
        log(ex.code.toString());
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(child: Image.asset("assets/images/login_image.png"),
                  height: 350,
                ),
                SizedBox(height: 8.0),
                Text("WELCOME $username",
                  textAlign: TextAlign.center,
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
                        onChanged: (value){
                          setState(() {
                            username = value;
                          });
                        },
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
                                  _obscureText ? Icons.visibility:
                                  Icons.visibility_off
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 18.0),
                MouseRegion(
                  onHover: (event){
                    setState(() {
                      isHover=true;
                    });
                  },
                  onExit: (event){
                    setState(() {
                      isHover=false;
                    });
                  },
                  child: ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()){
                      login();
                      setState(() {
                        isHover = false;
                      });
                    }
                  },
                    child: Text("LogIn",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Afacad",
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isHover ? Colors.black:Color(hexColor("#f3bc54")),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New user??",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, myroutes.signuproute);
                        },
                        child: Text("SignUp",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Afacad",
                            color: Color(hexColor("#f3bc54")),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
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