import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class Guarantee extends StatefulWidget {
  const Guarantee({Key? key}) : super(key: key);

  @override
  _GuaranteeState createState() => _GuaranteeState();
}

class _GuaranteeState extends State<Guarantee> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.greenAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
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
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("สตอรี่")
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: MyStyle().greenColor,
                        radius: 32,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/profilecontrol"),
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("ฉัน")
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: ProfileNameGmail()),
                  Center(
                      child:
                          MyStyle().fonBack15("ประกันสินค้าประมูล/ชำระเงิน")),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    text01(),
                    const SizedBox(height: 15),
                    text02(),
                    const SizedBox(height: 15),
                    text03(),
                    const SizedBox(height: 10),
                    textChoice(),
                    const SizedBox(height: 10),
                    Divider(color: Colors.red.shade900),
                    textKaset(),
                    const SizedBox(height: 10),
                    Divider(color: Colors.red.shade900),
                    const SizedBox(height: 10),
                    text04(),
                    const SizedBox(height: 15),
                    text05(),
                    const SizedBox(height: 15),
                    text06(),
                    const SizedBox(height: 10),
                    Center(child: MyStyle().fonBack15("รูปสลีปการโอนเงิน")),
                    const SizedBox(height: 10),
                    imageGuarantee(), //รูปสลีปการโอนเงิน

                    const SizedBox(height: 20),
                    Container(
                      width: screen * 0.6,
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
                        icon: const Icon(
                          Icons.touch_app,
                          color: Colors.white,
                          size: 25,
                        ),
                        label: MyStyle()
                            .fonWhite15("ส่งข้อมูลโอนเงินประกันสินค้า"),
                        onPressed: () {
                          if (image == null) {
                            normalDialog(context, "ไม่มีรูปสลีป",
                                "กรุณาใส่รูปสลีปการโอนเงินด้วยครับ");
                          } else {
                            uploadPictureToStorage();
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                              msg: "ขอบคุณมากครับ",
                              timeInSecForIosWeb: 5,
                              fontSize: 20,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: prefer_typing_uninitialized_variables
  var choice;
  //การเตรียม Firebase ("จ่ายเงินประกันสินค้าประมูล")
  late String user1, user2, user3, user4, user5, user6, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายเงินประกันสินค้าประมูล/product$i.jpg");
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
    map["choice"] = choice;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("จ่ายเงินประกันสินค้าประมูล")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //รูปโปรไฟผู้ซื้อประกัน
  Row avatarProfile() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: MyStyle().greenColor,
          radius: 28,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            MyStyle().fonWhite15("data:ชื่อ"),
            MyStyle().fonWhite12("data:รหัส"),
          ],
        )
      ],
    );
  }

  Card text01() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user1 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "รหัสร้านค้า:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card text02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user2 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อสินค้า:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card text03() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user3 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ราคาเริ่มต้นประมูล:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textChoice() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  MyStyle().fonWhite15("กำหนดสินค้าพร้อมส่ง:"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        RadioListTile(
                          activeColor: MyStyle().orangeColor,
                          value: "( ทันทีชำระ 5% )",
                          groupValue: choice,
                          onChanged: (var value) {
                            setState(() {
                              choice = value;
                            });
                          },
                          title: MyStyle().fonWhite15("( ทันที )"),
                          subtitle: MyStyle().fonWhite15("ชำระ 5%"),
                        ),
                        RadioListTile(
                          activeColor: MyStyle().orangeColor,
                          value: "( 15วันชำระ 6%  )",
                          groupValue: choice,
                          onChanged: (var value) {
                            setState(() {
                              choice = value;
                            });
                          },
                          title: MyStyle().fonWhite15("( 15วัน )"),
                          subtitle: MyStyle().fonWhite15("ชำระ 6%"),
                        ),
                        RadioListTile(
                          activeColor: MyStyle().orangeColor,
                          value: "( 30วัน )",
                          groupValue: choice,
                          onChanged: (var value) {
                            setState(() {
                              choice = value;
                            });
                          },
                          title: MyStyle().fonWhite15("( 30วันชำระ 7% )"),
                          subtitle: MyStyle().fonWhite15("ชำระ 7%"),
                        ),
                        RadioListTile(
                          activeColor: MyStyle().orangeColor,
                          value: "( 45วัน )",
                          groupValue: choice,
                          onChanged: (var value) {
                            setState(() {
                              choice = value;
                            });
                          },
                          title: MyStyle().fonWhite15("( 45วัน )"),
                          subtitle: MyStyle().fonWhite15("ชำระ 8%"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  MyStyle().fonWhite15("จำนวนเงินที่ต้องชำรค่าประกัน:"),
                  const SizedBox(width: 10),
                  MyStyle().fonyellouu25("data"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card textKaset() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screen * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fonyellouu15("กรุณาโอนเงินเข้าบัญชี"),
              const SizedBox(height: 10),
              MyStyle().fonWhite20("บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
              MyStyle().fonWhite15("ธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("สาขาธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("เลขบัญชีธนาคาร xxxxxxxxxxxxxx"),
            ],
          ),
        ),
      ),
    );
  }

  Card text04() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user4 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อ-สกุล ผู้โอน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card text05() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user5 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "จำนวนเงินโอน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card text06() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screen * 0.9,
            height: 35,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user6 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เบอร์โทร:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  //รูปสลีปการโอนเงิน
  Card imageGuarantee() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            width: screen * 8,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: image == null ? MyStyle().showLogo2() : Image.file(image!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: getImagefromGallery1,
                icon: const Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: getImagefromcamera1,
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง
  File? image;
  final picker1 = ImagePicker();
  //ชุดนี้ทำภาพถ่ายรูป
  Future getImagefromcamera1() async {
    // ignore: deprecated_member_use
    final pickedImage1 = await picker1.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage1!.path);
    });
  }

  //ชุดนี้ทำถ่ายรูปภาพ
  Future getImagefromGallery1() async {
    // ignore: deprecated_member_use
    final pickedImage1 = await picker1.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage1!.path);
    });
  }
}
