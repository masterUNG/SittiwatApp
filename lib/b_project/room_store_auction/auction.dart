import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/import_form_auction/my_form_auction.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/top_bar_slide_choice.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class Auction extends StatefulWidget {
  const Auction({Key? key}) : super(key: key);

  @override
  _AuctionState createState() => _AuctionState();
}

class _AuctionState extends State<Auction> {
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
                    title:
                        iconRouter(), //บาแทบบน (สำหรับห้อง story ,  shopping)
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: false,
              child: Column(
                children: const [
                  //บาไสลเลื่อนซ้ายขวาอยู่แทบบน
                  SizedBox(
                      height: 40, child: Expanded(child: BuilIconHorizontal())),
                  //เนื้อหาส่วนกลางแสดงผลการโพสขายประมูลสินค้า
                  Expanded(child: MyFormAuction()),
                ],
              ),
            ),
          ],
        ),
      ),
      //บาแทบล่าง
      bottomNavigationBar: const BuilNaviBer(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Card(
            elevation: 3,
            shadowColor: Colors.black,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.gavel_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                label: MyStyle().fonBack15("ห้องประมูลส่วนตัว"),
                onPressed: () => Navigator.pushNamed(context, "/StoerAuction"),
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
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
          autoPlayAnimationDuration: const Duration(microseconds: 10000),
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
                  //allowFullScreen: true,
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

  //บาแทบบน (สำหรับห้อง story ,  auction)
  Widget iconRouter() {
    return SizedBox(
      height: 40,
      width: screen * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
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
                onTap: () => Navigator.pushNamed(context, "/story"),
                child: SizedBox(
                  width: screen * 0.18,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 13,
                        width: screen * 0.14,
                        child: Center(
                          child: MyStyle().fonWhite10("สตอรี่"),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.sentiment_very_satisfied_outlined,
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

            
          ],
        ),
      ),
    );
  }
}
