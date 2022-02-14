import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class TechnivApp extends StatefulWidget {
  const TechnivApp({Key? key}) : super(key: key);

  @override
  _TechnivAppState createState() => _TechnivAppState();
}

class _TechnivAppState extends State<TechnivApp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Colors.lightBlue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          MyStyle().fonBack15("แนะนะการใช้แอพ Thai Kaset Hey"),
          Container(
              width: double.infinity,
              height: 270,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Chewie(
                controller: ChewieController(
                  
                  aspectRatio: 3 / 2,
                  autoInitialize: true,
                  looping: false,
                  autoPlay: false,
                  fullScreenByDefault: false,
                  videoPlayerController:
                      VideoPlayerController.asset("lib/video/opensponsor1.mp4"),
                ),
              ),
            ),
          TextButton.icon(
            label:MyStyle().fonBack12("แบ่งปันแอพแชร์ให้เพื่อนๆ"), 
            onPressed: () {
              // เมื่อทำแอพเสร็จแล้วให้เปลียนลิ้งอันนี้เป็นลิ้งของแอพ  #######################################
              //Share.share("https://play.google.com/store/apps/details?id=com.instivetech.testapp");
              Share.share("http://schemas.android.com/apk/res/android");
            },
            icon: const Icon(
              Icons.share,
              size: 20,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
