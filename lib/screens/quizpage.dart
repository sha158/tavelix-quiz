import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquiz/screens/Answer.dart';
import 'package:myquiz/screens/main_screen.dart';
import 'package:myquiz/widgets/containerwidget.dart';

import '../svg/utils.dart';

class QuizPage extends StatefulWidget {
  final int quizIndex;
  QuizPage({required this.quizIndex});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool beforeSelect = true;
  int totalscore = 0;
  int questionIndex = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool changeColor = true;
  bool selectedAnswer = false;
  void whenAnswerSelected(bool checkAnswer) {
    setState(() {
      answerWasSelected = true;
    });
    if (checkAnswer) {
      setState(() {
        selectedAnswer = true;
        beforeSelect = false;
        changeColor = true;
        totalscore++;
      });
    }
    if (!checkAnswer) {
      setState(() {
        beforeSelect = false;
        changeColor = false;
      });
    }
    if (questionIndex + 1 == varyThem.length) {
      setState(() {
        endOfQuiz = true;
        // questionIndex = 0;
        // beforeSelect = true;
        // answerWasSelected = false;
        // changeColor = true;
      });
    }
  }

  void changeIndex() {
    setState(() {
      questionIndex++;
      beforeSelect = true;
      changeColor = true;
      answerWasSelected = false;
    });
    if (questionIndex >= varyThem.length) {
      resetQuiz();
    }
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      endOfQuiz = false;
      totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: widget.quizIndex == 0
              ? Colors.pink
              : widget.quizIndex == 1
                  ? Colors.blueAccent
                  : Colors.deepPurpleAccent.withOpacity(0.8),
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
                          Get.off(MainScreen());
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
            Center(
              child: Container(
                  // padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  height: 100,
                  width: 150,
                  // color: Colors.amber,
                  child: Image.asset(
                    varyThem[questionIndex]['imagepath'] as String,
                    alignment: Alignment.center,
                    height: 300,
                    width: 250,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "question ${varyThem[questionIndex]['questionnumber']} of 3",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.quizIndex == 0
                  ? varyThem1[questionIndex]['question'] as String
                  : widget.quizIndex == 1
                      ? varyThem[questionIndex]['question'] as String
                      : widget.quizIndex == 2
                          ? varyThem2[questionIndex]['question'] as String
                          : "",
              style: GoogleFonts.poppins(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),

            ...(widget.quizIndex == 0
                    ? varyThem1[questionIndex]['Answers']
                        as List<Map<String, dynamic>>
                    : widget.quizIndex == 1
                        ? varyThem[questionIndex]['Answers']
                            as List<Map<String, dynamic>>
                        : varyThem2[questionIndex]['Answers']
                            as List<Map<String, dynamic>>)
                .map((answer) => Answer(
                      answerColor: beforeSelect
                          ? Colors.white
                          : answer['score'] as bool
                              ? Color.fromARGB(255, 146, 186, 14)
                              : Colors.black,
                      stringtext: answer['answertext'] as String,
                      answerselect: () {
                        // if (answerWasSelected) {
                        //   return;
                        // }
                        whenAnswerSelected(answer['score'] as bool);
                      },
                      textColor: answerWasSelected == false
                          ? Colors.black
                          : changeColor
                              ? Colors.white
                              : Colors.white,
                    )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (!answerWasSelected) {
                  Get.snackbar(
                      "Select Answer", "If you want to go to next question",
                      backgroundColor: Colors.white);
                  return;
                }
                changeIndex();
              },
              child: Text(
                endOfQuiz ? "Restart Quiz" : "Next question",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  minimumSize: Size(double.infinity, 60),
                  primary: Colors.blueGrey.shade900),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Text(
                'Total Score: ${totalscore.toString()}/${varyThem.length}',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),

            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Frankfurt",
            //     style: GoogleFonts.poppins(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: AppColor.secondPageContainerGradient1stColor),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18)),
            //       minimumSize: Size(double.infinity, 60),
            //       primary: Colors.white),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Hamburg",
            //     style: GoogleFonts.poppins(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18)),
            //       minimumSize: Size(double.infinity, 60),
            //       primary: Color(0xff9ACD32)),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Munich",
            //     style: GoogleFonts.poppins(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: AppColor.secondPageContainerGradient1stColor),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18)),
            //       minimumSize: Size(double.infinity, 60),
            //       primary: Colors.white),
            // )
          ],
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 25, right: 20),
        color: widget.quizIndex == 0
            ? Colors.pink
            : widget.quizIndex == 1
                ? Colors.blueAccent
                : Colors.deepPurpleAccent.withOpacity(0.8),
      ),
    );
  }

  List<Map<String, dynamic>> varyThem = [
    {
      'questionnumber': 1,
      'imagepath': 'assets/images/image1.png',
      'question':
          'Which Indian hill station in India is known as the “Queen of the Hills”?',
      'Answers': [
        {'answertext': 'Darjeeling', 'score': false, 'textcolor': Colors.black},
        {'answertext': 'Mussoorie', 'score': true},
        {
          'answertext': 'Shillong',
          'score': false,
          'textcolor': Colors.black,
          'textcolor': Colors.white
        },
      ]
    },
    {
      'questionnumber': 2,
      'imagepath': 'assets/images/image1.png',
      'question':
          'Which is the tallest Himalayan mountain in the Indian territory?',
      'Answers': [
        {
          'answertext': 'Mount Everest',
          'score': false,
          'textcolor': Colors.black
        },
        {
          'answertext': 'Mount Godwin ',
          'score': false,
          'textcolor': Colors.black
        },
        {
          'answertext': 'KanchenGunga',
          'score': true,
          'textcolor': Colors.white
        },
      ]
    },
    {
      'questionnumber': 3,
      'imagepath': 'assets/images/image1.png',
      'question': 'In which city of the german is the largest port ?',
      'Answers': [
        {'answertext': 'Frankfurtt', 'score': false, 'textcolor': Colors.black},
        {'answertext': 'Hamburg ', 'score': true, 'textcolor': Colors.white},
        {'answertext': 'Munich', 'score': false, 'textcolor': Colors.black},
      ]
    }
  ];
}

List<Map<String, dynamic>> varyThem1 = [
  {
    'questionnumber': 1,
    'imagepath': 'assets/images/image1.png',
    'question': 'Which is the smallest city in the world?',
    'Answers': [
      {'answertext': 'Vatican city', 'score': true, 'textcolor': Colors.white},
      {'answertext': 'Delhi', 'score': false},
      {
        'answertext': 'johannesburg',
        'score': false,
        'textcolor': Colors.black,
      },
    ]
  },
  {
    'questionnumber': 2,
    'imagepath': 'assets/images/image1.png',
    'question': 'Which is the longest river in the world ?',
    'Answers': [
      {'answertext': 'Nile river', 'score': true, 'textcolor': Colors.white},
      {'answertext': 'Amazon river', 'score': false, 'textcolor': Colors.black},
      {'answertext': 'Kanchenu', 'score': false, 'textcolor': Colors.black},
    ]
  },
  {
    'questionnumber': 3,
    'imagepath': 'assets/images/image1.png',
    'question': 'which is the largest beach in the world ?',
    'Answers': [
      {'answertext': 'Goa beach', 'score': false, 'textcolor': Colors.black},
      {
        'answertext': 'Coxs Bazar Beach',
        'score': true,
        'textcolor': Colors.white
      },
      {'answertext': 'Marina beach', 'score': false, 'textcolor': Colors.black},
    ]
  }
];

List<Map<String, dynamic>> varyThem2 = [
  {
    'questionnumber': 1,
    'imagepath': 'assets/images/image1.png',
    'question':
        'What is the line of latitude 23.5° north of the Equator more commonly known as?',
    'Answers': [
      {
        'answertext': 'Tropic of cancer',
        'score': true,
        'textcolor': Colors.white
      },
      {'answertext': 'The Equator', 'score': false},
      {
        'answertext': 'Antartic circle',
        'score': false,
        'textcolor': Colors.black,
      },
    ]
  },
  {
    'questionnumber': 2,
    'imagepath': 'assets/images/image1.png',
    'question': 'Which European capital was built on 14 islands??',
    'Answers': [
      {'answertext': 'Stockholm', 'score': true, 'textcolor': Colors.white},
      {'answertext': 'Madrid', 'score': false, 'textcolor': Colors.black},
      {'answertext': 'London', 'score': false, 'textcolor': Colors.black},
    ]
  },
  {
    'questionnumber': 3,
    'imagepath': 'assets/images/image1.png',
    'question': 'In which country would you find the currency ‘baht’? ?',
    'Answers': [
      {'answertext': 'Bangladesh', 'score': false, 'textcolor': Colors.black},
      {'answertext': 'Thailand', 'score': true, 'textcolor': Colors.white},
      {'answertext': 'Qatar', 'score': false, 'textcolor': Colors.black},
    ]
  }
];
