// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/util/routes.dart';

class MyDrawer extends StatefulWidget {
  final String username;
  MyDrawer({required this.username});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late String username;
  @override
  void initState() {
    super.initState();
    username = widget.username;
  }

  void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacementNamed(context, myroutes.loginroute);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: Color(hexColor('#f3bc54')),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bxx.png"),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text(
                "Rishu",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Afacad",
                ),
              ),
              accountEmail: Text(
                widget.username,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Afacad",
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/ir.jpg"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, myroutes.homeroute);
              },
              child: ListTile(
                title: new Text("Home"),
                leading: new Icon(Icons.home_outlined),
              ),
            ),
            ListTile(
              title: new Text("My Cart"),
              leading: new Icon(Icons.shopping_bag_outlined),
            ),
            ListTile(
              title: new Text("Order History"),
              leading: new Icon(Icons.calendar_month_outlined),
            ),
            ListTile(
              title: new Text("Wallet"),
              leading: new Icon(Icons.wallet_outlined),
            ),
            ListTile(
              title: new Text("Favorites"),
              leading: new Icon(Icons.star_border),
            ),
            ListTile(
              title: new Text("FAQs"),
              leading: new Icon(CupertinoIcons.question),
            ),
            ListTile(
              title: new Text("Support"),
              leading: new Icon(Icons.call),
            ),
            ListTile(
              title: new Text("Setting"),
              leading: new Icon(CupertinoIcons.settings),
            ),
            GestureDetector(
              onTap: (){
                logOut(context);
                },
              child: ListTile(
                title: new Text("Logout"),
                leading: new Icon(Icons.exit_to_app_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}

int hexColor(String c) {
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}
