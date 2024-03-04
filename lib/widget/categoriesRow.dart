import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Explore Categories",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
