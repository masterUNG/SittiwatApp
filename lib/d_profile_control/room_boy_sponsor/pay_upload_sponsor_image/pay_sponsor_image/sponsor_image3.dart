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

class SponsorTwo3 extends StatefulWidget {
  const SponsorTwo3({Key? key}) : super(key: key);

  @override
  _SponsorTwo3State createState() => _SponsorTwo3State();
}

class _SponsorTwo3State extends State<SponsorTwo3> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.pink.shade200,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
      child: Container(
        decoration: BoxDecoration(
          color: MyStyle().telColor03,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            MyStyle().fonWhite15("แบบที่ 3."),
            MyStyle().fonWhite12(
                "โฆษณาขึ้นป๊อบอัพแสดงรูปภาพ ความยาว 10 วินาที เริ่มแสดงหลังจากสตอรี่เดินได้ 10วินาทีแรก (ขึ้นอันลำดับที่ 3)"),
            Card(
              color: Colors.green.shade700,
              child: ExpansionTile(
                backgroundColor: MyStyle().blueColor05,
                title: MyStyle().fonWhite15("เงื่อนไขการลงโฆษณา"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyStyle()
                            .fonWhite15("1).เนื้อหาต้องเป็น ไฟภาพ ขนาดสีเหลี่ยมจตุรัส"),
                        MyStyle().fonWhite15("-ลิ้งโฆษณาจะออก 200 รอบ "),
                        MyStyle().fonWhite15("-ราคาโปรโมชั่นพิเศษ 2,000 บาท"),
                        MyStyle().fonWhite15(
                            "-ลิ้งโฆษณาออกทุกๆครั้งที่มีการกดเผยแพร่จากสมาชิกที่ได้รับสิทธิ์รับโฆษณาจากทางแอพ ครอบคุมทุกสตอรี่ที่โพสของสมาชิกทั้งหมด"),
                        MyStyle().fonWhite15(
                            "-ระยะเวลาโฆษณาของท่านจะเริ่มออกโฆษณาหลังจากนี้อีก 3 วัน และจะหมดลงเมื่อมีการกดเผยแพร่จากสมาชิกจนครบ"),
                        MyStyle().fonWhite15(
                            "(โฆษณาของท่านจะหมดช้าหรือเร็วขึ้นอยู่กับเนื้อหา รูปภาพ ที่ท่านอัปลง และตัวสินค้า ถ้าหมดเร็วแสดงว่ามีสมาชิกให้ความสนใจสูง"),
                        MyStyle().fonWhite15("ขั้นตอนลงโฆษณา"),
                        MyStyle()
                            .fonWhite15("1).ทำการชำระเงินและกรอกข้อมูลให้ครบ"),
                        MyStyle().fonWhite15(
                            "2).ทำการอัปโหลด รูปภาพ ของท่านให้เรียบร้อย"),
                        MyStyle().fonWhite15("3).กดปุ่ม UpLoad ใช้งาน"),
                        MyStyle().fonWhite15(
                            "4).จะมีป๊อบอัปแสดงข้อความเรียบร้อยแล้ว"),
                        MyStyle().fongreen15(
                            "แนะนำ : การคำนวน 2,000 บาท โฆษณาออก 200 ครั้ง \nสมาชิกที่กดได้มีผู้ติดตามไม่น้อยกว่า 1,000 คน"),
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
                                  "จำนวนเงินที่ต้องโอน  2,000 บาท"),
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
                            builText6(), //เวลาที่โอน
                            const SizedBox(height: 5),
                            builImage(), //รูปภาพสลีป
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            showFormPic(), //โชตัวอย่าง
            const SizedBox(height: 10),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().yellouuColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  if (image == null) {
                    normalDialog(
                        context, "รูปภาพสลีป", "กรุณาใส่รูปสลีปการโอนด้วยครับ");
                  } else {
                    uploadPictureToStorage();
                    Navigator.pushNamed(context, "/UploadImage3");
                    Fluttertoast.showToast(
                      msg:
                          "ขอบคุณทีสนับสนุน\nThai..KasetHey\nไป Up Load รูปภาพกันเลย",
                      timeInSecForIosWeb: 7,
                      fontSize: 20,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  }
                },
                icon: const Icon(Icons.touch_app),
                label: MyStyle().fonWhite20("ชำระเงิน/ไปUpLoadภาพ")),
          ],
        ),
      ),
    );
  }

  // การเตรียม Firebase เนื้อหาชุดที่ 1 โฆษณาด้วยภาพ("จ่ายค่าโฆษณาชนิดภาพแบบที่1")
  late String user1, user2, user3, user4, user5, user6, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายค่าโฆษณาชนิดภาพแบบที่3/product$i.jpg");
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
        .collection("จ่ายค่าโฆษณาชนิดภาพแบบที่3")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //โชตัวอย่าง
  Padding showFormPic() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 200,
            child: MyStyle().showLogo1(),
          ),
          Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: image == null
                      ? const Icon(Icons.collections,
                          size: 40, color: Colors.white)
                      : Image.file(image!),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.image,
                    color: Colors.yellowAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
              autofocus: true,
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
              autofocus: true,
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
              autofocus: true,
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

  //เวลาที่โอน
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
              autofocus: true,
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

  //รูปภาพสลีป
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
