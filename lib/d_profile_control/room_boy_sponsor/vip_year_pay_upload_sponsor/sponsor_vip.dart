import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class SponsorVip extends StatefulWidget {
  const SponsorVip({Key? key}) : super(key: key);

  @override
  _SponsorVipState createState() => _SponsorVipState();
}

class _SponsorVipState extends State<SponsorVip> {
  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง

  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/video/background6.jpg"), fit: BoxFit.cover),
         
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/story"),
                      icon: Icon(
                        Icons.switch_account_outlined,
                        color: Colors.orange.shade800,
                        size: 20,
                      ),
                    ),
                    Center(child: MyStyle().fongreen25("THAI KASET HEY")),
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/profilecontrol"),
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.orange.shade800,
                        size: 20,
                      ),
                    )
                  ],
                ),
                Center(child: MyStyle().fonBack15("รูปแบบโฆษณา")),
                MyStyle().fonBack12(
                    "1.) โฆษณาออกต้นคลิปทุกคลิปทุกๆ 1 ชม.ความยาว 15 วินาที"),
                MyStyle().fonBack12("2.) ระยะเวลา 1 ปี ราคา 100,000 บาท"),

                nameMonne(), //ชื่อบัญชีรับเงินค่าโฆษณา
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        builImage(), //รูปสลีปการโอนเงิน
                        const SizedBox(height: 15),
                        MyStyle().fonBack15("กรอกรายการโอนเงิน"),
                        text01(), //นามผู้โอน
                        const SizedBox(height: 15),
                        text02(), //ที่อยู่
                        const SizedBox(height: 15),
                        text03(), //เบอร์โทร
                        const SizedBox(height: 15),
                        text04(), //จำนวนเงินที่โอน
                        const SizedBox(height: 15),
                        text05(), //วันที่โอนเงิน
                        const SizedBox(height: 15),
                        text06(), //เวลาโอนเงิน
                        const SizedBox(height: 15),
                        const SizedBox(height: 15),
                        builButtonVip(), //ปุ่มอัปโหลด
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: prefer_typing_uninitialized_variables

  ExpansionTile nameMonne() {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey.shade300,
      backgroundColor: MyStyle().telColor01,
      title: MyStyle().fonBack15("บัญชีชำระค่าโฆษณา ตัวอย่างโฆษณา"),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fonWhite20("บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
              MyStyle().fonWhite15("ธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("สาขาธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("เลขบัญชีธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("member 1 ปี 100,000 บาท"),
              const SizedBox(height: 5),
              MyStyle().fonWhite15("ตัวอย่างโฆษณา"),
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
              MyStyle().fonWhite15("เตรียมไฟ Video ให้พร้อมก่อนชำระเงิน"),
            ],
          ),
        ),
      ],
    );
  }

  TextFormField text01() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user1 = value;
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "นามผู้โอนเงิน:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  TextFormField text02() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user2 = value;
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "ที่อยู่:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  TextFormField text03() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user1 = value;
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "เบอร์โทร:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  TextFormField text04() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user1 = value;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "จำนวนเงินที่โอน:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  TextFormField text05() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user1 = value;
      },
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "วันที่โอน:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  TextFormField text06() {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      onChanged: (value) {
        user1 = value;
      },
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().blueColor04)),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 15),
        labelText: "เวลาที่โอน:",
        border: InputBorder.none,
      ),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Card builImage() {
    return Card(
      elevation: 5,
      shadowColor: Colors.white10,
      color: Colors.white10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )),
      child: Stack(
        children: [
          Container(
            width: screen * 8,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: image == null ? MyStyle().showLogo2() : Image.file(image!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: getImagefromGalleryOne,
                icon: const Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Colors.black45,
                ),
              ),
              IconButton(
                onPressed: getImagefromcameraOne,
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget builButtonVip() {
    return Container(
      width: screen * 0.8,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyStyle().redColor,
            MyStyle().orangeColor,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton.icon(
        onPressed: () {
          if (image == null) {
            normalDialog(context, "ไม่มีรูปสลีป",
                "กรุณาใส่รูปสลีปการโอนเงินด้วยครับ\nขอบคุณครับ");
          } else {
            uploadPictureToStorage();
            Navigator.pushNamed(context, "/UploadFileVdoYear");
            Fluttertoast.showToast(
              msg: "ขอบคุณที่ให้การสนับสนุน Thai..Kaset Hey ครับ",
              timeInSecForIosWeb: 5,
              fontSize: 20,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            );
          }
        },
        icon: const Icon(
          Icons.touch_app,
          color: Colors.white,
          size: 25,
        ),
        label: MyStyle().fonWhite15("ส่งข้อมูลชำระเงิน/ไป Upload Video"),
      ),
    );
  }

 

  //เริ่มต้น vdo การเตรียม Firebase("จ่ายค่าโฆษณาVDOแบบที่1")###############
  late String user1, user2, user3, user4, user5, user6, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายค่าโฆษณาVDOแบบรายปี/product$i.jpg");
    UploadTask storageUploadTask = storageReference.putFile(image!);

    urlimage = (await (await storageUploadTask).ref.getDownloadURL());
    //print("urlimage=$urlimage");
    insertValueToFireStore();
  }

  Future<void> insertValueToFireStore() async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: prefer_collection_literals
    Map<String, dynamic> map = Map();
    map["user1"] = user1;
    map["user2"] = user2;
    map["user3"] = user3;
    map["user4"] = user4;
    map["user5"] = user5;
    map["user6"] = user6;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("จ่ายค่าโฆษณาVDOแบบรายปี")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง
  File? image;
  final pickerOne = ImagePicker();
  //ชุดนี้ทำภาพถ่ายรูป
  Future getImagefromcameraOne() async {
    // ignore: deprecated_member_use
    final pickedImageOne = await pickerOne.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImageOne!.path);
    });
  }

  //ชุดนี้ทำถ่ายรูปภาพ
  Future getImagefromGalleryOne() async {
    // ignore: deprecated_member_use
    final pickedImageOne =
        // ignore: deprecated_member_use
        await pickerOne.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImageOne!.path);
    });
  }
}
