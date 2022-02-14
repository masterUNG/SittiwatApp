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

class PayShopping extends StatefulWidget {
  const PayShopping({Key? key}) : super(key: key);

  @override
  _PayShoppingState createState() => _PayShoppingState();
}

class _PayShoppingState extends State<PayShopping> {
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
      // backgroundColor: MyStyle().telColor03,
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
                      child: MyStyle().fonBack15("เช็ครายการสินค้า/ชำระเงิน")),
                  const SizedBox(height: 10)
                ],
              ),
            ),
           
           
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      textManneShop(), //ช่องแสดงรายการสินค้าที่กดสั่งซื้อ (ผู้ขาย)
                      const SizedBox(height: 15),
                      textKaset(), //บัญชีบริษัท
                      
                      const SizedBox(height: 10),
                      MyStyle().fonBack15("กรุณากรอกรายละเอียดด้วยครับ"),
                      const SizedBox(height: 20),
                      textShop01(), //ช่องกรอกชื่อ-สกุล ผู้โอนเงิน
                      const SizedBox(height: 15),
                      textShop02(), //ช่องกรอกจำนวนเงินที่โอน
                      const SizedBox(height: 15),
                      textShop03(), //ช่องกรอกวันที่โอนเงิน
                      const SizedBox(height: 15),
                      textShop04(), //เวลาโอนเงิน
                      const SizedBox(height: 15),
                      textShop05(), //ช่องกรอกเบอร์โทรศัพ
                      const SizedBox(height: 20),
                      MyStyle().fonBack12("รูปสลีปการโอนเงิน"),
                      const SizedBox(height: 20),
                      imageShop(), //ใส่รูปสลิปโอนเงิน
                      const SizedBox(height: 20),
                      MyStyle().fonBack15(
                          "กรุณากรอกรายละเอียดสถานที่จัดส่งสินค้าด้วยครับ"),
                      const SizedBox(height: 20),
                      textShop06(), //ช่องกรอกชื่อ-สกุล
                      const SizedBox(height: 15),
                      textShop07(), //ช่องกรอกที่อยู่
                      const SizedBox(height: 15),
                      textShop08(), //ช่องกรอกเบอร์โทรศัพ
                      // const SizedBox(height: 15),
                      // textShop09(), //ช่องกรอกรายละเอียดเพิ่มเติม
                      const SizedBox(height: 20),

                      Container(
                        width: screen * 0.6, height: 40,
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
                              normalDialog(context, "ไม่มีรูปภาพ",
                                  "กรุณาใส่รูปสลีปการโอนด้วยครับ");
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
                          label: MyStyle().fonWhite20("ส่งข้อมูล สั่งซื้อ"),
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

  //การเตรียม Firebase ("จ่ายเงินค่าสินค้าทั่วไป")
  late String user1, user2, user3, user4, user5, user6, user7, user8, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายเงินค่าสินค้าทั่วไป/product$i.jpg");
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
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("จ่ายเงินค่าสินค้าทั่วไป")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //ช่องแสดงรายการสินค้าที่กดสั่งซื้อ (ผู้ขาย)
  SizedBox textManneShop() {
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        MyStyle().fonWhite12("ชื่อ:"),
                      ],
                    ),
                    Row(
                      children: [
                        MyStyle().fonWhite12("รายการ:"),
                        const SizedBox(width: 5),
                        Text(
                          items[index],
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.orange,
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

  //บัญชีบริษัท
  Card textKaset() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color:Colors.green.shade400,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      )),
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

  //ช่องกรอกชื่อ-สกุล ผู้โอนเงิน
  Card textShop01() {
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

  //ช่องกรอกจำนวนเงินที่โอน
  Card textShop02() {
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
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
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

  //ช่องกรอกวันที่โอนเงิน
  Card textShop03() {
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
              inputFormatters: [LengthLimitingTextInputFormatter(12)],
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
  Card textShop04() {
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

  //ช่องกรอกเบอร์โทรศัพ
  Card textShop05() {
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

  //ใส่รูปสลิปโอนเงิน
  Card imageShop() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color:Colors.green.shade400,
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

  //ช่องกรอกชื่อ-สกุล
  Card textShop06() {
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
                labelText: "ชื่อ-สกุล:",
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

  //ช่องกรอกที่อยู่
  Card textShop07() {
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
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              autofocus: true,
              onChanged: (value) {
                user7 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ที่อยู่:",
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

  //ช่องกรอกเบอร์โทรศัพ
  Card textShop08() {
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
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              autofocus: true,
              onChanged: (value) {
                user8 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เบอร์โทรศัพท์:",
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
