import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnacksPage extends StatefulWidget {
  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  final List<int> imageIndices = [1, 2, 3, 4, 5, 6];

  final List<String> containerContents = [
    "Mysore Bonda",
    "Paneer Pakoda",
    "Potato Nuggets",
    "Medu Vada",
    "Samosa",
    "ThattaVadai",
  ];

  final List<String> containerLists = [
    "Crispy Bliss",
    "Spiced Perfection",
    "Crunchy Delight",
    "Lentil Elegance",
    "Triangular Temptation",
    "South Indian Crunch",
  ];

  final List<String> priceLists = ["299", "239", "159", "149", "159", "169"];

  List<bool> isFavoriteList = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(hexColor('#fffcf2')),
          automaticallyImplyLeading: false,
          title: Container(
            width: double.infinity,
            child: Image.asset(
              "assets/download.png",
              fit: BoxFit.cover,
            ),
          ),
          toolbarHeight: 120,
          centerTitle: true,
        ),
        backgroundColor: Color(hexColor('#fffcf2')),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Snacks",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: "Afacad"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Bite-sized delights that pack a punch of flavor, perfect for satisfying cravings and adding a tasty interlude to your day",
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int index = 0; index < imageIndices.length; index++)
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 30, 30, 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(hexColor('#FFF8E7')),
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 9,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 90,
                              child: Image.asset(
                                "assets/s_page_images/${imageIndices[index]}.png",
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
                                  containerContents[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontFamily: "Afacad",
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(containerLists[index]),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      '\$${priceLists[index]}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: "Afacad",
                                      ),
                                    ),
                                    SizedBox(width: 40),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          // Toggle the favorite state when the button is pressed
                                          isFavoriteList[index] =
                                          !isFavoriteList[index];
                                        });
                                      },
                                      icon: Icon(
                                        isFavoriteList[index]
                                            ? Icons.favorite
                                            : Icons.favorite_border_rounded,
                                        color: isFavoriteList[index]
                                            ? Colors.red
                                            : null,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
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
