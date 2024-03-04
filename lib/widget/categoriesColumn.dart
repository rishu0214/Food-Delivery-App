import 'package:flutter/material.dart';
import 'package:food_app/helper/alcohol_page.dart';
import 'package:food_app/helper/burger_page.dart';
import 'package:food_app/helper/chicken_page.dart';
import 'package:food_app/helper/cuisines_page.dart';
import 'package:food_app/helper/dessert_page.dart';
import 'package:food_app/helper/drinks_page.dart';
import 'package:food_app/helper/pizza_page.dart';
import 'package:food_app/helper/snacks_page.dart';


class CategoriesColumn extends StatelessWidget {

  // List of image indices and corresponding category names
  final List<int> imageIndices = [1, 2, 3, 4, 5, 6, 7, 8];
  final List<String> categoryNames = [
    "Pizza",
    "Burger",
    "Dessert",
    "Drinks",
    "Cuisines",
    "Snacks",
    "Chicken",
    "Alcohol",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(imageIndices.length, (index) {
          int imageIndex = imageIndices[index];
          String categoryName = categoryNames[index];

          return GestureDetector(
            onTap: (){
              navigateToPage(index, context);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              padding: EdgeInsets.symmetric(vertical: 35, horizontal:25),
              decoration: BoxDecoration(
                color: Color(hexColor('#FFF8E7')),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius:9,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/r_images/$imageIndex.jpg",
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Afacad",
                    ),
                  )
                ],
              ),
            ),
          );
        }),
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

void navigateToPage(int index, BuildContext context) {

  switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaPage()));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => BurgerPage()));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => DessertPage()));
      break;
    case 3:
      Navigator.push(context, MaterialPageRoute(builder: (context) => DrinksPage()));
      break;
    case 4:
      Navigator.push(context, MaterialPageRoute(builder: (context) => CuisinesPage()));
      break;
    case 5:
      Navigator.push(context, MaterialPageRoute(builder: (context) => SnacksPage()));
      break;
    case 6:
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChickenPage()));
      break;
    case 7:
      Navigator.push(context, MaterialPageRoute(builder: (context) => AlcoholPage()));
      break;
  }
}