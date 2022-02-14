import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class TranSport extends StatefulWidget {
  const TranSport({Key? key}) : super(key: key);

  @override
  _TranSportState createState() => _TranSportState();
}

class _TranSportState extends State<TranSport> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return CarouselSlider(
      options: CarouselOptions(
        height: 280,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        viewportFraction: 0.7,
      ),
      items: [


        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellow.shade200,
                          Colors.lime.shade600,
                          Colors.lime.shade600,
                          Colors.lime.shade600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: screen * 0.7,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyStyle().fonBack12(" Transport"),
                        const Icon(
                          Icons.two_wheeler,
                          color: Colors.black,
                          size: 50,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.museum_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("ร้านค้าใกล้คุณ"),
                        ),
                        MyStyle().fonBack15("เข้าร่วม รับส่งสินค้าใกล้บ้าน"),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    color: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: screen * 0.6,
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.greenAccent,
                            Colors.tealAccent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.two_wheeler,
                          color: Colors.black,
                          size: 25,
                        ),
                        label: MyStyle().fonBack15("Fast ในคุ้ม  กดสมัคร"),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    color: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: screen * 0.6,
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.greenAccent,
                            Colors.tealAccent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton.icon(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/ShowLocationMap"),
                        icon: const Icon(
                          Icons.museum_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                        label: MyStyle().fonBack15(" เรียกรถใกล้ตัว"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade100,
                          Colors.blueAccent.shade100,
                          Colors.blue.shade600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: screen * 0.7,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: MyStyle().fonBack12(" Transport car")),
                        const Icon(
                          Icons.local_shipping_outlined,
                          size: 50,
                        ),
                        Center(
                          child: MyStyle()
                              .fonBack15("นำรถของท่านเข้าร่วมรถขนส่งกับเรา"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: screen * 0.6,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.tealAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("Fast Car  กดสมัคร"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.pink.shade50,
                          Colors.pink.shade100,
                          Colors.pinkAccent.shade100,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: screen * 0.7,
                    height: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 60, child: MyStyle().showLogo()),
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 27,
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, "/openprofilestory"),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Expanded(child: ProfileNameGmail()),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: screen * 0.6,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.tealAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.local_shipping_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("Fast Car  กดสมัคร"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.shade50,
                          Colors.greenAccent.shade700,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: screen * 0.7,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyStyle().fonBack15("Thai Kaset Hey "),
                        const Icon(
                          Icons.settings, //หารูปจับมือมาแสดงแทน
                          size: 30, color: Colors.black54,
                        ),
                        MyStyle().fonBack15("ไอเดียธุระกิจฉัน"),
                        const SizedBox(height: 10),
                        MyStyle().fonBack12("เสริมสร้างธุระกิจในท้องถิ่น"),
                        MyStyle().fonBack12("ไอเดียคุณทุนของเรา"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: screen * 0.6,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.tealAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.black54,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("กดสมัคร"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple.shade50,
                          Colors.purple.shade600,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: screen * 0.7,
                    height: 170,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 60, child: MyStyle().showLogo()),
                        Container(
                          color: Colors.black12,
                          height: 35,
                          child: Row(
                            children: [
                              TextButton.icon(
                                  label: MyStyle().fonBack12("แผนที่ตั้ง"),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.zoom_out_map_rounded,
                                    color: Colors.black,
                                    size: 25,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: screen * 0.6,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.tealAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/ShowLocationMap"),
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("Fast Car  กดสมัคร"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screen * 0.7,
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            color: Colors.brown.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade300,
                            Colors.blueGrey.shade900,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      width: screen * 0.7,
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.savings_outlined,
                            color: Colors.white54,
                            size: 60,
                          ),
                          MyStyle().fonWhite15("ชาปณะกิจเงินฝากสะสม"),
                          const SizedBox(height: 10),
                          MyStyle().fonorange15("ออมร้อยได้ล้าน !"),
                        ],
                      )),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: screen * 0.6,
                        height: 35,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.greenAccent,
                              Colors.tealAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.savings,
                            color: Colors.black54,
                            size: 25,
                          ),
                          label: MyStyle().fonBack15("เข้าร่วม กดสมัคร"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      
      
      
      ],
    );
 
 
 
 
  }
}
