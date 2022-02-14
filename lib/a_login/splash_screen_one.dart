import 'dart:async';


import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/storyshow.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {

  @override
  void initState() {
    
    super.initState();
    Timer(const Duration(seconds: 5),()=>Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>const StoryShow())));

  }

  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffff800B),
              Color(0xffCE1010),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: screen*0.6, child: MyStyle().showLogo()),
            const SizedBox(
              height: 20
            ),
            MyStyle().fonWhite25("Welcome to Thai Kaset key"),
            MyStyle().fonWhite15("ยินดีต้อนรับสู่ชุมชนคน ไทยเกษตรเฮ"),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

