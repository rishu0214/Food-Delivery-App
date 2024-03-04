import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowPizzaPage extends StatefulWidget {
  @override
  State<ShowPizzaPage> createState() => _ShowPizzaPageState();
}

class _ShowPizzaPageState extends State<ShowPizzaPage> {

  final List<int> imageIndices = [1, 2, 3, 4, 5, 6];

  final List<String> containerContents = [
    "Chicken Pizza",
    "Cheese Pizza",
    "Zesty Ham Pizza",
    "Supreme Pizza",
    "Zesty Pepperoni",
    "Veggie Pizza",
  ];

  final List<String> containerLists = [
    "Barbeque Chicken",
    "Mixed Pizza",
    "Tasty Ham Pizza",
    "Large Pizza",
    "Tasty Pizza",
    "Masala Pizza",
  ];

  final List<String> priceLists = ["299", "239", "159", "149", "159", "169"];

  List<bool> isFavoriteList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(imageIndices.length, (index) {
            int imageIndex = imageIndices[index];
            String containerContent = containerContents[index];
            String priceList = priceLists[index];
            String containerList = containerLists[index];
            bool isFavorite = isFavoriteList[index];


            return Container(
              margin: EdgeInsets.fromLTRB(10, 10, 30, 10),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(hexColor('#FFF8E7')),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 130, // Set the desired width
                    height: 90, // Set the desired height
                    child: Image.asset(
                      "assets/p_page_images/$imageIndex.png",
                      fit: BoxFit.cover,
                      width: 130,
                      height: 90,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        containerContent,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: "Afacad"),
                      ),
                      SizedBox(height: 5),
                      Text(containerList),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$$priceList',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: "Afacad"),
                          ),
                          SizedBox(width: 40),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                // Toggle the favorite state when the button is pressed
                                isFavoriteList[index] = !isFavoriteList[index];
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color: isFavorite ? Colors.red : null,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
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