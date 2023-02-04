import 'package:flutter/material.dart';
import 'package:rent_house/constant.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  Widget categoryButton(IconData icon, String? text) {
    return Container(
      margin: EdgeInsets.all(18.0),
      width: 80.0,
      height: 80.0,
      // decoration: BoxDecoration(
      //   border: Border.all(color: kAccentColor),
      // ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: kPrimaryColor),
            Text(
              "$text",
              style: TextStyle(
                fontSize: 14,
                color: kLightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryButton(Icons.house_rounded, "House"),
          categoryButton(Icons.villa_rounded, "Villa"),
          categoryButton(Icons.apartment_rounded, "Apartment"),
          categoryButton(Icons.castle_rounded, "Castles"),
        ],
      ),
    );
  }
}