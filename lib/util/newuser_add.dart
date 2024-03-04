import 'package:flutter/material.dart';
import 'package:food_app/util/routes.dart';

class newUser extends StatelessWidget {
  const newUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SUCCESSFULLY!!",
            style: TextStyle(
              fontFamily: "Afacad",
              fontWeight: FontWeight.bold,
              fontSize: 30,
             ),
            ),
            Container(
              child: Image.asset("assets/images/Confirmed-bro.png"),
            ),
            Text("ACCOUNT CREATED...",
            style: TextStyle(
              fontFamily: "Afacad",
              fontWeight: FontWeight.bold,
              fontSize: 30,
             ),
            ),
            SizedBox(height: 14),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Go Back To ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, myroutes.loginroute);
                  },
                  child: Text("LogIn",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Afacad",
                      color: Color(hexColor("#f3bc54")),
                    ),
                  ),
                )
              ],
            )
          ],
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