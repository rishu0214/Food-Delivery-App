import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helper/alcohol_page.dart';
import 'package:food_app/helper/burger_page.dart';
import 'package:food_app/helper/chicken_page.dart';
import 'package:food_app/helper/cuisines_page.dart';
import 'package:food_app/helper/dessert_page.dart';
import 'package:food_app/helper/drinks_page.dart';
import 'package:food_app/helper/pizza_page.dart';
import 'package:food_app/helper/snacks_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/login_page.dart';
import 'package:food_app/pages/signup_page.dart';
import 'package:food_app/util/newuser_add.dart';
import 'package:food_app/util/routes.dart';
import 'package:food_app/widget/profile.dart';
import 'package:food_app/widget/showpizzapage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCu0VVieZo22K-vYQuC3a8m5xYzWZ64hDQ",
      appId: "1:1015719422827:android:39d4956a180ed1c8bd7a2e",
      messagingSenderId: "1015719422827",
      projectId: "foodapp-7f982",
    )
  );
  runApp(const MyApp());
}
String username = "";
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ?
      homePage(username: username) : loginpage(),
      routes: {
        myroutes.loginroute: (context) => loginpage(),
        myroutes.homeroute: (context) => homePage(username: username),
        myroutes.signuproute: (context) => signupPage(),
        myroutes.newuserroute: (context) => newUser(),
        myroutes.profileroute: (context) => profile(),
        myroutes.showpizzapage: (context) => ShowPizzaPage(),
        myroutes.pizzapage: (context) => PizzaPage(),
        myroutes.burgerpage: (context) => BurgerPage(),
        myroutes.dessertpage: (context) => DessertPage(),
        myroutes.drinkspage: (context) => DrinksPage(),
        myroutes.cuisinespage: (context) => CuisinesPage(),
        myroutes.snackspage: (context) => SnacksPage(),
        myroutes.chickenpage: (context) => ChickenPage(),
        myroutes.alcoholpage: (context) => AlcoholPage(),

      },
    );
  }
}
