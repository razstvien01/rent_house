import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/constant.dart';
import 'package:rent_house/models/item_model.dart';
import 'package:rent_house/screens/home/components/details_screen.dart';
import 'package:rent_house/ud_widgets/clear_full_button.dart';
import 'package:rent_house/ud_widgets/house_card.dart';

class SuggestionList extends StatefulWidget {
  String? title;
  List<Item> items;

  SuggestionList(this.title, this.items, {super.key});

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  Widget getPropertiesInfo(context, snapshot) {
    if (snapshot.hasData) {
      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

      //print(data);
      
      widget.items = [];
      
      int i = 0;
      for (var k in data.keys) {
        print(++i);
        print(k);

        // for (var v in data.values) {
        //   print(v['price']);

        //   widget.items.add(Item(
        //     v['title'],
        //     v['type'],
        //     v['location'],
        //     v['price'],
        //     v['imageUrl'],
        //     v['description'],
        //     //userData['fullname'],
        //     v['uid'],
        //     k,
        //   ));
        // }
        
        print(data[k]['title']);
        
          widget.items.add(Item(
            data[k]['title'],
            data[k]['type'],
            data[k]['location'],
            data[k]['price'],
            data[k]['imageUrl'],
            data[k]['description'],
            //userData['fullname'],
            data[k]['uid'],
            k,
          ));
      }
      
      print(widget.items.length);

      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title!,
                  // style: TextStyle(
                  //   fontSize: 16,
                  //   color: kLightColor,
                  // ),
                  style: kSubTextStyle,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 12.0),

            Container(
              height: 340.0,
              width: double.infinity,
              
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                //itemCount: data.keys.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    widget.items[index],
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsSreen(widget.items[index])),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot?>(
      future: FirebaseFirestore.instance
          .collection('properties')
          .doc(theCurrLoc)
          .get(),
      builder: getPropertiesInfo,
    );
  }
}
