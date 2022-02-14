import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/my_form_shopping.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/top_bar_slide_choice.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
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
                children:  [
                 videoBarStory(), //ชุดแสดง VIdeo แทบบน
                   FlexibleSpaceBar(
                    title: iconRouter(),//บาแทบบน (สำหรับห้อง story ,  auction)
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
                  //เนื้อหาส่วนกลาง การแสดงผลโพสขายสินค้าทั่วไป
                  Expanded(child: MyFormShopping()),
                ],
              ),
            ),

            
          ],
        ),
      ),
      //บาแทบล่าง
      bottomNavigationBar: const BuilNaviBer(),
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
    return 
        SizedBox(
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


}
