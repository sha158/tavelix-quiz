import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquiz/Models/listview_model.dart';
import 'package:myquiz/screens/ThirdPage.dart';
import 'package:myquiz/screens/firstpage.dart';
import 'package:myquiz/screens/second_page.dart';
import 'package:myquiz/widgets/cardTypeWidget.dart';
import 'package:myquiz/widgets/newstack.dart';

import '../widgets/containerwidget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<Color>> dynamiclist = [
      [Colors.pink.shade300, Colors.deepOrange.withOpacity(0.7)],
      [
        Colors.blue.shade700,
        Colors.blue.shade500.withOpacity(0.8),
        Colors.blue.shade500.withOpacity(0.8)
      ],
      [
        Colors.deepPurpleAccent.withOpacity(0.8),
        Colors.deepPurple.shade200.withOpacity(0.7)
      ]
    ];
    final String userSvg = 'assets/svg/user.svg';
    final Widget svgUser = SvgPicture.asset(userSvg,
        color: Colors.blue.shade300, semanticsLabel: 'A red up arrow');
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            ContainerWidget(
                color: Colors.blueGrey.withOpacity(0.2),
                iconData: Icon(
                  Icons.favorite,
                  color: Colors.blue.shade300,
                )),
            const SizedBox(
              width: 15,
            ),
            ContainerWidget(
              iconData: svgUser,
              color: Colors.blueGrey.withOpacity(0.2),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's Play",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.pink.shade400),
              ),
              Text(
                "Be the first!",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),

              Expanded(
                child: ListView.separated(
                    clipBehavior: Clip.none,
                    itemBuilder: (context, int) => GestureDetector(
                        onTap: () {
                          if (int == 0) {
                            Get.to(FirstPage(index: int),transition: Transition.fade,
                              duration: Duration(milliseconds: 800),);
                          } else if (int == 1) {
                            Get.to(
                              Second(
                                index: int,
                              ),
                              transition: Transition.fade,
                              duration: Duration(milliseconds: 800),
                            );
                          } else if (int == 2) {
                            Get.to(ThirdPage(
                              index: int,
                            ),
                            transition: Transition.fade,
                              duration: Duration(milliseconds: 800),
                              );
                          }
                        },
                        child: NewStack(itemsModel: ItemsModel.items[int])),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 60,
                        ),
                    itemCount: ItemsModel.items.length),
              )

              // Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     Container(
              //       height: 200,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         color: Colors.amber,
              //         borderRadius: BorderRadius.circular(22),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 30,top: 25),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text("data"),
              //             Text("data")

              //           ],

              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: -130,
              //       right: -30,
              //       child: Image.asset("assets/images/image2.png",width: 300,height: 240,))
              //   ],
              // ),

              // Expanded(
              //   child: ListView.separated(
              //       itemBuilder: (context, int) => CardTypeWidget(itemsModel: ItemsModel.items[int]),
              //       separatorBuilder: (context,index)=>const SizedBox(height: 30,),
              //       itemCount: ItemsModel.items.length),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
