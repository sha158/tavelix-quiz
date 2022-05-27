import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/listview_model.dart';

class NewStack extends StatelessWidget {
    final ItemsModel itemsModel;
  const NewStack({required this.itemsModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                     borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  colors: itemsModel.colors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(
                  height: 38,
                  width: 42,
                  child:const Center(child: Icon(Icons.lock,color: Colors.white,)),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  itemsModel.subtitle,
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                Text(
                  itemsModel.title,
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),

                      ],

                    ),
                  ),
                ),
                Positioned(
                  top: -60,
                  right: -10,
                  child: itemsModel.image)
              ],
            );
  }
}