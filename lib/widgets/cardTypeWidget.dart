// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myquiz/Models/listview_model.dart';
// import 'package:myquiz/svg/utils.dart';

// class CardTypeWidget extends StatelessWidget {
//   final ItemsModel itemsModel;
//   CardTypeWidget({
//     required this.itemsModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 190,
//       child: Stack(
//         overflow: Overflow.visible,
//         // children: [
//           //  Positioned(height: 200,width: 200,
//           //   // bottom: 160,
//           //   right: 25,
//           //   top: -80,
//           //   child: Container(height: 200,width: 100,decoration: BoxDecoration( image: DecorationImage(image: itemsModel.image)),),),
         
// //           Container(
// //             child: Padding(
// //               padding: const EdgeInsets.only(left: 25, top: 25),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container(
// //                     height: 38,
// //                     width: 42,
// //                     child: Center(child: Icon(itemsModel.icon,color: Colors.white,)),
// //                     decoration: BoxDecoration(
// //                       border: Border.all(
// //                           color: Colors.white, width: 1),
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   const SizedBox(
// //                     height: 15,
// //                   ),
// //                   Text(
// //                     itemsModel.subtitle,
// //                     style: GoogleFonts.poppins(
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.w400,
// //                         color: Colors.white),
// //                   ),
// //                   Text(
// //                     itemsModel.title,
// //                     style: GoogleFonts.poppins(
// //                         fontSize: 28,
// //                         fontWeight: FontWeight.w500,
// //                         color: Colors.white),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             height: 170,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(25),
// //               gradient: LinearGradient(
// //                   colors: itemsModel.colors,
// //                   begin: Alignment.centerLeft,
// //                   end: Alignment.centerRight),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
