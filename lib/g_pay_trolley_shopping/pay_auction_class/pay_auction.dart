//ห้องจ่ายเงินค่าสินค้าประมูลที่ชนะส่งข้อมูลไปที่ kasetBackin04
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

class PayAuction extends StatefulWidget {
  const PayAuction({Key? key}) : super(key: key);

  @override
  _PayAuctionState createState() => _PayAuctionState();
}

class _PayAuctionState extends State<PayAuction> {
  final List<String> items =
      List<String>.generate(5, (index) => "Item:${++index}");
  final formKey = GlobalKey<FormState>();
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
                      child: MyStyle().fonBack15("สินค้าประมูลชนะ/ชำระเงิน")),
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
                      MyStyle().fonBack15("รายการสินค้าที่ประมูลชนะ"),
                      avatarProfileAuction(), //รายการสินค้าที่ประมูลชนะ (ผู้ขาย)
                      const Divider(color: Colors.white),
                      textKaset(), //บัญชีบริษัท
                      const SizedBox(height: 5),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 10),
                      MyStyle().fonBack12(
                          "กรุณาโอนเงินชำระค่าสินค้าคงเหลือภายใน 24 ชม. หลังปิดการประมูล"),
                      const SizedBox(height: 10),
                      MyStyle().fonBack15("กรุณากรอกรายละเอียดด้วยครับ"),
                      const SizedBox(height: 20),
                      imageAuction01(), //ชื่อผู้โอนเงิน
                      const SizedBox(height: 15),
                      imageAuction02(), //จำนวนเงินที่โอน
                      const SizedBox(height: 15),
                      imageAuction03(), //วันที่โอนเงิน
                      const SizedBox(height: 15),
                      imageAuction04(), //เวลาโอนเงิน
                      const SizedBox(height: 15),
                      imageAuction05(), //เบอร์โทร
                      const SizedBox(height: 20),
                      MyStyle().fonBack15("รูปสลีปการโอนเงิน"),
                      MyStyle().fonBack12(
                          "กรุณาถ่ายรูปสลีปการวางมัดจำประมูล คู่กับ สลีปค่าสินค้าประมูลปัจจุบัน ด้วยครับ"),
                      const SizedBox(height: 20),
                      //รูปสลีปการโอนเงิน ชุดที่1
                      imageAuctionOne(),
                      const Divider(color: Colors.white),
                      MyStyle().fonBack15(
                          "กรุณากรอกรายละเอียดการวางเงินมัดจำประมูลสินค้าด้วยครับ"),
                      const SizedBox(height: 20),
                      imageAuction06(), //ชื่อ-สกุล ผู้โอนเงิน
                      const SizedBox(height: 15),
                      imageAuction07(), //วันที่โอนเงิน
                      const SizedBox(height: 15),
                      imageAuction08(), //เวลาโอนเงิน
                      const SizedBox(height: 15),
                      textAuction09(), //ช่องกรอกจำนวนเงินที่โอน
                      const SizedBox(height: 20),

                      MyStyle().fonBack12(
                          "ชำระเงินแล้วทางแอพจะทำการจัดส่งข้อมูลเจ้าของสินค้าและที่ตั้งให้ทางข้อความ"),
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
                        child: TextButton.icon(
                          onPressed: () {
                            if (image == null) {
                              normalDialog(context, "ไม่มีรูปสลีป",
                                  "กรุณาใส่รูปสลีปการโอนเงินด้วยครับ");
                            } else {
                              uploadPictureToStorage();

                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                msg:
                                    "ขอบคุณที่สนับสนุน\nสินค้าจาก Thai...Kaset Hey ครับ",
                                timeInSecForIosWeb: 5,
                                fontSize: 20,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.grey.shade300,
                                textColor: Colors.black,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.touch_app,
                            color: Colors.white,
                            size: 25,
                          ),
                          label: MyStyle().fonWhite20("ส่งข้อมูล ชำระเงิน"),
                        ),
                      ),
                      const SizedBox(height: 40),
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

  //เตรียมชุดข้อมูลส่งเข้าไป Firebase ("จ่ายเงินค่าสินค้าประมูลชนะ")
  late String user1,
      user2,
      user3,
      user4,
      user5,
      user6,
      user7,
      user8,
      user9,
      urlimage;

  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายเงินค่าสินค้าประมูลชนะ/product$i.jpg");
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
    map["image"] = urlimage;

    await FirebaseFirestore.instance
        .collection("จ่ายเงินค่าสินค้าประมูลชนะ")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //รายการสินค้าที่ประมูลชนะ (ผู้ขาย)
  SizedBox avatarProfileAuction() {
    return SizedBox(
      height: 200,
      child: Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
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
                        const SizedBox(
                          width: 5,
                        ),
                        MyStyle().fonyellouu12("Data:"),
                        const SizedBox(
                          width: 5,
                        ),
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

  //บัญชีบริษัท
  Card textKaset() {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fonWhite20("บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
              MyStyle().fonWhite15("ธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("สาขาธนาคาร xxxxxxxxxxxxxx"),
              MyStyle().fonWhite15("เลขบัญชีธนาคาร xxxxxxxxxxxxxx"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyStyle().fonWhite15("จำนวนเงินที่ต้องโอน"),
                  MyStyle().fonyellouu25("Data"),
                  MyStyle().fonWhite15("บาท"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //ชื่อผู้โอนเงิน
  Card imageAuction01() {
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
                labelText: "ชื่อผู้โอน:",
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
  Card imageAuction02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color:Colors.green.shade400,
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
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              autofocus: true,
              onChanged: (value) {
                user2 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "จำนวนเงินที่โอน:",
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
  Card imageAuction03() {
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
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              autofocus: true,
              onChanged: (value) {
                user3 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "วัน-เดือน-ปี :",
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
  Card imageAuction04() {
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
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              autofocus: true,
              onChanged: (value) {
                user4 = value;
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

  //เบอร์โทร
  Card imageAuction05() {
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
                user5 = value;
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

  //รูปสลีปการโอนเงิน ชุดที่1
  Card imageAuctionOne() {
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

  //ชื่อ-สกุล ผู้โอนเงิน
  Card imageAuction06() {
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
                user6 = value;
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
  Card imageAuction07() {
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
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              autofocus: true,
              onChanged: (value) {
                user7 = value;
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
  Card imageAuction08() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color:Colors.green.shade400,
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
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              autofocus: true,
              onChanged: (value) {
                user8 = value;
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

  //ช่องกรอกจำนวนเงินที่โอน
  Card textAuction09() {
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
              inputFormatters: [LengthLimitingTextInputFormatter(8)],
              autofocus: true,
              onChanged: (value) {
                user9 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "จำนวนเงินที่โอน:",
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

  //ชุดบน ###########################################
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
  //สิ้นสุดชุดบน ####################################################

  // //ชุดล่าง ########################################################
  // //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง
  // File? file;
  // final picker1 = ImagePicker();
  // //ชุดนี้ทำภาพถ่ายรูป
  // Future getImagefromcamera1() async {
  //   // ignore: deprecated_member_use
  //   final pickedImage1 = await picker1.getImage(source: ImageSource.camera);
  //   setState(() {
  //     file = File(pickedImage1!.path);
  //   });
  // }

  // //ชุดนี้ทำถ่ายรูปภาพ
  // Future getImagefromGallery1() async {
  //   // ignore: deprecated_member_use
  //   final pickedImage1 = await picker1.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     file = File(pickedImage1!.path);
  //   });
  // }
  // //สิ้นสุดชุดล่าง ####################################################
}
