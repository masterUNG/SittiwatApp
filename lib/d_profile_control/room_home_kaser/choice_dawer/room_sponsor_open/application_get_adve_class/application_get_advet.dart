import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';

class Application02 extends StatefulWidget {
  const Application02({Key? key}) : super(key: key);

  @override
  _Application02State createState() => _Application02State();
}

class _Application02State extends State<Application02> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: MyStyle().fonBack15("Welcome to Thai Kaset Hey"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
             Container(
              width: double.infinity,
              //height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar4.jpg"),
                    fit: BoxFit.cover),
              ),
            ),


            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    avatar01(), //ถ่ายรูปโปรไฟ
                    MyStyle().fonWhite15("*** รูปถ่ายปัจจุบัน ***"),
                    const SizedBox(height: 15),
                    text01(), //กรอกชื่อสมาชิก
                    const SizedBox(height: 15),
                    text02(), //กรอกรหัสสมาชิก
                    const SizedBox(height: 15),
                    text03(), //กรอกเบอร์โทร
                    const SizedBox(height: 15),
                    text04(), //กรอกที่อยู่
                    const SizedBox(height: 15),
                    MyStyle()
                        .fonWhite15("บอกประเภทโฆษณาที่อยากได้เป็นพิเศษ 3 ประเภท"),
                    const SizedBox(height: 15),
                    textBuil(), //บรรณยายคุณสมบัติ
                    const SizedBox(height: 15),
                    MyStyle().fonWhite12(
                        "ทางแอพจะทำการตรวจสอบและแจ้งผลให้ท่านทราบภายใน 30 วัน"),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: screen * 0.62,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyStyle().yellouuColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (image == null) {
                            normalDialog(context, "Profile",
                                "กรุณาใส่รูปโปรไฟร์ด้วยครับ\nเป็นรูปปัจจุบันนะครับ");
                          } else {
                            //############# ใช้การโชป๊อปอัปไปก่อนเมื่อถึงกำหนดระยะเวลาทั้งตั้งไว้หรือพัฒนาเสร็จค่อยเปิด ###########
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return showAlert(context);
                              },
                            );
                            ////####################### ปิดป๊อบอัปและเปิดตัวนี้ ######################################
                            // uploadPictureToStorage();
                            // Navigator.pop(context);
                            // Fluttertoast.showToast(
                            //   msg: "ขอบคุณมากครับที่ให้ความสนใจ",
                            //   timeInSecForIosWeb: 5,
                            //   fontSize: 20,
                            //   gravity: ToastGravity.CENTER,
                            //   backgroundColor: Colors.greenAccent.shade400,
                            //   textColor: Colors.black,
                            // );
                          }
                        },
                        child: MyStyle().fonWhite15("ส่งข้อมูลการสมัคร"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //การเตรียม Firebase ("คำขอเปิดรับโฆษณา")
  late String user1, user2, user3, user4, user5, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("คำขอเปิดรับโฆษณา/product$i.jpg");
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
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("คำขอเปิดรับโฆษณา")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //ถ่ายรูปโปรไฟ
  Center avatar01() {
    return Center(
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 5,
            // shadowColor: Colors.amber,
            color: Colors.white10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white10,
              backgroundImage: image == null ? null : FileImage(image!),
            ),
          ),
          Positioned(
            bottom: 0.5,
            right: 0.5,
            child: IconButton(
              iconSize: 20,
              color: Colors.white70,
              icon: const Icon(Icons.camera),
              onPressed: _takePicture,
            ),
          ),
        ],
      ),
    );
  }

  //กรอกชื่อสมาชิก
  Card text01() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.blueAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(180),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user1 = value;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Name:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //กรอกรหัสสมาชิก
  Card text02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.blueAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(180),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user2 = value;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "รหัสสมาชิก:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //กรอกเบอร์โทร
  Card text03() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.blueAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(180),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user3 = value;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.perm_phone_msg,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "เบอร์โทรศัพท์:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //กรอกที่อยู่
  Card text04() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.blueAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(180),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(40)],
              onChanged: (value) {
                user4 = value;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "ที่อยู่ อำเภอ จังหวัด:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //บรรณยายคุณสมบัติ
  Card textBuil() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.deepPurpleAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screen * 0.9,
        decoration: BoxDecoration(
          color: MyStyle().greenColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(500)],
          maxLines: 7,
          onChanged: (value) {
            user5 = value;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().blueColor04)),
            labelStyle: const TextStyle(
              color: Colors.white38,
            ),
            labelText: "รายละเอียด:",
            border: InputBorder.none,
          ),
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  //ชุดทำรูปภาพโปรไฟ
  File? image;
  void _takePicture() async {
    final _picker = ImagePicker();
    // ignore: deprecated_member_use
    final _pickedImage = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 20,
    );
    setState(() {
      image = File(_pickedImage!.path);
    });
  }
  //สิ้นสุด--#######

  //โชป๊อปอัป
  AlertDialog showAlert(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15(
        "Thai...KASET HEY",
      ),
      content: MyStyle().fongreen15(
        "ขอขอบคุณครับที่สนใจบริการนี้\nคุณยังไม่เข้าเงื่อนไขการเปิดใช้งาน\nกรุณาศึกษาหลักเกณฑ์การสมัครบริการนี้ก่อนนะครับ",
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
                  Navigator.pushNamed(context, "/profilecontrol");
                },
                child: MyStyle().fongreen15("ยกเลิก"),
              ),
            ),
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  //Navigator.pushAndRemoveUntil(context, , (route) => false);

                  Navigator.pushNamed(context, "/mygetads");
                },
                child: MyStyle().fongreen15("ดูหลักเกณฑ์"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
