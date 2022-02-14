import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';


class BuilIconHorizontal extends StatefulWidget {
  const BuilIconHorizontal({Key? key}) : super(key: key);

  @override
  _BuilIconHorizontalState createState() => _BuilIconHorizontalState();
}

class _BuilIconHorizontalState extends State<BuilIconHorizontal> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return

     CarouselSlider(
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
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สวนผลไม้")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สวนผัก")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("อาหาร")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("ปสุสัตว์")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สัตว์เลี้ยง")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("ต้นกล้าไม้")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สินค้าชุมชน")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("งานแฮนเมค")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child:
                        Center(child: MyStyle().fonWhite12("เครื่องมือเกษตร")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("พระเครื่อง")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("แฟชั่น")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("บ้าน-ที่ดิน")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child:
                        Center(child: MyStyle().fonWhite12("สินค้ามือสอง")),//เปลียนเป็นอย่างอื่น
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("เฟอร์นิเจอร์")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สินค้าทั่วไป")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: 130,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 23,
                    width: 100,
                    child: Center(child: MyStyle().fonWhite12("สินค้าในพื้นที่")),
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.person_search_sharp,
                    size: 20,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      
      
      ],
    );
  
  }
}
