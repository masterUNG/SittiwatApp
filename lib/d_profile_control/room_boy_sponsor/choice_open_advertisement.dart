import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class OpenAdvertisement extends StatefulWidget {
  const OpenAdvertisement({Key? key}) : super(key: key);

  @override
  _OpenAdvertisementState createState() => _OpenAdvertisementState();
}

class _OpenAdvertisementState extends State<OpenAdvertisement> {
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
            title: MyStyle().fonWhite12("โฆษณาทีคุณกำหนดเองได้"),
            leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/story"),
              icon: Icon(
                Icons.switch_account_outlined,
                color: Colors.orangeAccent.shade700,
                size: 20,
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "/profilecontrol"),
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.orangeAccent.shade700,
                  size: 20,
                ),
              ),
            ],

            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade200,
            expandedHeight: 300,
            floating: false,
            //pinned: true,
            flexibleSpace: Stack(
              children: [
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
                        videoPlayerController: VideoPlayerController.asset(
                            "lib/video/intorlkaset3.mp4"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    MyStyle().fonBack15(
                        "ยินดีต้อนรับสู่การโฆษณาที่ท่านสามารถเลือกรูปแบบเองได้และยังตรงใจและตรงเป้าหมายของของท่าน"),
                    MyStyle().fonBack15(
                        "-ท่านสามารถกำหนดปริมาณการโฆษณาสินค้าของท่านเอง\n-ควบคุมพื้นที่โฆษณาเองได้\n-ควบคุมงบประมาณเองได้"),
                    const SizedBox(height: 20),
                    sponsorVideo(context), //ปุ่มกดเข้าซื้อโฆษณาแบบวีดีโอ
                    const SizedBox(height: 15),
                    sponsorImage(context), //ปุ่มกดเข้าซื้อโฆษณาชนิดภาพ
                    const SizedBox(height: 15),
                    sponsorImageVideo(
                        context), //ปุ่มกดเข้าซื้อโฆษณาแบบเจาะจงพื้นที่
                    const SizedBox(height: 15),
                    SizedBox(
                      width: screen * 0.4,
                      child: MyStyle().showLogo(),
                    ),
                    const SizedBox(height: 15),
                    showYear(context), //ปุ่มกดเข้าซื้อโฆษณารายปี
                    const SizedBox(height: 15),
                    sponsorUpBar(
                        context), //ปุ่มกดเข้าซื้อโฆษณาบาแทบบน (เข้าไปแล้วให้มีตัวเลือกซื้อโฆษณาแบบของแต่ละหน้า ราคาต่างกัน)
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  //ปุ่มกดเข้าซื้อโฆษณาแบบวีดีโอ
  Widget sponsorVideo(BuildContext context) {
    return SizedBox(
      width: screen * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyStyle().fonWhite15("ลงโฆษณาVdo"),
        ),
        onPressed: () {
          //############# ใช้การโชป๊อปอัปไปก่อนเมื่อถึงกำหนดระยะเวลาทั้งตั้งไว้หรือพัฒนาเสร็จค่อยเปิด ###########
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return showAlertVideo(context);
            },
          );
          // Navigator.pushNamed(context, "/SponsorOne"); #### ปิดป๊อบอัปและเปิดตัวนี้ ##############
        },
      ),
    );
  }

  //ปุ่มกดเข้าซื้อโฆษณาชนิดภาพ
  Widget sponsorImage(BuildContext context) {
    return SizedBox(
      width: screen * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyStyle().fonWhite15("ลงโฆษณาภาพนิ่ง"),
        ),
        onPressed: () {
          //############# ใช้การโชป๊อปอัปไปก่อนเมื่อถึงกำหนดระยะเวลาทั้งตั้งไว้หรือพัฒนาเสร็จค่อยเปิด ###########
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return showAlertImage(context);
            },
          );

          // Navigator.pushNamed(context, "/SponsorTwo"); #### ปิดป๊อบอัปและเปิดตัวนี้ ##############
        },
      ),
    );
  }

  //ปุ่มกดเข้าซื้อโฆษณาแบบเจาะจงพื้นที่
  Widget sponsorImageVideo(BuildContext context) {
    return SizedBox(
      width: screen * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyStyle().fonWhite15("เปิดโฆษณายิงตรงเฉพาะพื้นที่"),
        ),
        onPressed: () {
          //############# ใช้การโชป๊อปอัปไปก่อนเมื่อถึงกำหนดระยะเวลาทั้งตั้งไว้หรือพัฒนาเสร็จค่อยเปิด ###########
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return showAlertImageAndVideo(context);
            },
          );
        },
      ),
    );
  }

  //ปุ่มกดเข้าซื้อโฆษณารายปี
  Widget showYear(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.pink.shade600,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screen * 0.8,
        height: 40,
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(250),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(250),
          ),
        ),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/SponsorVip"),
          child: MyStyle().fonWhite12("เปิดโฆษณา VIDEO memberVIP"),
        ),
      ),
    );
  }

  //ปุ่มกดเข้าซื้อโฆษณาบาแทบบน (เข้าไปแล้วให้มีตัวเลือกซื้อโฆษณาแบบของแต่ละหน้า ราคาต่างกัน)
  Widget sponsorUpBar(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: MyStyle().greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screen * 0.8,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade700,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(250),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(250),
          ),
        ),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/SponsorVip"),
          child: MyStyle().fonWhite12("เปิดโฆษณา VIDEO บนบาของแอพ"),
        ),
      ),
    );
  }

  //โชป๊อปอัป
  AlertDialog showAlertVideo(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15("THAI KASET HEY"),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fongreen12("ขอบคุณครับที่ให้ความสนใจบริการนี้"),
              MyStyle().fongreen12("ทางแอพจะเริ่มเปิดให้บริการวันที่ --/--/--"),
              MyStyle().fongreen12("ขอให้ท่านเตรียมไฟ Video ขนาด ---"),
              MyStyle().fongreen12("ความยาว 15 วินาที"),
              const SizedBox(height: 10),
              MyStyle().fongreen12("แสดงตัวอย่าง"),
              const SizedBox(height: 10),
              //Video แสดงเป็นตังอย่าง
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Chewie(
                  controller: ChewieController(
                    aspectRatio: 3 / 2,
                    autoInitialize: true,
                    looping: false,
                    autoPlay: false,
                    fullScreenByDefault: false,
                    videoPlayerController: VideoPlayerController.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MyStyle().fongreen15("ลักษณะการโฆษณา"),
              MyStyle().fongreen12(
                  "-เป็นโฆษณาที่สามารถให้คุณเลือกได้ว่าจะให้โฆษณาออกช่วงใหนของสตอรี่\n1.ช่วงต้นคลิป\nช่วงกลางคลิป\nท้ายคลิป"),
              MyStyle().fongreen12("ให้เหมาะสมกับงบประมาณและความต้องการของคุณ"),
              MyStyle().fongreen12(
                  "-ทางแอพได้กำหนดจำนวนครั้งของการแสดงโฆษณาตามงบประมาณและช่วงเวลาที่ท่านเลือก"),
              MyStyle().fongreen12(
                  "-การแสดงออกของโฆษณาจะขึ้นอยู่กับเจ้าของสตอรี่นั้นๆจะเป็นผู้เลือกกดออกแสดง"),
              MyStyle().fongreen12(
                  "-ผู้ที่มีสิทธิ์ในการกดแสดงโฆษณาของคุณทางแอพได้กำหนดไว้ว่าผู้นั้นต้องมียอดผู้ติดตามไม่น้อยกว่า 1,000 คน และมียอดคนดูและยอดกดไลน์ตามเกณฑ์ที่ทางแอพได้กำหนดไว้"),
              MyStyle().fongreen12(
                  "เพราะฉะนั้นคุณมั้นใจได้ว่าจะมีคนเห็นโฆษณาของคุณไม่น้อยกว่า30,000 คน ต่อการกดแสดง 1 ครั้ง"),
              const SizedBox(height: 10),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              MyStyle().fonorange12(
                  "หมายเหตุ: ทางแอพได้ทำการศึกษาแล้วว่าการโฆษณาลักษณะแบบนี้จะทำให้เป็นที่จดจำตัวสินค้าของลูกค้าและเกิดการทำตามๆกัน ซึ้งทำให้ตัวสินค้าเป็นที่รู้จักเร็วขึ้น ยอดขายเพิ่มมากขึ้น"),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyStyle().fongreen15("OK"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //โชป๊อปอัป
  AlertDialog showAlertImage(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15("THAI KASET HEY"),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fongreen12("ขอบคุณครับที่ให้ความสนใจบริการนี้"),
              MyStyle().fongreen12("ทางแอพจะเริ่มเปิดให้บริการวันที่ --/--/--"),
              MyStyle().fongreen12("ขอให้ท่านเตรียมไฟ ภาพ ขนาด ---"),
              const SizedBox(height: 10),
              MyStyle().fongreen12("แสดงตัวอย่าง"),
              const SizedBox(height: 10),
              //Video แสดงเป็นตังอย่าง
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Chewie(
                      controller: ChewieController(
                        aspectRatio: 3 / 2,
                        autoInitialize: true,
                        looping: false,
                        autoPlay: false,
                        fullScreenByDefault: false,
                        videoPlayerController: VideoPlayerController.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: MyStyle().showLogo()),
                  )
                ],
              ),
              const SizedBox(height: 15),
              MyStyle().fongreen15("ลักษณะการโฆษณา มุมบนซ้าย"),
              MyStyle().fongreen12("ลักษณะภาพขึ้นโช 10 วินาที"),
              MyStyle().fongreen12(
                  "-เป็นโฆษณาที่สามารถให้คุณเลือกได้ว่าจะให้โฆษณาออกช่วงลำดับที่เท่าไรของสตอรี่\n1.ช่วงต้นคลิปเป็นต้นไป อันดับที่ 1-8"),
              MyStyle().fongreen12("ให้เหมาะสมกับงบประมาณและความต้องการของคุณ"),
              MyStyle().fongreen12(
                  "-ทางแอพได้กำหนดจำนวนครั้งของการแสดงโฆษณาตามงบประมาณและช่วงเวลาที่ท่านเลือก"),
              MyStyle().fongreen12(
                  "-การแสดงออกของโฆษณาจะขึ้นอยู่กับเจ้าของสตอรี่นั้นๆจะเป็นผู้เลือกกดออกแสดง"),
              MyStyle().fongreen12(
                  "-ผู้ที่มีสิทธิ์ในการกดแสดงโฆษณาของคุณทางแอพได้กำหนดไว้ว่าผู้นั้นต้องมียอดผู้ติดตามไม่น้อยกว่า 1,000 คน และมียอดคนดูและยอดกดไลน์ตามเกณฑ์ที่ทางแอพได้กำหนดไว้"),
              MyStyle().fongreen12(
                  "เพราะฉะนั้นคุณมั้นใจได้ว่าจะมีคนเห็นโฆษณาของคุณไม่น้อยกว่า30,000 คน ต่อการกดแสดง 1 ครั้ง"),
              const SizedBox(height: 10),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              MyStyle().fonorange12(
                  "หมายเหตุ: ทางแอพได้ทำการศึกษาแล้วว่าการโฆษณาลักษณะแบบนี้จะทำให้เป็นที่จดจำตัวสินค้าของลูกค้าและเกิดการทำตามๆกัน ซึ้งทำให้ตัวสินค้าเป็นที่รู้จักเร็วขึ้น ยอดขายเพิ่มมากขึ้น"),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyStyle().fongreen15("OK"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //โชป๊อปอัป
  AlertDialog showAlertImageAndVideo(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15("THAI KASET HEY"),
      content: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fongreen12("ขอบคุณครับที่ให้ความสนใจบริการนี้"),
              MyStyle().fonorange12(
                  "ความพิเศษของการโฆษณาช่องนี้คุณจะสามารถระบุพื้นที่เป้าหมายได้อย่างเจาะจงในแต่ละจังหวัดหรืออำเภอที่ต้องการทำตลาดสินค้าของคูณ"),
              MyStyle().fongreen12("ทางแอพจะเริ่มเปิดให้บริการวันที่ --/--/--"),
              MyStyle().fongreen12("ขอให้ท่านเตรียมไฟ Video ขนาด ---"),
              MyStyle().fongreen12("ความยาว 15 วินาที"),
              MyStyle().fongreen12("ขอให้ท่านเตรียมไฟ ภาพ ขนาด ---"),
              const SizedBox(height: 10),
              MyStyle().fongreen12("แสดงตัวอย่าง แบบที่ 1."),
              const SizedBox(height: 10),
              //Video แสดงเป็นตังอย่าง
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Chewie(
                  controller: ChewieController(
                    aspectRatio: 3 / 2,
                    autoInitialize: true,
                    looping: false,
                    autoPlay: false,
                    fullScreenByDefault: false,
                    videoPlayerController: VideoPlayerController.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              MyStyle().fongreen15("ลักษณะการโฆษณา"),
              MyStyle().fongreen12(
                  "-เป็นโฆษณาที่สามารถให้คุณเลือกได้ว่าจะให้โฆษณาออกช่วงใหนของสตอรี่\n1.ช่วงต้นคลิป\nช่วงกลางคลิป\nท้ายคลิป"),
              MyStyle().fongreen12("ให้เหมาะสมกับงบประมาณและความต้องการของคุณ"),
              MyStyle().fongreen12(
                  "-ทางแอพได้กำหนดจำนวนครั้งของการแสดงโฆษณาตามงบประมาณและช่วงเวลาที่ท่านเลือก"),
              MyStyle().fongreen12(
                  "-การแสดงออกของโฆษณาจะขึ้นอยู่กับเจ้าของสตอรี่นั้นๆจะเป็นผู้เลือกกดออกแสดง"),
              MyStyle().fongreen12(
                  "-ผู้ที่มีสิทธิ์ในการกดแสดงโฆษณาของคุณทางแอพได้กำหนดไว้ว่าผู้นั้นต้องมียอดผู้ติดตามไม่น้อยกว่า 1,000 คน และมียอดคนดูและยอดกดไลน์ตามเกณฑ์ที่ทางแอพได้กำหนดไว้"),
              MyStyle().fongreen12(
                  "เพราะฉะนั้นคุณมั้นใจได้ว่าจะมีคนเห็นโฆษณาของคุณไม่น้อยกว่า30,000 คน ต่อการกดแสดง 1 ครั้ง"),
              const SizedBox(height: 10),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              MyStyle().fonorange12(
                  "หมายเหตุ: ทางแอพได้ทำการศึกษาแล้วว่าการโฆษณาลักษณะแบบนี้จะทำให้เป็นที่จดจำตัวสินค้าของลูกค้าและเกิดการทำตามๆกัน ซึ้งทำให้ตัวสินค้าเป็นที่รู้จักเร็วขึ้น ยอดขายเพิ่มมากขึ้น"),
              const SizedBox(height: 20),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              MyStyle().fongreen12("แสดงตัวอย่าง แบบที่ 2."),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Chewie(
                      controller: ChewieController(
                        aspectRatio: 3 / 2,
                        autoInitialize: true,
                        looping: false,
                        autoPlay: false,
                        fullScreenByDefault: false,
                        videoPlayerController: VideoPlayerController.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(child: MyStyle().showLogo()),
                  )
                ],
              ),
              const SizedBox(height: 15),
              MyStyle().fongreen15("ลักษณะการโฆษณา มุมบนซ้าย"),
              MyStyle().fongreen12("ลักษณะภาพขึ้นโช 10 วินาที"),
              MyStyle().fongreen12(
                  "-เป็นโฆษณาที่สามารถให้คุณเลือกได้ว่าจะให้โฆษณาออกช่วงลำดับที่เท่าไรของสตอรี่\n1.ช่วงต้นคลิปเป็นต้นไป อันดับที่ 1-8"),
              MyStyle().fongreen12("ให้เหมาะสมกับงบประมาณและความต้องการของคุณ"),
              MyStyle().fongreen12(
                  "-ทางแอพได้กำหนดจำนวนครั้งของการแสดงโฆษณาตามงบประมาณและช่วงเวลาที่ท่านเลือก"),
              MyStyle().fongreen12(
                  "-การแสดงออกของโฆษณาจะขึ้นอยู่กับเจ้าของสตอรี่นั้นๆจะเป็นผู้เลือกกดออกแสดง"),
              MyStyle().fongreen12(
                  "-ผู้ที่มีสิทธิ์ในการกดแสดงโฆษณาของคุณทางแอพได้กำหนดไว้ว่าผู้นั้นต้องมียอดผู้ติดตามไม่น้อยกว่า 1,000 คน และมียอดคนดูและยอดกดไลน์ตามเกณฑ์ที่ทางแอพได้กำหนดไว้"),
              MyStyle().fongreen12(
                  "เพราะฉะนั้นคุณมั้นใจได้ว่าจะมีคนเห็นโฆษณาของคุณไม่น้อยกว่า30,000 คน ต่อการกดแสดง 1 ครั้ง"),
              const SizedBox(height: 10),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              MyStyle().fonorange12(
                  "หมายเหตุ: ทางแอพได้ทำการศึกษาแล้วว่าการโฆษณาลักษณะแบบนี้จะทำให้เป็นที่จดจำตัวสินค้าของลูกค้าและเกิดการทำตามๆกัน ซึ้งทำให้ตัวสินค้าเป็นที่รู้จักเร็วขึ้น ยอดขายเพิ่มมากขึ้น"),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyStyle().fongreen15("OK"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
