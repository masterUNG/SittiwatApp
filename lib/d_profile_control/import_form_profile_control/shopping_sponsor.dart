import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ShoppingSponsor extends StatefulWidget {
  const ShoppingSponsor({Key? key}) : super(key: key);

  @override
  _ShoppingSponsorState createState() => _ShoppingSponsorState();
}

class _ShoppingSponsorState extends State<ShoppingSponsor> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return CarouselSlider(
      options: CarouselOptions(
        height: 120,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        viewportFraction: 0.7,
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
              width: screen * 0.8,
              height: screen * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyStyle().fonWhite12("ลงโฆษณา VIDEO"),
                  MyStyle().fonWhite15("ราคาพิเศษช่วงเปิดตัวแอพ"),
                  SizedBox(
                    width: screen * 0.1,
                    child: MyStyle().showLogo(),
                  ),
                  Container(
                    height: 30,
                    width: screen*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      child: MyStyle().fonBack12("ดูเงื่อนไข"),
                      onPressed: () {},
                    ),
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
              width: screen * 0.8,
              height: screen * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar2.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyStyle().fonWhite12("ลงโฆษณา VIDEO"),
                  MyStyle().fonWhite15("ราคาพิเศษช่วงเปิดตัวแอพ"),
                  SizedBox(
                    width: screen * 0.1,
                    child: MyStyle().showLogo(),
                  ),
                  Container(
                    height: 30,
                    width: screen*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      child: MyStyle().fonBack12("ดูเงื่อนไข"),
                      onPressed: () {},
                    ),
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
              width: screen * 0.8,
              height: screen * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar3.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyStyle().fonWhite12("ลงโฆษณา VIDEO"),
                  MyStyle().fonWhite15("ราคาพิเศษช่วงเปิดตัวแอพ"),
                  SizedBox(
                    width: screen * 0.1,
                    child: MyStyle().showLogo(),
                  ),
                  Container(
                    height: 30,
                    width: screen*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      child: MyStyle().fonBack12("ดูเงื่อนไข"),
                      onPressed: () {},
                    ),
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
