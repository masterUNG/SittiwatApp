//ห้องสมัครสมาชิกรายปีขายสินค้าทั่วไป-ห้องเปิดประมูลสินค้า ส่งข้อมูลไปเก็บที่ Firebase และส่งไปที่ห้องระบบหลังบ้านที่่ KasetBackin01
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

class PayMember extends StatefulWidget {
  const PayMember({Key? key}) : super(key: key);

  @override
  _PayMemberState createState() => _PayMemberState();
}

class _PayMemberState extends State<PayMember> {
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
                    Colors.green.shade900,
                    //Colors.greenAccent,
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
                      child: MyStyle().fonWhite15("สมัครสมาชิกรายปี/ชำระเงิน")),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        formKaset(), //เงื่อนไข
                        const SizedBox(height: 15),
                        monneKaset(), //บัญชีบริษัท
                        const SizedBox(height: 15),
                        qrCord(), //แสดงคิวอาโค๊ดเพื่อแสกนการจ่ายเงิน
                        const SizedBox(height: 15),
                        textMember01(), //ชื่อผู้โอน
                        const SizedBox(height: 15),
                        textMember02(), //จำนวนเงินที่โอน
                        const SizedBox(height: 15),
                        textMember03(), //วันที่โอนเงิน
                        const SizedBox(height: 15),
                        textMember04(), //เวลาโอนเงิน
                        const SizedBox(height: 15),
                        textMember05(), //เบอร์โทร
                        const SizedBox(height: 20),
                        MyStyle().fonBack15("รูปสลีปการโอนเงิน"),
                        const SizedBox(height: 20),
                        imageMember(), //สลีปการโอนเงิน
                        const SizedBox(height: 20),
                        MyStyle().fonBack15(
                            "กรุณาระบุบัญชีของท่านเพื่อผูกไว้กับทางแอพ Kaset Hey"),
                        MyStyle().fonBack15(
                            "กรณีขายสินค้าได้ทางแอพจะทำการโอนเงินเข้าบัญชีทีท่านกรอกนี้"),
                        const SizedBox(height: 15),
                        textMember11(), //ชื่อร้าน/สวน
                        const SizedBox(height: 15),
                        textMember12(), //ชื่อ-สกุล
                        const SizedBox(height: 15),
                        textMember13(), //รหัส ร้าน/สวน
                        const SizedBox(height: 15),
                        textMember14(), //ที่อยู่
                        const SizedBox(height: 15),
                        choicetest(), //ช้อยตักเลือก
                        const SizedBox(height: 15),
                        textMember06(), //ชื่อบัญชี
                        const SizedBox(height: 15),
                        textMember07(), //ชื่อธนาคาร
                        const SizedBox(height: 15),
                        textMember08(), //สาขาธนาคาร
                        const SizedBox(height: 15),
                        textMember09(), //เลขบัญชี
                        const SizedBox(height: 15),
                        textMember10(), //เบอร์โทร
                        const SizedBox(height: 20),
                        Center(
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            color: Colors.green.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: InkWell(
                              onTap: () {
                                if (image == null) {
                                  normalDialog(context, "ไม่มีรูปสลีป",
                                      "กรุณาใส่รูปสลีปการโอนด้วยครับ");
                                } else {
                                  uploadPictureToStorage();
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                    msg: "ขอบคุณที่ให้การสนับสนุนครับ",
                                    timeInSecForIosWeb: 5,
                                    fontSize: 20,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                  );
                                }
                              },
                              child: SizedBox(
                                width: screen * 0.9,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      //height: 30,
                                      width: screen * 0.6,
                                      child: Center(
                                        child:
                                            MyStyle().fonWhite25("ส่งข้อมูล"),
                                      ),
                                      decoration: BoxDecoration(
                                        color: MyStyle().orangeColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(80.0),
                                          topLeft: Radius.circular(80.0),
                                          bottomRight: Radius.circular(200.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.touch_app,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: prefer_typing_uninitialized_variables
  var choice, choice1;
  //เตรียมชุดข้อมูลส่งเข้าไป Firebase ("สมัครสมาชิกรายปี")
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
      user11,
      user12,
      user13,
      user14,
      urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("สมัครสมาชิกรายปี/product$i.jpg");
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
    map["user11"] = user11;
    map["user12"] = user12;
    map["user13"] = user13;
    map["user14"] = user14;
    map["choice"] = choice;
    map["choice1"] = choice1;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("สมัครสมาชิกรายปี")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //เงื่อนไข
  Card formKaset() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.grey.shade300,
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
            bottomRight: Radius.circular(200),
          ),
        ),
        child: ExpansionTile(
          backgroundColor: Colors.grey.shade300,
          title: MyStyle()
              .fonWhite15("เงื่อนไขการจำหน่ายสินค้าและบริการต่างๆ >>>"),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyStyle().fonBack12(
                      "1).เงื่อนไขการขายสินค้า\n-สินค้าที่นำออกจำหน่ายต้องเป็นสินค้าที่ถูกต้องตามกฎหมาย"),
                  MyStyle().fonBack12(
                      "-สินค้าที่นำออกจำหน่ายต้องเป้นสินค้าของท่านเองหรือสินค้าชุมชนคนรู้จัก ห้ามมิให้จำหน่ายสินค้าที่เป็นตัวแทนหรือนายหน้าของบริษัทต่างๆโดยเด็ดขาด"),
                  MyStyle().fonBack12(
                      "2).เงื่อนไขการส่งสินค้า\n-เมื่อมีลูกค้ากดสั่งซื้อสินค้าแล้งทางแอพจะทำการสั่ง order สินค้าไปยังท่านพร้อมที่อยู่ลูกค้าในการจัดส่งสินค้า (สามารถเช็คได้จากห้องOrder)"),
                  MyStyle().fonBack12(
                      "-ท่านจะต้องส่งสินค้าออกจากท่านภายใน3วันหลังจากได้รับorderจากทางแอพ"),
                  MyStyle().fonBack12(
                      "3).การชำระเงินค่าสินค้า\n-หลังจากส่งสินค้าถึงมือลูกค้าแล้วและมีการกดรับสินค้าทางแอพจะทำการตัดยอดบัญชีสินค้าของท่าน"),
                  MyStyle().fonBack12(
                      "-ทางแอพจะจ่ายเงินค่าสินค้าเข้าไปยังบัญชีของท่านที่ระบุไว้ให้กับทางแอพทางด้านล่างนี้"),
                  MyStyle().fonBack12(
                      "-ทางแอพจะทำการจ่ายเงินค่าสินค้าให้ท่านทุกๆวันที่ 1-3 , 16-18 ของเดือน ขึ้นอยูที่ท่านส่งสินค้าถึงมือลูกค้าตกอยู่ในรอบใด"),
                  MyStyle().fonBack12(
                      "4).ค่าบริการ\n-เมื่อท่านจำหน่ายสินค้าได้ทางแอพเก็บค่าบริการ3%จากยอดขายสินค้าชิ้นนั้นๆ"),
                  MyStyle().fonBack12(
                      "5).บริการเสริมฟรี\n-หากท่านเข้าเงื่อนไขการเปิดรับโฆษณาท่านสามารถยิงโฆษณาของท่านได้(จะอยูในห้องส่วนการเปิดรับโฆษณา)"),
                  MyStyle().fonBack12(
                      "-เมื่อท่านเริ่มโพสขายสินค้าไปสักระยะจะมีทีมงานทางแอพเข้าไปช่วยเหลือและแนะนำเทคนิคต่างๆเพื่อ่พิ่มยอดขายให้ท่าน(ส่งเสริมการขายแนะนำฟรี)"),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.red),
                  const SizedBox(height: 10),
                  MyStyle().fonyellouu12(
                      "เงื่อนไขต่างๆด้านบนนี้ทางแอพขอสงวนในการเปลียนแปลงแก้ไขโดยไม่ต้องแจ้งให้ท่านทราบล่วงหน้าและเมื่อท่านกดสมัคร/ส่งข้อมูลแล้วทางแอพจะถือว่าท่านได้อ่านเนื้อหาเป็นที่เข้าใจแล้ว"),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //บัญชีบริษัท
  Card monneKaset() {
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
          // color: MyStyle().greenColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fonWhite15("บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
              MyStyle().fonWhite15("ธนาคาร:"),
              MyStyle().fonWhite15("ธนาคารสาขา:"),
              MyStyle().fonWhite15("เลขที่บัญชี:"),
              MyStyle().fonWhite15("จำนวนเงินสมัครสมาชิกรายปี:1500 บาท"),
              MyStyle().fonyellouu15("ใช้ได้ 1 ปี 50ห้อง:"),
            ],
          ),
        ),
      ),
    );
  }

  Widget qrCord() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        width: screen * 0.9,
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyStyle().fonWhite15("แสกนคิวอาร์โค๊ด"),
            ],
          ),
        ),
      ),
    );
  }

  //ชื่อผู้โอน
  Card textMember01() {
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
  Card textMember02() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
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
  Card textMember03() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
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
  Card textMember04() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
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
  Card textMember05() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
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

//ชื่อร้าน/สวน
  Card textMember11() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user11 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อร้าน/สวน:",
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

  //ชื่อ-สกุล
  Card textMember12() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user12 = value;
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

//รหัส ร้าน/สวน
  Card textMember13() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user13 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "รหัสสมาชิก ร้าน/สวน:",
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

//ที่อยู่
  Card textMember14() {
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
            height: 40,
            width: screen * 0.9,
            child: TextFormField(
              maxLines: 2,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              autofocus: true,
              onChanged: (value) {
                user14 = value;
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

  Widget choicetest() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyStyle().fonyellouu15("เลือกสถานะ"),
            RadioListTile(
              activeColor: MyStyle().orangeColor,
              value: "ฉันเป็นเจ้าของสินค้าเอง",
              groupValue: choice,
              onChanged: (var value) {
                setState(() {
                  choice = value;
                });
              },
              title: MyStyle().fonWhite12("ฉันเป็นเจ้าของสินค้าเอง"),
            ),
            RadioListTile(
              activeColor: MyStyle().orangeColor,
              value: "ฉันซื้อสินค้ามาขายเอง",
              groupValue: choice,
              onChanged: (var value) {
                setState(() {
                  choice = value;
                });
              },
              title: MyStyle().fonWhite12("ฉันซื้อสินค้ามาขายเอง"),
            ),
            RadioListTile(
              activeColor: MyStyle().orangeColor,
              value: "ฉันเป็นตัวแทนจำหน่าย",
              groupValue: choice,
              onChanged: (var value) {
                setState(() {
                  choice = value;
                });
              },
              title: MyStyle().fonWhite12("ฉันเป็นตัวแทนจำหน่าย"),
            ),
            RadioListTile(
              activeColor: MyStyle().orangeColor,
              value: "ฉันเป็นพนักงานของเจ้าของสินค้า",
              groupValue: choice,
              onChanged: (var value) {
                setState(() {
                  choice = value;
                });
              },
              title: MyStyle().fonWhite12("ฉันเป็นพนักงานของเจ้าของสินค้า"),
            ),

            // MyStyle()
            //     .fonyellouu15("ท่านต้องการใบกำกับภาษีค่าสมาชิกด้วยหรือไม่"),
            // RadioListTile(
            //   activeColor: MyStyle().orangeColor,
            //   value: "ฉันต้องการ",
            //   groupValue: choice1,
            //   onChanged: (var value) {
            //     setState(() {
            //       choice1 = value;
            //     });
            //     Navigator.pushNamed(context, "/TaxMember");
            //   },
            //   title: MyStyle().fonWhite12("ฉันต้องการ"),
            // ),
            // RadioListTile(
            //   activeColor: MyStyle().orangeColor,
            //   value: "ฉันไม่ต้องการ",
            //   groupValue: choice1,
            //   onChanged: (var value) {
            //     setState(() {
            //       choice1 = value;
            //     });
            //   },
            //   title: MyStyle().fonWhite12("ฉันไม่ต้องการ"),
            // ),
          ],
        ),
      ),
    );
  }

  //ชื่อบัญชี
  Card textMember06() {
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
  Card textMember07() {
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
                labelText: "ธนาคาร:",
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

  //สาขาธนาคาร
  Card textMember08() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user8 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ธนาคารสาขา:",
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

  //เลขบัญชี
  Card textMember09() {
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
                labelText: "เลขที่บัญชี:",
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
  Card textMember10() {
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
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user10 = value;
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

  //รูปสลีปการโอนเงิน
  Card imageMember() {
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
