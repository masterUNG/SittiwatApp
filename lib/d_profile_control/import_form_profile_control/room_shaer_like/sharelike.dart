

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sittiwat_app/model/my_style.dart';

class PosSoppingShareLike extends StatefulWidget {
  const PosSoppingShareLike({Key? key}) : super(key: key);

  @override
  _PosSoppingShareLikeState createState() => _PosSoppingShareLikeState();
}

class _PosSoppingShareLikeState extends State<PosSoppingShareLike> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: SafeArea(
        child: Stack(
          children: [
             Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar1.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 30),
                SizedBox(width: 200, child: MyStyle().showLogo()),
                const SizedBox(height: 20),
                MyStyle().fonWhite20("ส่งลิ้งแอพดีๆให้เพื่อนๆ"),
                MyStyle().fonWhite20("ส่งแอพ THAI KASET HEY กันดีกว่า"),
                const SizedBox(height: 10),
                Center(
                  child: IconButton(
                    onPressed: () {
                      // เมื่อทำแอพเสร็จแล้วให้เปลียนลิ้งอันนี้เป็นลิ้งของแอพ  #######################################
                      //Share.share("https://play.google.com/store/apps/details?id=com.instivetech.testapp");
                      Share.share("http://schemas.android.com/apk/res/android");
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 50,
                      color: Colors.purple,
                    ),
                  ),
                  
                ),
                const SizedBox(height: 15),
                MyStyle().fonyellouu15("ส่งลิ้งแอพให้เพื่อน 10 ท่าน แล้วรอรับรหัสเปิดใช้งาน"),
                MyStyle().fonyellouu15("นาน 30 วัน"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
