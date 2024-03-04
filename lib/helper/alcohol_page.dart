import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlcoholPage extends StatefulWidget {
  @override
  State<AlcoholPage> createState() => _AlcoholPageState();
}

class _AlcoholPageState extends State<AlcoholPage> {

  final List<int> imageIndices = [1, 2, 3, 4, 5, 6];
  final List<String> containerContents = ["angel-envy rum", "Royl Ranthambor", "Double Black", "Migrant Whiskey", "Royal Salute", "Whiskey and Ink"];
  final List<String> containerLists = ["Rich Elegance", "Smoky Intensity", "Nomadic Blend", "Regal Harmony", "Bold Fusion", "Majestic Spirit"];
  final List<String> priceLists = ["2399", "3599", "2899", "3969", "4999", "5999"];
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
                "Alcohol",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: "Afacad",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Explore an exquisite collection of premium spirits and discover the artistry of fine craftsmanship on our alcohol website",
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
                          vertical: 25,
                          horizontal: 20,
                        ),
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
                                "assets/a_page_images/${imageIndices[index]}.png",
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
                                          isFavoriteList[index] = !isFavoriteList[index];
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