//หน้าขอคืนเงินวางประมูล กรณีประมูลแพ้
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

class RefundAuction extends StatefulWidget {
  const RefundAuction({Key? key}) : super(key: key);

  @override
  _RefundAuctionState createState() => _RefundAuctionState();
}

class _RefundAuctionState extends State<RefundAuction> {
  final List<String> items =
      List<String>.generate(5, (index) => "Item:${++index}");

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
                  Center(child: MyStyle().fonBack15("ขอคืนเงินวางประมูล")),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      MyStyle().fonBack15("รายการสินค้าที่ประมูลไม่ชนะ"),
                      const SizedBox(height: 10),
                      profileMonne(), //รายการที่เข้าร่วมประมูลแล้วแพ้
                      const SizedBox(height: 20),
                      MyStyle().fonBack12(
                          "กรุณากรอกรายละเอียดการขอรับเงินวางมัดจำการประมูลคืนด้วยครับ"),
                      const SizedBox(height: 10),
                      MyStyle().fonBack15(
                          "กรุณากรอกรายละเอียดบัญชีที่ต้องการรับเงินคืนด้วยครับ"),
                      const SizedBox(height: 20),
                      imageRefund01(), //ชื่อบัญชี
                      const SizedBox(height: 15),
                      imageRefund02(), //ชื่อธนาคาร
                      const SizedBox(height: 15),
                      imageRefund03(), //ชื่อสาขาธนาคาร
                      const SizedBox(height: 15),
                      imageRefund04(), //เลขที่บัญชีผู้ขอคืนเงิน
                      const SizedBox(height: 15),
                      imageRefund05(), //จำนวนเงินขอคืน
                      const SizedBox(height: 15),
                      imageRefund06(), //เบอร์โทร
                      const SizedBox(height: 10),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 10),
                      MyStyle().fonBack15(
                          "กรุณากรอกรายละเอียดการวางเงินมัดจำประมูลสินค้าด้วยครับ"),
                      const SizedBox(height: 20),
                      imageRefund07(), //ชื่อ-สกุลผู้โอนเงิน
                      const SizedBox(height: 15),
                      imageRefund08(), //วันที่โอนเงิน
                      const SizedBox(height: 15),
                      imageRefund09(), //เวลาโอนเงิน
                      const SizedBox(height: 15),
                      textRefund10(), //จำนวนเงินที่โอน
                      const SizedBox(height: 20),
                      MyStyle().fonBack15(
                          "รูปสลีปการโอนเงิน (กรุณาส่งรูปที่ภาพชัดเจน)"),
                      const SizedBox(height: 20),
                      imageRefund(), //รูปสลีปโอนเงิน
                      const SizedBox(height: 20),
                      MyStyle().fonBack12(
                          "ส่งข้อมูลแล้วทางแอพจะทำการตรวจสอบและจะทำการโอนเงินคืยภายในไม่เกิน 2 วัน"),
                      const SizedBox(height: 30),
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
                        // ignore: deprecated_member_use
                        child: TextButton.icon(
                          onPressed: () {
                            if (image == null) {
                              normalDialog(context, "ไม่มีรูปสลีป",
                                  "กรุณาใส่รูปสลีปการโอนด้วยครับ");
                            } else {
                              uploadPictureToStorage();

                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                msg:
                                    "ขอบคุณที่เข้าร่วมประมูล\nสินค้าจาก Thai...Kaset Hey ครับ",
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
                            size: 20,
                          ),
                          label:
                              MyStyle().fonWhite20("ส่งข้อมูลเพื่อรับเงินคืน"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //การเตรียม Firebase ("ขอคืนเงินวางมัดจำประมูล")
  late String user1,
      user2,
      user3,
      user4,
      user5,
      user6,
      user7,
      user8,
      user9,
      user10,
      urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("ขอคืนเงินวางมัดจำประมูล/product$i.jpg");
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
    map["user7"] = user7;
    map["user8"] = user8;
    map["user9"] = user9;
    map["user10"] = user10;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("ขอคืนเงินวางมัดจำประมูล")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  SizedBox profileMonne() {
    return SizedBox(
      height: 200,
      child: Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: MyStyle().telColor03,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: MyStyle().orangeColor,
                          radius: 17,
                          child: GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        MyStyle().fonWhite12("ชื่อ:"),
                      ],
                    ),
                    Row(
                      children: [
                        MyStyle().fonWhite12("รายการ:"),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          items[index],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyStyle().fonWhite12("ราคา:"),
                        const SizedBox(width: 5),
                        MyStyle().fonyellouu12("Data:"),
                        const SizedBox(width: 5),
                        MyStyle().fonWhite12("บาท"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //ชื่อบัญชี
  Card imageRefund01() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user1 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อบัญชี:",
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

  //ชื่อธนาคาร
  Card imageRefund02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
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
                labelText: "ชื่อธนาคาร:",
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

  //ชื่อสาขาธนาคาร
  Card imageRefund03() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user3 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อสาขา:",
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

  //เลขที่บัญชีผู้ขอคืนเงิน
  Card imageRefund04() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user4 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เลขบัญชี :",
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

  //จำนวนเงินขอคืน
  Card imageRefund05() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
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
                labelText: "จำนวนเงินขอคืน:",
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

  //เบอร์โทร
  Card imageRefund06() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              autofocus: true,
              onChanged: (value) {
                user6 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เบอร์โทรติดต่อ:",
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

  //ชื่อ-สกุลผู้โอนเงิน
  Card imageRefund07() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user7 = value;
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

  //วันที่โอนเงิน
  Card imageRefund08() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user8 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "วันที่โอน:",
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

  //เวลาโอนเงิน
  Card imageRefund09() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user9 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เวลาโอนเงิน:",
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

  //จำนวนเงินที่โอน
  Card textRefund10() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user10 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "จำนวนเงินที้่โอน:",
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

  //รูปสลีปโอนเงิน
  Card imageRefund() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade400,
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
