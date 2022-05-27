import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquiz/screens/quizpage.dart';

import '../svg/utils.dart';
import '../widgets/containerwidget.dart';

class FirstPage extends StatelessWidget {
  final int index;
  FirstPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 42,
                    height: 36,
                    child: ContainerWidget(
                      iconData: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close_sharp,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.white.withOpacity(0.5),
                    )),
              ],
            ),
          )),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/image2.png"),
            Text(
              "level 1",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              "Travel newbie",
              style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Do you feel confident?questions here are basic ",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(QuizPage(quizIndex: index),
                    transition: Transition.fadeIn,
                    duration: Duration(milliseconds: 800));
              },
              child: Text(
                "Game",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.secondPageContainerGradient1stColor),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  minimumSize: Size(double.infinity, 60),
                  primary: Colors.white),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 25, right: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.pink],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ),
    );
  }
}
