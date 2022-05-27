import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../svg/utils.dart';

class Answer extends StatelessWidget {
  final String stringtext;
  final Color answerColor;
  final Function answerselect;
  final Color textColor;
  Answer(
      {required this.stringtext,
      required this.answerColor,
      required this.answerselect,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: (() {
            answerselect();
          }),
          child: Text(
            stringtext,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              minimumSize: Size(double.infinity, 60),
              primary: answerColor),
        ),
        SizedBox(
          height: 18,
        )
      ],
    );
  }
}
