import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/my_form_story.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class StoryShow extends StatefulWidget {
  const StoryShow({Key? key}) : super(key: key);

  @override
  _StoryShowState createState() => _StoryShowState();
}

class _StoryShowState extends State<StoryShow> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                "I wish you all happiness every day.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade200,
              expandedHeight: 280,
              floating: false,
              pinned: true,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.vertical_align_center_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  videoBarStory(), //ชุดแสดง VIdeo แทบบน
                  FlexibleSpaceBar(
                    title: bottonSoppingAuction(context),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: false,
              child: Center(
                child: Column(
                  children: [
                    barStar(), //บาไสลเลื่อนซ้ายขวาอยู่แทบบน (โชโปรไฟ ดาวเกษตร)
                    const Expanded(
                        child:
                            MyFormStory()), //เนื้อหาส่วนกลางแสดงผลการโพสสตอรี่
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //บาแทบล่าง
      bottomNavigationBar: const BuilNaviBer(),
      floatingActionButton: Column(
        children: [
          Expanded(
            child: FabCircularMenu(
              fabCloseColor: Colors.green.shade300,
              fabOpenColor: Colors.greenAccent,
              fabElevation: 5.0,
              fabSize: 40,
              ringColor: Colors.greenAccent.shade100,
              ringWidth: 40,
              children: [
                const Icon(Icons.tour_outlined,
                    size: 15, color: Colors.black45),
                const Icon(Icons.tour_rounded, size: 20, color: Colors.black54),
                const Icon(Icons.tour_outlined,
                    size: 25, color: Colors.black87),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/OpenAdvertisement"),
                    icon: Icon(Icons.tv_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/chatscreen"),
                    icon: Icon(Icons.question_answer_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, "/order1"),
                    icon: Icon(Icons.receipt_long_outlined,
                        color: MyStyle().telColor01, size: 30)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/RoomProfileStory"),
                    icon: Icon(Icons.tag_faces_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  //ปุ่มกดไปยังหน้าเลือกซื้อสินค้าและประมูล
  SizedBox bottonSoppingAuction(BuildContext context) {
    return SizedBox(
      width: screen * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/shopping"),
                child: SizedBox(
                  width: screen * 0.18,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 13,
                        width: screen * 0.14,
                        child: Center(
                          child: MyStyle().fonWhite10("ร้านค้า"),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.store_mall_directory_outlined,
                        size: 13,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/auction"),
                child: SizedBox(
                  width: screen * 0.18,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 13,
                        width: screen * 0.14,
                        child: Center(
                          child: MyStyle().fonWhite10("ประมูล"),
                        ),
                        decoration: BoxDecoration(
                          color: MyStyle().telColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.gavel_outlined,
                        size: 13,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ชุดแสดง VIdeo แทบบน
  Widget videoBarStory() {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 4),
          reverse: true,
          autoPlay: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: 0.98,
        ),
        items: [
          ClipPath(
            clipper: MyCustomClipperForAppBer(),
            child: Container(
              width: double.infinity,
              height: 300,
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
                  aspectRatio: 4 / 2,
                  autoInitialize: true,
                  looping: true,
                  autoPlay: true,
                  fullScreenByDefault: false,
                  videoPlayerController:
                      VideoPlayerController.asset("lib/video/intorlkaset3.mp4"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //บาไสลเลื่อนซ้ายขวาอยู่แทบบน (โชโปรไฟ ดาวเกษตร)
  Widget barStar() {
    return CarouselSlider(
      options: CarouselOptions(
        height: screen * 0.2,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        viewportFraction: 0.4,
      ),
      items: [
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar2.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar3.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar4.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar5.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar6.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar7.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar8.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar9.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar10.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
