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

class SponsorOne5 extends StatefulWidget {
  const SponsorOne5({Key? key}) : super(key: key);

  @override
  _SponsorOne5State createState() => _SponsorOne5State();
}

class _SponsorOne5State extends State<SponsorOne5> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.deepPurple.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            MyStyle().fonWhite15("แบบที่ 5."),
            MyStyle().fonWhite12("โฆษณาขึ้นต้นก่อน vdo ความยาว 7 วินาที"),
             MyStyle().fonWhite12("แสดงไปพร้อมๆกับคลิปVdoหลักด้านบนแต่ไม่มีเสียง"),
            Card(
              color: Colors.black26,
              child: ExpansionTile(
                backgroundColor: MyStyle().blueColor05,
                title: MyStyle().fonWhite15("เงื่อนไขการลงโฆษณา"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyStyle().fonWhite15(
                            "1).เนื้อหาต้องเป็น Vdo ความยาวไม่เกิน 30 วินาที"),
                        MyStyle().fonWhite15("-ลิ้งโฆษณาจะออก 50 รอบ "),
                        MyStyle().fonWhite15("-ราคาโปรโมชั่นพิเศษ 3,800 บาท"),
                         MyStyle().fonWhite15("-ลิ้งโฆษณาจะออก ช่วงกลางคลิป "),
                        MyStyle().fonWhite15(
                            "-ลิ้งโฆษณาออกทุกๆครั้งที่มีการกดเผยแพร่จากสมาชิกที่ได้รับสิทธิ์รับโฆษณาจากทางแอพ ครอบคุมทุกสตอรี่ที่โพสของสมาชิกทั้งหมด"),
                        MyStyle().fonWhite15(
                            "-ระยะเวลาโฆษณาของท่านจะเริ่มออกโฆษณาหลังจากนี้อีก 3 วัน และจะหมดลงเมื่อมีการกดเผยแพร่จากสมาชิกจนครบ"),
                        MyStyle().fonWhite15(
                            "(โฆษณาของท่านจะหมดช้าหรือเร็วขึ้นอยู่กับเนื้อหา Vdo ที่ท่านอัปลง และตัวสินค้า ถ้าหมดเร็วแสดงว่ามีสมาชิกให้ความสนใจสูง"),
                        MyStyle().fonWhite15("ขั้นตอนลงโฆษณา"),
                        MyStyle()
                            .fonWhite15("1).ทำการชำระเงินและกรอกข้อมูลให้ครบ"),
                        MyStyle().fonWhite15(
                            "2).ทำการอัปโหลด vdo ของท่านให้เรียบร้อย"),
                        MyStyle().fonWhite15("3).กดปุ่ม UpLoad ใช้งาน"),
                        MyStyle().fonWhite15(
                            "4).จะมีป๊อบอัปแสดงข้อความเรียบร้อยแล้ว"),
                        MyStyle().fongreen15(
                            "แนะนำ : การคำนวน 3,800 บาท โฆษณาออก 50 ครั้ง \nสมาชิกที่กดได้มีผู้ติดตามไม่น้อยกว่า 1,000 คน"),
                        const Divider(color: Colors.red, height: 5),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyStyle()
                                  .fonWhite20("บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
                              MyStyle().fonWhite15("ธนาคาร xxxxxxxxxxxxxx"),
                              MyStyle().fonWhite15("สาขาธนาคาร xxxxxxxxxxxxxx"),
                              MyStyle()
                                  .fonWhite15("เลขบัญชีธนาคาร xxxxxxxxxxxxxx"),
                              MyStyle().fonorange15(
                                  "จำนวนเงินที่ต้องโอน  3,800 บาท"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            builText1(), //ชื่อผู้โอน
                            const SizedBox(height: 5),
                            builText2(), //ที่อยู่
                            const SizedBox(height: 5),
                            builText3(), //เบอ์โทรศัพท์
                            const SizedBox(height: 5),
                            builText4(), //จำนวนเงินที่โอน
                            const SizedBox(height: 5),
                            builText5(), //วันที่โอน
                            const SizedBox(height: 5),
                            builText6(), //เวลาโอนเงิน
                            const SizedBox(height: 5),
                            builImage(), //แสดงรูปสลีป
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            builVdo(), //แสดงภาพ VDO
            const SizedBox(height: 5),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().yellouuColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (image == null) {
                    normalDialog(
                        context, "รูปภาพสลีป", "กรุณาใส่รูปสลีปการโอนด้วยครับ");
                  } else {
                    uploadPictureToStorage();
                    Navigator.pushNamed(context, "/UploadVdo5");
                    Fluttertoast.showToast(
                      msg:
                          "ขอบคุณทีสนับสนุน\nThai..KasetHey\nข้อมูล Up Load เสร็จแล้ว",
                      timeInSecForIosWeb: 7,
                      fontSize: 20,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  }
                },
                icon: const Icon(Icons.touch_app),
                label: MyStyle().fonWhite20("กดชำระเงิน/ไป Up Load Vdo")),
          ],
        ),
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
        firebaseStorage.ref().child("จ่ายค่าโฆษณาVDOแบบที่5/product$i.jpg");
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
        .collection("จ่ายค่าโฆษณาVDOแบบที่5")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //ชื่อผู้โอน
  Card builText1() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user1 = value;
              },
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "ชื่อผู้โอน :",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //ที่อยู่
  Card builText2() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user2 = value;
              },
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "ที่อยู่ :",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //เบอ์โทรศัพท์
  Card builText3() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user3 = value;
              },
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.perm_phone_msg,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "เบอ์โทรศัพท์:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //จำนวนเงินที่โอน
  Card builText4() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user4 = value;
              },
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.money,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "จำนวนเงินที่โอน:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //วันที่โอน
  Card builText5() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user5 = value;
              },
              keyboardType: TextInputType.datetime,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.brightness_medium,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "วันที่โอน:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //เวลาโอนเงิน
  Card builText6() {
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
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.8,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              onChanged: (value) {
                user6 = value;
              },
              keyboardType: TextInputType.datetime,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.access_alarm_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "เวลาที่โอน:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //แสดงรูปสลีป
  Card builImage() {
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
                onPressed: getImagefromGallery,
                icon: const Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: getImagefromcamera,
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

  //แสดงภาพ VDO
  Card builVdo() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: screen * 0.6,
        child: image == null
            ? const Icon(
                Icons.play_circle_outlined,
                color: Colors.black38,
                size: 70,
              )
            : Image.file(image!),
      ),
    );
  }

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
}
