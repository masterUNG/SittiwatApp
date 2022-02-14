// //หน้าต่างนโยบาย Kaset Hey
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              aspectRatio: 2 / 4.5,
              autoInitialize: true,
              looping: true,
              autoPlay: true,
              fullScreenByDefault: false,
              videoPlayerController:
                  VideoPlayerController.asset("lib/video/intorlkaset2.mp4"),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            color: Colors.white10,
            width: 400,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 70,
                      child: MyStyle().showLogo(),
                    ),
                    const SizedBox(height: 10),
                    MyStyle().fonBack20("THAI KASET HEY"),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/myhomekasethey"),
                        leading: const Icon(
                          Icons.home,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("Home Thai Kaset Hey"),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/myentermanagekaset"),
                        leading: const Icon(
                          Icons.manage_accounts_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("เข้าร่วมบริหาร KASET HEY"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, "/mygetads"),
                        leading: const Icon(
                          Icons.monetization_on_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("รับโฆษณาในสตอรี่"),
                      ),
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, "/mystorykaset"),
                        leading: const Icon(
                          Icons.receipt_long_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("กติกาใช้ห้องต่างๆ"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, "/persnal"),
                        leading: const Icon(
                          Icons.home,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("นโยบายหลัก Kaset Hey"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, "/login"),
                        leading: const Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("ออกจากระบบ"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(
                            context, "/ControlBackinKasetHy"),
                        leading: const Icon(
                          Icons.home_work_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: MyStyle().fonBack15("เข้าระบบหลังบ้าน"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
