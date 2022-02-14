import 'dart:io';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/open_adver.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onauction/member_onauction.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onshop/member_onshop.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_shaer_like/share_like_onshop.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/run_manage.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/shopping_sponsor.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/techniv_app.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/transport_on_map/transport.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/my_drawer.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:video_player/video_player.dart';

class ProfileControl extends StatefulWidget {
  const ProfileControl({Key? key}) : super(key: key);

  @override
  _ProfileControlState createState() => _ProfileControlState();
}

class _ProfileControlState extends State<ProfileControl> {
  final auth = FirebaseAuth.instance;
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      drawer: const Drawer(child: MyDrawer()), // //หน้าต่างนโยบาย Kaset Hey

      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.grey.shade200,
              expandedHeight: 280,
              floating: false,
              pinned: true,
              actions: <Widget>[
                bottonKaset(context), //ปุ่มแชทคุยปรึกษาแอพ
                const SizedBox(width: 80),
              ],
              flexibleSpace: Stack(
                children: [
                  videoBar(), //ชุดแสดง Video บาแทบด้านบน
                  FlexibleSpaceBar(
                      title: Text(
                    "Welcome to Thai Kaset Hey",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.normal),
                  ))
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Center(
                child: Column(
                  children: [
                    proFile(), //ส่วนโปรไฟ
                    bottonStory(), //ปุ่มโพสสตอรี่
                    showWelv(), //ส่วนโชยอด คนกดถูกใจ
                    const SizedBox(height: 3),
                    builCakPos(), //ยอดผู้ใช้แอพ / ปุ่มติดต่อโฆษณา / วัน-เวลา
                    const SizedBox(height: 3),
                    showIconOrder(context), //ส่วนปุ่มของแชทคุยลูกค้า-เช็คOrder
                    const SizedBox(height: 3),
                    const MemberOnShop(), //ส่วนของการเปิขายสินค้า
                    const SizedBox(height: 3),
                    const MemberOnAuction(), //ส่วนเปิดประมูลสินค้า
                    const SizedBox(height: 3),
                    const ShareLikeOnShop(), //ส่วนเปิดแชร์ขายฟรี45วัน
                    const SizedBox(height: 3),
                    const ShoppingSponsor(),//โซนประกาศชักชวนให้ลงโฆษณาในแอพ          
                    const SizedBox(height: 3),
                    const TechnivApp(),
                    const SizedBox(height: 3),
                    const OpenAdver(), //โซนบริหารการเปิดรับโฆษณา
                    const SizedBox(height: 3),
                    //const TranSport(), //บาไสลเลื่อนซ้ายขวาอัตโนมัติ (ไอเดียทำต่อในเฟสที่ 3 )####################
                    const SizedBox(height: 3),
                    const RunManage(), //โซนร่วมเบริหารแพรทฟร์อม
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BuilNaviBer(),
    );
  }

  //ปุ่มแชทคุยปรึกษาแอพ
  InkWell bottonKaset(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/ChatAdmin"),
      child: SizedBox(
        width: 190,
        child: Row(
          children: <Widget>[
            Container(
              height: 25,
              width: 160,
              child: Center(
                child: MyStyle().fonBack15("ปรึกษา Kaset Hey"),
              ),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  topLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(200.0),
                ),
              ),
            ),
            const Icon(
              Icons.question_answer_outlined,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  //ชุดแสดง Video บาแทบด้านบน
  ClipPath videoBar() {
    return ClipPath(
      clipper: MyCustomClipperForAppBer(),
      child: Container(
        width: double.infinity,
        height: 330,
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
            videoPlayerController: VideoPlayerController.asset("lib/video/intorlkaset3.mp4"),
          ),
          
        ),
      ),
    );
  }

  Card proFile() {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Card(
                elevation: 3,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(110)),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.black12,
                  backgroundImage:
                      _imageFile == null ? null : FileImage(_imageFile!),
                ),
              ),
              Positioned(
                bottom: 0.2,
                right: 0.2,
                child: Opacity(
                  opacity: 0,
                  child: IconButton(
                    iconSize: 18,
                    color: Colors.white38,
                    icon: const Icon(Icons.image),
                    onPressed: _takePicture,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: ProfileNameGmail()),
        ],
      ),
    );
  }

  //การประกาศตัวแปลทำวัน / เวลา
  var now = DateTime.now();
  //ยอดผู้ใช้แอพ / ปุ่มติดต่อโฆษณา / วัน-เวลา
  Widget builCakPos() {
    // ignore: prefer_typing_uninitialized_variables, unused_local_variable
    var formatter;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Card(
              elevation: 2,
              shadowColor: Colors.black,
              color: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Container(
                height: 25,
                width: screen * 0.5,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.black54, Colors.black12],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow.shade400,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.system_security_update,
                        size: 20,
                        color: Colors.white,
                      ),
                      const Icon(
                        Icons.keyboard_tab,
                        size: 20,
                        color: Colors.white,
                      ),
                      MyStyle().fonWhite15("data"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 5,
              color: Colors.black38,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/OpenAdvertisement"),
                child: SizedBox(
                  width: screen * 0.5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 25,
                        width: screen * 0.4,
                        child: Center(
                          child: MyStyle().fonWhite15("ติดต่อโฆษณา"),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade800,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.tv_outlined,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        //ตัวแสดงวัน / เวลา
        Card(
          elevation: 5,
          color: Colors.black12,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: screen * 0.45,
            decoration: BoxDecoration(
              color: MyStyle().telColor01,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: MyStyle()
                        .fonWhite15("${now.day}/${now.month}/${now.year}"),
                  ),
                  const Divider(color: Colors.white),
                  Center(
                    child: DigitalClock(
                      digitAnimationStyle: Curves.elasticInOut,
                      is24HourTimeFormat: false,
                      areaDecoration:
                          const BoxDecoration(color: Colors.transparent),
                      hourMinuteDigitTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      amPmDigitTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

  //ส่วนปุ่มของแชทคุยลูกค้า-เช็คOrder
  Widget showIconOrder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          elevation: 5,
          color: Colors.black38,
          shadowColor: MyStyle().telColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, "/chatscreen"),
            child: SizedBox(
              width: screen * 0.5,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 25,
                    width: screen * 0.4,
                    child: Center(
                      child: MyStyle().fonWhite15("แชทคุยลูกค้า"),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.question_answer_outlined,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          color: Colors.black38,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, "/order1"),
            child: SizedBox(
              width: screen * 0.4,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 25,
                    width: screen * 0.3,
                    child: Center(
                      child: MyStyle().fonWhite15("เช็ค Order"),
                    ),
                    decoration: BoxDecoration(
                      color: MyStyle().orangeColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        topLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.receipt_long_outlined,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  //ส่วนโชยอด คนกดถูกใจ
  Widget showWelv() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(
                Icons.sentiment_very_satisfied_outlined,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 5),
              MyStyle().fonBack15("|"),
              const SizedBox(width: 5),
              MyStyle().fonBack12("Data"),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 5),
              MyStyle().fonBack15("|"),
              const SizedBox(width: 5),
              MyStyle().fonBack12("Data"),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on_outlined,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 5),
              MyStyle().fonBack15("|"),
              const SizedBox(width: 5),
              MyStyle().fonBack12("Data"),
            ],
          ),
        ],
      ),
    );
  }

  //ปุ่มสร้างสตอรี่
  Widget bottonStory() {
    return Center(
      child: Card(
        elevation: 5,
        color: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, "/RoomProfileStory"),
          child: SizedBox(
            width: 190,
            child: Row(
              children: <Widget>[
                Container(
                  height: 25,
                  width: 160,
                  child: Center(
                    child: MyStyle().fonWhite15("สร้างโพสสตอรี่"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade400,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      topLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                ),
                const Icon(
                  Icons.sentiment_very_satisfied_outlined,
                  size: 20,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //ชุดทำรูปภาพโปรไฟ
  File? _imageFile;
  void _takePicture() async {
    final _picker = ImagePicker();
    // ignore: deprecated_member_use
    final _pickedImage = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    setState(() {
      _imageFile = File(_pickedImage!.path);
    });
  }
  //สิ้นสุด--#######

  
}
