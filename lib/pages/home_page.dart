import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/helper/pizza_page.dart';
import 'package:food_app/widget/categoriesColumn.dart';
import 'package:food_app/widget/categoriesRow.dart';
import '../widget/categoriesRow1.dart';
import '../widget/drawer.dart';
import '../widget/showpizzapage.dart';

class homePage extends StatelessWidget {

  final String username;
  homePage({required this.username});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(hexColor('#fffcf2')),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                    width: 35,
                    child: Image.asset("assets/mi (1).png")),
              ),
            ],
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(left: 160),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              labelText: 'location',
              hintText: 'location...',
              suffixIcon: Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(90), right: Radius.circular(90))
              )
            ),
          ),
        ),
      ),
    drawer: MyDrawer(username: username),
        backgroundColor: Color(hexColor('#fffcf2')),
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning!",
            style: TextStyle(
              fontSize: 20
            ),
            ),
            SizedBox(
              height: 0
            ),
            Text("Grab your",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
            ),
            ),
            SizedBox(
              height: 0,
            ),
            Text("delicious meal!",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                fontFamily: "Afacad"
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Restaurents, Foods',
                    hintText: 'Restaurents, Foods...',
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    prefixIcon: Icon(CupertinoIcons.search),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(90), right: Radius.circular(90))
                    )
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CategoriesRow(),
            CategoriesColumn(),
            CategoriesRow1(),
            SizedBox(
              height: 10,
            ),
            ShowPizzaPage()
          ],
        ),
      ),
    );

  }}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}
