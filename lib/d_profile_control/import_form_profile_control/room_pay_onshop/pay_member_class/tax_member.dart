import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';

class TaxMember extends StatefulWidget {
  const TaxMember({Key? key}) : super(key: key);

  @override
  _TaxMemberState createState() => _TaxMemberState();
}

class _TaxMemberState extends State<TaxMember> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                  child: MyStyle().fonBack15(
                      "กรุณากรอกรายละเอียดต่อไปนี้ให้ครบถ้วนด้วยครับ")),
              const SizedBox(height: 10),
              textForm1(),
              const SizedBox(height: 10),
              textForm2(),
              const SizedBox(height: 10),
              textForm3(),
              const SizedBox(height: 10),
              textForm4(),
              const SizedBox(height: 10),
              textForm5(),
              const SizedBox(height: 10),
              textForm6(),
              const SizedBox(height: 10),
              choice(),
              const SizedBox(height: 10),
              Center(child: MyStyle().fonBack15("รูปทะเบียนการค้า")),
              const SizedBox(height: 5),
              formImage(),
              const SizedBox(height: 10),
              uploadButton(),
            ],
          ),
        ),
      )),
    );
  }

  //ชื่อบริษัท/ร้าน
  Widget textForm1() {
    return SizedBox(
      height: 30,
      width: screen * 0.8,
      child: TextFormField(
        // maxLines: 2,
        //keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: (value) {
          user1 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "ชื่อบริษัท/ร้าน:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  //สาขา
  Widget textForm2() {
    return SizedBox(
      height: 30,
      width: screen * 0.8,
      child: TextFormField(
        // maxLines: 2,
        //keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: (value) {
          user2 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "สาขา:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  //ชื่อเจ้าของกิจการ
  Widget textForm3() {
    return SizedBox(
      height: 30,
      width: screen * 0.8,
      child: TextFormField(
        // maxLines: 2,
        //keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: (value) {
          user3 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "ชื่อเจ้าของกิจการ:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  //เลขประจำตัวผู้เสียภาษี
  Widget textForm4() {
    return SizedBox(
      height: 30,
      width: screen * 0.8,
      child: TextFormField(
        // maxLines: 2,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: (value) {
          user4 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "เลขประจำตัวผู้เสียภาษี:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  //ที่อยู่
  Widget textForm5() {
    return SizedBox(
      height: 70,
      width: screen * 0.8,
      child: TextFormField(
        maxLines: 2,
        inputFormatters: [LengthLimitingTextInputFormatter(50)],
        onChanged: (value) {
          user5 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "ที่อยู่:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  //เบอร์โทรศัพท์
  Widget textForm6() {
    return SizedBox(
      height: 30,
      width: screen * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: (value) {
          user6 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "เบอร์โทรศัพท์:",
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  // ignore: prefer_typing_uninitialized_variables
  var textChoice;
  Widget choice() {
    return Column(
      children: [
        MyStyle().fonBack15("คุณต้องการให้ส่งเอกสารทาง"),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: "gmail",
          groupValue: textChoice,
          onChanged: (var value) {
            setState(() {
              textChoice = value;
            });
          },
          title: MyStyle().fonBack15("gmail"),
        ),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: "ไปรษณีย์",
          groupValue: textChoice,
          onChanged: (var value) {
            setState(() {
              textChoice = value;
            });
          },
          title: MyStyle().fonBack15("ไปรษณีย์"),
        ),
      ],
    );
  }

  Widget formImage() {
    return Stack(
      children: [
        Container(
          width: screen * 8,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.black12,
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

  //ปุ่มกดส่งข้อมูล
  Widget uploadButton() {
    return TextButton.icon(
      icon: const Icon(
        Icons.save_alt_outlined,
        color: Colors.black54,
      ),
      label: MyStyle().fonBack15("กดส่งข้อมูล"),
      onPressed: () {
        if (image == null) {
          normalDialog(
              context, "ไม่มีรูปสลีป", "กรุณาใส่รูปสลีปการโอนด้วยครับ");
        } else {
          uploadPictureToStorage();
          Navigator.pop(context);
        }
      },
    );
  }

  //เตรียมชุดข้อมูลส่งเข้าไป Firebase ("สมัครสมาชิกรายปี")
  late String user1, user2, user3, user4, user5, user6, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference = firebaseStorage
        .ref()
        .child("ร้านขอใบกำกับภาษีค่าสมาชิกรายปี/product$i.jpg");
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
    map["textChoice"] = textChoice;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("ร้านขอใบกำกับภาษีค่าสมาชิกรายปี")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }
}
