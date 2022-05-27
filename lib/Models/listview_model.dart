import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsModel {
  final Image image;
  final List<Color> colors;
  final String title;
  final String subtitle;
  ItemsModel(
      {
        required this.image,
      required this.colors,
      required this.title,
      required this.subtitle,});

  static List<ItemsModel> items = [
    ItemsModel(image: Image.asset("assets/images/image1.png",width: 200,height: 130,),
        colors: [Colors.pink.shade300, Colors.deepOrange.withOpacity(0.7)],
        title: "Travel Newbie",
        subtitle: "level 1",
        ),
    ItemsModel(
      image: Image.asset("assets/images/image3.png",width: 190,height: 290,alignment: Alignment.topCenter),
      colors: [
      Colors.blue.shade700,
      Colors.blue.shade500.withOpacity(0.8),
      Colors.blue.shade500.withOpacity(0.8)
    ], title: "Intermediate", subtitle: "level 2", ),
    ItemsModel(
      image: Image.asset("assets/images/image2.png",width: 230,height: 240,),
      colors: [
      Colors.deepPurpleAccent.withOpacity(0.8),
      Colors.deepPurple.shade200.withOpacity(0.7)
    ], title: "Experienced", subtitle: "level 3", )
  ];
}
