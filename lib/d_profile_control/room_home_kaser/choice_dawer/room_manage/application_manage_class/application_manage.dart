import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_manage/application_manage_class/upload_vdo_application_manage.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class Application01 extends StatefulWidget {
  const Application01({Key? key}) : super(key: key);

  @override
  _Application01State createState() => _Application01State();
}

class _Application01State extends State<Application01> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              //height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar5.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, "/story"),
                                icon: const Icon(
                                  Icons.switch_account_outlined,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              MyStyle().fonWhite12("สตอรี่")
                            ],
                          ),
                          avatar01(), //ถ่ายรูปโปรไฟ
                          Column(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, "/profilecontrol"),
                                icon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              MyStyle().fonWhite12("ฉัน"),
                            ],
                          ),
                        ],
                      ),
                      MyStyle().fonBack12("*** รูปถ่ายปัจจุบัน ***"),

                      const Expanded(child: ProfileNameGmail()),

                      
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),

                          const SizedBox(height: 15),
                          text01(), //กรอกชื่อสมาชิก
                          const SizedBox(height: 15),
                          text02(), //กรอกรหัสสมาชิก
                          const SizedBox(height: 15),
                          text03(), //กรอกเบอร์โทร
                          const SizedBox(height: 15),
                          text04(), //กรอกที่อยู่
                          const SizedBox(height: 15),
                          formChoice(),
                          const SizedBox(height: 15),
                          MyStyle().fonWhite12(
                              "บอกเหตุผลที่ทางแอพต้องรับท่านเข้าร่วมบริหารแพรทฟรอม"),
                          const SizedBox(height: 15),
                          textBuil(), //บรรณยายคุณสมบัติ
                          const SizedBox(height: 15),
                          MyStyle().fonWhite12(
                              "นอกจากคำบรรณยายแล้วท่านต้องการฟรีเซ้นเพิ่มเติม (ไม่บังคับ)"),
                          MyStyle().fonWhite12("มีเวลา 2 นาที"),
                          const SizedBox(height: 15),
                          builImageVDO(), //บันทึก vdo
                          const SizedBox(height: 15),
                          MyStyle().fonWhite12(
                              "ทางแอพจะทำการตรวจสอบและแจ้งผลให้ท่านทราบภายใน 10 วัน"),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: screen * 0.62,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: MyStyle().yellouuColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
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
                                  //   backgroundColor: Colors.white,
                                  //   textColor: Colors.black,
                                  // );
                                }
                              },
                              child: MyStyle().fonWhite15("ส่งข้อมูลการสมัคร"),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //การเตรียม Firebase ("คำขอเข้าร่วมบริหารแพรตฟร์อม")
  // ignore: prefer_typing_uninitialized_variables
  var choice1,
      choice2,
      choice3,
      choice4,
      choice5,
      choice6,
      choice7,
      choice8,
      choice9,
      choice10,
      choice11,
      choice12,
      choice13,
      choice14,
      choice15,
      choice16,
      choice17;
  late String user1, user2, user3, user4, user5, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("คำขอร่วมบริหารแพรทฟร์อม/product$i.jpg");
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
    map["choice1"] = choice1;
    map["choice2"] = choice2;
    map["choice3"] = choice3;
    map["choice4"] = choice4;
    map["choice5"] = choice5;
    map["choice6"] = choice6;
    map["choice7"] = choice7;
    map["choice8"] = choice8;
    map["choice9"] = choice9;
    map["choice10"] = choice10;
    map["choice11"] = choice11;
    map["choice12"] = choice12;
    map["choice13"] = choice13;
    map["choice14"] = choice14;
    map["choice15"] = choice15;
    map["choice16"] = choice16;
    map["choice17"] = choice17;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("คำขอร่วมบริหารแพรทฟร์อม")
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(80),
          ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
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
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().blueColor04)),
                suffixIcon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Name:",
                labelStyle: const TextStyle(
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
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
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
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
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
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
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
              inputFormatters: [LengthLimitingTextInputFormatter(35)],
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

  Widget formChoice() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: Container(
        width: screen * 0.9,
        decoration: BoxDecoration(
          color: Colors.green.shade900,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              MyStyle().fonWhite12("1.คุณรู้จักพื้นที่อำเภอที่คุณอาศัย"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่รู้จัก",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่รู้จัก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอรู้จัก",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอรู้จัก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "รู้จักดี",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("รู้จักดี"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "รู้จักดีมาก",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("รู้จักดีมาก"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "2.คุณพร้อมที่จะช่วยเหลือการขายร้านค้าอื่นๆในพื้นที่คุณหรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ยังไม่พร้อม",
                groupValue: choice2,
                onChanged: (var value) {
                  setState(() {
                    choice2 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยังไม่พร้อม"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ต้องดูก่อน",
                groupValue: choice2,
                onChanged: (var value) {
                  setState(() {
                    choice2 = value;
                  });
                },
                title: MyStyle().fonWhite10("ต้องดูก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อม",
                groupValue: choice2,
                onChanged: (var value) {
                  setState(() {
                    choice2 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("3.ความสามารถในการใช้คอมพิวเตอร์ของคุณ"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่ได้เลย",
                groupValue: choice3,
                onChanged: (var value) {
                  setState(() {
                    choice3 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ได้เลย"),
                subtitle: MyStyle().fonWhite12("แต่จะเริ่มหัดใช้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอได้",
                groupValue: choice3,
                onChanged: (var value) {
                  setState(() {
                    choice3 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอได้"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันใช้อยู่"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ดีมาก",
                groupValue: choice3,
                onChanged: (var value) {
                  setState(() {
                    choice3 = value;
                  });
                },
                title: MyStyle().fonWhite10("ดีมาก"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันใช้เป็นประจำ"),
              ),
              const SizedBox(height: 15),
              MyStyle()
                  .fonWhite12("4.ความสามารถในการใช้ระบบเน๊ตเวคต่างๆของคุณ"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่ได้เลย",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ได้เลย"),
                subtitle: MyStyle().fonWhite12("แต่จะเริ่มหัดใช้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอได้",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอได้"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันใช้อยู่"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ดีมาก",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite10("ดีมาก"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันใช้เป็นประจำ"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("5.คุณสามารถไลสด"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่ได้เลย",
                groupValue: choice5,
                onChanged: (var value) {
                  setState(() {
                    choice5 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ได้เลย"),
                subtitle: MyStyle().fonWhite12("แต่จะเริ่มหัด"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอได้",
                groupValue: choice5,
                onChanged: (var value) {
                  setState(() {
                    choice5 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอได้"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันไลอยู่"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ดีมาก",
                groupValue: choice5,
                onChanged: (var value) {
                  setState(() {
                    choice5 = value;
                  });
                },
                title: MyStyle().fonWhite10("ดีมาก"),
                subtitle: MyStyle().fonWhite12("ปัจจุบันไลเป็นประจำ"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("6.คุณสามารถออกพื้นที่ตามนโยบายของทางแอพ"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่สะดวก",
                groupValue: choice6,
                onChanged: (var value) {
                  setState(() {
                    choice6 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่สะดวก"),
                subtitle: MyStyle().fonWhite12("มีงานประจำ"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ได้เป็นบางครั้ง",
                groupValue: choice6,
                onChanged: (var value) {
                  setState(() {
                    choice6 = value;
                  });
                },
                title: MyStyle().fonWhite10("ได้เป็นบางครั้ง"),
                subtitle: MyStyle().fonWhite12("มีอย่างอื่นต้องทำเป็นหลัก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ได้ตลอด",
                groupValue: choice6,
                onChanged: (var value) {
                  setState(() {
                    choice6 = value;
                  });
                },
                title: MyStyle().fonWhite10("ได้ตลอด"),
                subtitle:
                    MyStyle().fonWhite12("สามารถเปลี่ยนมาบริหารแอพเป็นหลัก"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("7.คุณพร้อมรับนโยบายต่างๆจากทางแอพหรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ยังไม่พร้อม",
                groupValue: choice7,
                onChanged: (var value) {
                  setState(() {
                    choice7 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยังไม่พร้อม"),
                subtitle: MyStyle().fonWhite12("ต้องดูสถานะการณ์ก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อม",
                groupValue: choice7,
                onChanged: (var value) {
                  setState(() {
                    choice7 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle:
                    MyStyle().fonWhite12("แต่ต้องดูสถานะการณ์และนโยบายก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมมาก",
                groupValue: choice7,
                onChanged: (var value) {
                  setState(() {
                    choice7 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อมมาก"),
                subtitle: MyStyle().fonWhite12("รับนโยบายและทำเต็มที่"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "8.คุณพร้อมที่จะสนับสนุนและประชาสัมพันธ์แอพหรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ยังไม่พร้อม",
                groupValue: choice8,
                onChanged: (var value) {
                  setState(() {
                    choice8 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยังไม่พร้อม"),
                subtitle: MyStyle().fonWhite12("ต้องดูสถานะการณ์ก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อม",
                groupValue: choice8,
                onChanged: (var value) {
                  setState(() {
                    choice8 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle: MyStyle().fonWhite12("แต่ต้องดูสถานะการณ์ทีสะดวก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมมาก",
                groupValue: choice8,
                onChanged: (var value) {
                  setState(() {
                    choice8 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อมมาก"),
                subtitle: MyStyle()
                    .fonWhite12("ทำเต็มที่ประชาสัมพันธ์แอพทุกครั้งที่มีโอกาศ"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "9.ปัจจุบันคุณมีอาชีพอะไรนอกเหนือจากการขายสินค้ากับทางแอพ"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่มี",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่มี"),
                subtitle:
                    MyStyle().fonWhite12("กำลังหาอยู่และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ค้าขายทั่วไป",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("ค้าขายทั่วไป"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ค้าขายออนไลน์",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("ค้าขายออนไลน์"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "รับจ้างทั่ไป",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("รับจ้างทั่วไป"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ทำการเกษตร",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("ทำการเกษตร"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พนักงานบริษัท",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("พนักงานบริษัท"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เจ้าของกิจการ",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("เจ้าของกิจการ"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือกเสริม"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "รับราชการ",
                groupValue: choice9,
                onChanged: (var value) {
                  setState(() {
                    choice9 = value;
                  });
                },
                title: MyStyle().fonWhite10("รับราชการ"),
                subtitle: MyStyle().fonWhite12("และมองแอพนี้เป็นทางเลือกเสริม"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "10.หากคุณได้รับเลือกเข้าร่วมบริหารคุณพร้อมที่จะรับนโยบาย"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมน้อย",
                groupValue: choice10,
                onChanged: (var value) {
                  setState(() {
                    choice10 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle:
                    MyStyle().fonWhite12("แต่ขอเวลาเตรียมตัวก่อนแล้วจะแจ้งกับ"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมปานกลาง",
                groupValue: choice10,
                onChanged: (var value) {
                  setState(() {
                    choice10 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle: MyStyle().fonWhite12(
                    "แจ้งนโยบายมาได้เลยจะเริ่มทำตามเมื่อไรจะแจ้งกับ"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมมาก",
                groupValue: choice10,
                onChanged: (var value) {
                  setState(() {
                    choice10 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle: MyStyle()
                    .fonWhite12("แจ้งนโยบายมาได้เลยจะเริ่มทำตามนโยบายทันที"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("11.คูณต้อการรับงบประมาณบริหารแบบใด"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "รายเดือน",
                groupValue: choice11,
                onChanged: (var value) {
                  setState(() {
                    choice11 = value;
                  });
                },
                title: MyStyle().fonWhite10("รายเดือน"),
                subtitle: MyStyle().fonWhite12("สะดวกรับเป็นรายเดือน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ครึ่งไตรมาส (45 วัน)",
                groupValue: choice11,
                onChanged: (var value) {
                  setState(() {
                    choice11 = value;
                  });
                },
                title: MyStyle().fonWhite10("ครึ่งไตรมาส (45 วัน)"),
                subtitle:
                    MyStyle().fonWhite12("สะดวกรับเป็นครึ่งไตรมาส (45 วัน)"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไตรมาส (90 วัน)",
                groupValue: choice11,
                onChanged: (var value) {
                  setState(() {
                    choice11 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไตรมาส (90 วัน)"),
                subtitle: MyStyle().fonWhite12("สะดวกรับเป็นไตรมาส (90 วัน)"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("12.คุณเข้าใจการได้รับงบประมาณหรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ยังไม่เข้าใจ",
                groupValue: choice12,
                onChanged: (var value) {
                  setState(() {
                    choice12 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยังไม่เข้าใจ"),
                subtitle: MyStyle().fonWhite12("ต้องให้ทางแอพอธบายอีกครั้ง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอเข้าใจ",
                groupValue: choice12,
                onChanged: (var value) {
                  setState(() {
                    choice12 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอเข้าใจ"),
                subtitle:
                    MyStyle().fonWhite12("ต้องให้ทางแอพอธบายเพิ่มเติมอีกครั้ง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เข้าใจ",
                groupValue: choice12,
                onChanged: (var value) {
                  setState(() {
                    choice12 = value;
                  });
                },
                title: MyStyle().fonWhite10("เข้าใจ"),
                subtitle: MyStyle().fonWhite12(
                    "เป็นการจัดสรรงบจากจากยอดขายในพื้นที่และฉันจะอธิบายเพิ่มในหมวดรายละเอียดด้านล่าง"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "13.คุณมีความเข้าใจวัตถุประสงค์ของแอพ Thai kaset Hey"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่เข้าใจ",
                groupValue: choice13,
                onChanged: (var value) {
                  setState(() {
                    choice13 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่เข้าใจ"),
                subtitle: MyStyle().fonWhite12("ต้องให้ทางแอพอธบายอีกครั้ง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอเข้าใจ",
                groupValue: choice13,
                onChanged: (var value) {
                  setState(() {
                    choice13 = value;
                  });
                },
                title: MyStyle().fonWhite10("พอเข้าใจ"),
                subtitle:
                    MyStyle().fonWhite12("ต้องให้ทางแอพอธบายเพิ่มเติมอีกครั้ง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เข้าใจ",
                groupValue: choice13,
                onChanged: (var value) {
                  setState(() {
                    choice13 = value;
                  });
                },
                title: MyStyle().fonWhite10("เข้าใจ"),
                subtitle: MyStyle()
                    .fonWhite12("และฉันจะอธิบายเพิ่มในหมวดรายละเอียดด้านล่าง"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12("14.ความสามารถในการใช้แอพ Thai kaset Hey"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เข้าใจน้อย",
                groupValue: choice14,
                onChanged: (var value) {
                  setState(() {
                    choice14 = value;
                  });
                },
                title: MyStyle().fonWhite10("เข้าใจ"),
                subtitle: MyStyle()
                    .fonWhite12("แต่ยังไม่คล่องและยังเข้าไม่ถึงทุกหมวดของแอพ"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เข้าใจปานกลาง",
                groupValue: choice14,
                onChanged: (var value) {
                  setState(() {
                    choice14 = value;
                  });
                },
                title: MyStyle().fonWhite10("เข้าใจ"),
                subtitle: MyStyle().fonWhite12("พยายามเข้าไปดูให้ครบทุกหมวด"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เข้าใจมาก",
                groupValue: choice14,
                onChanged: (var value) {
                  setState(() {
                    choice14 = value;
                  });
                },
                title: MyStyle().fonWhite10("เข้าใจ"),
                subtitle: MyStyle().fonWhite12(
                    "เคยเข้าและทดลองใช้แล้วทุกหมวดสามารถให้คำแนะนำบุคคลอื่นๆได้"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "15.คุณพร้อที่จะให้ข้อมูลเพิ่มเติมภายหลังหรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อม",
                groupValue: choice15,
                onChanged: (var value) {
                  setState(() {
                    choice15 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle: MyStyle().fonWhite12("ยินดีให้ข้อมูลเพิ่มเติม"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่พร้อม",
                groupValue: choice15,
                onChanged: (var value) {
                  setState(() {
                    choice15 = value;
                  });
                },
                title: MyStyle().fonWhite10("พร้อม"),
                subtitle: MyStyle().fonWhite12("แต่ต้องดูคำถามก่อน"),
              ),
              const SizedBox(height: 15),
              MyStyle()
                  .fonWhite12("16.คุณยินยอมให้ทางแอพตรวจสอบข้อมูลนี้หรือไม่"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ไม่ยินยอม",
                groupValue: choice16,
                onChanged: (var value) {
                  setState(() {
                    choice16 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ยินยอม"),
                subtitle: MyStyle()
                    .fonWhite12("อนุญาติให้แอพดูและตรวจสอบได้ในนี้เท่านั้น"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ยินยอม",
                groupValue: choice16,
                onChanged: (var value) {
                  setState(() {
                    choice16 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยินยอม"),
                subtitle: MyStyle().fonWhite12("อนุญาติให้แอพดูและตรวจสอบได้"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonWhite12(
                  "17.อนาคตหากคุณทำผิดกฎหรือเงื่อนไขระบบจะตัดคุณออกจากทีมบริหารและงบประมาณ"),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "นิสัยหัวหมอ",
                groupValue: choice17,
                onChanged: (var value) {
                  setState(() {
                    choice17 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ยินยอม"),
                subtitle:
                    MyStyle().fonWhite12("ทางแอพต้องแจ้งให้ทราบล่วงหน้าก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "หัวหมอมาก",
                groupValue: choice17,
                onChanged: (var value) {
                  setState(() {
                    choice17 = value;
                  });
                },
                title: MyStyle().fonWhite10("ไม่ยินยอม"),
                subtitle: MyStyle()
                    .fonWhite12("ทางแอพต้องแจ้งให้ทราบล่วงหน้าและเหตูผลก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "หัวหมอนิดๆ",
                groupValue: choice17,
                onChanged: (var value) {
                  setState(() {
                    choice17 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยินยอม"),
                subtitle:
                    MyStyle().fonWhite12("ทางแอพต้องแจ้งให้ทราบล่วงหน้าก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "หัวหมอกลางๆ",
                groupValue: choice17,
                onChanged: (var value) {
                  setState(() {
                    choice17 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยินยอม"),
                subtitle: MyStyle()
                    .fonWhite12("ทางแอพต้องแจ้งให้ทราบล่วงหน้าและเหตูผลก่อน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พอใช้ได้",
                groupValue: choice17,
                onChanged: (var value) {
                  setState(() {
                    choice17 = value;
                  });
                },
                title: MyStyle().fonWhite10("ยินยอม"),
                subtitle:
                    MyStyle().fonWhite12("ทางแอพต้องแจ้งเหตูผลประกอบด้วย"),
              ),
              const SizedBox(height: 15),
              MyStyle().fonyellouu12(
                  "หากข้อมูลเบื้องต้นไม่เป็นความจริงทางแอพขอสงวนสิทธิ์ในการปฎิเสธคำขอนี้"),
              const SizedBox(height: 15),
            ],
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
          color: Colors.green.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(500)],
          maxLines: 7,
          onChanged: (value) {
            user1 = value;
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

  //บันทึก vdo
  Card builImageVDO() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: screen * 0.8,
            child: const UploadVdoApplication(),
          ),
         
        ],
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

                  Navigator.pushNamed(context, "/myentermanagekaset");
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
