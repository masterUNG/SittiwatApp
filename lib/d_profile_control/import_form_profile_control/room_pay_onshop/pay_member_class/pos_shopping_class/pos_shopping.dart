//ห้องโพสขายสินค้าทั่วไป ส่งข้อมูลไปเก็บที่ Firebase และส่งไปที่ห้องระบบหลังบ้านที่่ KasetBackin02
// ignore_for_file: prefer_typing_uninitialized_variables

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

class PosShopping extends StatefulWidget {
  const PosShopping({Key? key}) : super(key: key);

  @override
  _PosShoppingState createState() => _PosShoppingState();
}

class _PosShoppingState extends State<PosShopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showAvatar(),
                const SizedBox(height: 10),
                builImage(), //กรอบใส่รูปภาพ
                const SizedBox(height: 15),
                builIconAndText(), //แถวปุ่ม กล้อง
                const SizedBox(height: 15),
                builText(), //แถวใส่ชื่อ ราคา สินค้ารายละเอียดสินค้า
                const SizedBox(height: 15),
                builChoice(), //แถวปุ่มกดเลือกประเภทสินค้า
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade700,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    width: 200,
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.touch_app,
                        color: Colors.white,
                      ),
                      label: MyStyle().fonWhite20("โพสทันที"),
                      onPressed: () {
                        if (image == null) {
                          normalDialog(context, "ไม่มีรูปภาพ",
                              "กรุณาใส่รูปสินค้าด้วยครับ");
                        }
                        if (choice == null) {
                          normalDialog(context, "ประเภทสินค้า",
                              "กรุณากดเลือกระบุประเภทของสินค้าด้วยครับ\nผู้ซื้อจะหาสินค้าของท่านง่ายขึ้นครับ");
                        } else {
                          uploadPictureToStorage();
                          Navigator.pop(context);
                          Fluttertoast.showToast(
                            msg: "ขอให้สินค้าขายได้เยอะนะครับ",
                            timeInSecForIosWeb: 5,
                            fontSize: 20,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.grey.shade300,
                            textColor: Colors.black,
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //ชุดข้อมูลการโพสขายสินค้าที่ (1)###################################################################
   var choice;
  late String  user1, user2, user3, user4, urlimage;
   Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("ห้องโพสต์ขายสินค้า/product$i.jpg");
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
    map["choice"] = choice;
    map["user1"] = user1;
    map["user2"] = user2;
    map["user3"] = user3;
    map["user4"] = user4;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("ห้องโพสต์ขายสินค้า")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //แถวปุ่มกดเลือกประเภทสินค้า
  Card builChoice() {
    return Card(
      color: Colors.yellow.shade200,
      child: ExpansionTile(
        backgroundColor: MyStyle().telColor02,
        title: MyStyle().fonBack15("เลือกประเภทสินค้าที่ขายด้วยครับ:"),
        children: [
          Column(
            children: [
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวนผลไม้",
                groupValue: choice,
                onChanged: (value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สวนผลไม้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวนผัก",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สวนผัก"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "อาหาร",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("อาหาร"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ปศุสวัตว์",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("ปศุสวัตว์"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวัตว์เลี้ยง",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สวัตว์เลี้ยง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าชุมชน",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าชุมชน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "งานแฮนเมค",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("งานแฮนเมค"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เครื่องเกษตร",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("เครื่องเกษตร"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "กล้าไม้",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("กล้าไม้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พระเครื่อง",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("พระเครื่อง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "แฟชั่น",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("แฟชั่น"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "บ้าน-ที่ดิน",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("บ้าน-ที่ดิน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้ามือสอง",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้ามือสอง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เฟอร์นิเจอร์",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("เฟอร์นิเจอร์"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าทั่วไป",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าทั่วไป"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าใกล้ตัว",
                groupValue: choice,
                onChanged: (var value) {
                  setState(() {
                    choice = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าใกล้ตัว"),
              ),
            ],
          )
        ],
      ),
    );
  }

  //แถวใส่ชื่อ ราคา สินค้ารายละเอียดสินค้า
  Column builText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 200,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(15)],
            onChanged: (value) {
              user1 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.white38,
              ),
              labelText: "ชื่อสินค้า:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 30,
          width: 200,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(8)],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              user3 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.white38,
              ),
              labelText: "ราคา:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 30,
          width: 200,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(4)],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              user4 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.white38,
              ),
              labelText: "มีจำนวนสินค้า: /ชิ้น",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 300,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            maxLines: 2,
            onChanged: (value) {
              user2 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.white38,
              ),
              labelText: "รายละเอียด:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }

  //แถวปุ่ม กล้อง
  Row builIconAndText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.add_photo_alternate,
            color: Colors.white,
            size: 20,
          ),
          onPressed: getImagefromGallery,
        ),
        IconButton(
          icon: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          ),
          onPressed: getImagefromcamera,
        ),
      ],
    );
  }

  //กรอบใส่รูปภาพ
  Padding builImage() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: image == null ? MyStyle().showLogo() : Image.file(image!),
        ),
      ),
    );
  }

  //รูปโปรไฟและชื่อ รหัส
  Row showAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: MyStyle().greenColor,
          radius: 27,
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        const Expanded(child: ProfileNameGmail()),
      ],
    );
  }

  //ชุดควบคุม Firebaese และการทำรูปภาพ โซนที่ (1)#########################################

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง
  File? image;
  final picker = ImagePicker();
  //ชุดนี้ทำภาพถ่ายรูป
  Future getImagefromcamera() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  //ชุดนี้ทำถ่ายรูปภาพ
  Future getImagefromGallery() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }
  //สิ้นสุดโซนที่ (1)#######################################################################
  //สิ้นสุดชุดข้อมูลการโพสขายสินค้าที่ (1)###################################################################

}
