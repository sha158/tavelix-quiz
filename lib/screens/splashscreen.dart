import 'package:flutter/material.dart';
import 'package:myquiz/screens/main_screen.dart';
import 'package:myquiz/svg/utils.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.8),
      body: Center(
        child: Image.asset("assets/images/logo1.png",height: 500,width: 500,),
      ),
    );
  }
}
