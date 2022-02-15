// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile_uid.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/utility/my_dialog.dart';

class Signup01 extends StatefulWidget {
  const Signup01({Key? key}) : super(key: key);

  @override
  _Signup01State createState() => _Signup01State();
}

class _Signup01State extends State<Signup01> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/video/backgroundloing.jpg"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
            behavior: HitTestBehavior.opaque,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  avatarProfile(), //รูปสมาชิก
                  const SizedBox(height: 15),
                  builType(), //ตัวเลือกผู้ซื้อ-ผู้ขาย
                  const SizedBox(height: 10),
                  form01(), //ชื่อผู้สมัคร
                  const SizedBox(height: 10),
                  form02(), //รหัส ไปรษณีย์ cord
                  const SizedBox(height: 10),
                  form03(), //รหัส email
                  const SizedBox(height: 10),
                  form04(), //รหัส password
                  const SizedBox(height: 15),
                  SizedBox(
                    width: screen * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () {
                        if ((name?.isEmpty ?? true) ||
                            (cord?.isEmpty ?? true) ||
                            (user?.isEmpty ?? true) ||
                            (password?.isEmpty ?? true)) {
                          print("Have Space มีช่องว่างไม่ได้กรอกรายละเอียด");
                          normalDialog(context, "มีช่องว่าง",
                              "กรุณากรอกรายละเอียดให้ครบด้วยครับ");
                        } else if (typeUser == null) {
                          normalDialog(context, "กดเลือกสถานะ",
                              "กรุณากดเลือกสถานะ \nผู้ซื้อ หรือ ผู้ขาย ด้วยครับ");
                        } else if (_imageFile == null) {
                          normalDialog(context, "Profile",
                              "กรุณาใส่รูปโปรไฟร์ด้วยครับ\nเป็นรูปตัวบุคคลนะครับ");
                        } else {
                          createAccountAndInformation();
                        }
                      },
                      child: MyStyle().fongreen25("Sign up"),
                    ),
                  ),
                  const SizedBox(height: 180),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/login"),
        child: MyStyle().fonorange12(
          "ลงชื่อเพื่อเข้าใช้งานแอพ Kaset Hey\n<<<(Login)ย้อนกลับ",
        ),
      ),
    );
  }

  Center avatarProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.green.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.green.shade900,
              backgroundImage:
                  _imageFile == null ? null : FileImage(_imageFile!),
            ),
          ),
          Positioned(
            bottom: 0.5,
            right: 0.5,
            child: IconButton(
              iconSize: 24,
              color: Colors.black,
              icon: const Icon(Icons.image_outlined),
              onPressed: _takePicture,
            ),
          ),
        ],
      ),
    );
  }

  Card builType() {
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
              MyStyle().fonWhite15("คุณสมัครในฐานะ"),
              const SizedBox(height: 10),
              SizedBox(
                height: 30,
                width: screen * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: MyStyle().orangeColor,
                          value: "shop",
                          groupValue: typeUser,
                          onChanged: (var value) {
                            setState(() {
                              typeUser = value;
                            });
                          },
                        ),
                        MyStyle().fonWhite12("( ผู้ซื้อ )")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: MyStyle().orangeColor,
                          value: "user",
                          groupValue: typeUser,
                          onChanged: (var value) {
                            setState(() {
                              typeUser = value;
                            });
                          },
                        ),
                        MyStyle().fonWhite12("( ผู้ขาย )")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card form01() {
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
              onChanged: (volue) => name = volue.trim(),
              validator:
                  RequiredValidator(errorText: "กรุณากรอก Name ด้วยครับ"),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                hintText: "Name:",
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card form02() {
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
              onChanged: (volue) => cord = volue.trim(),
              keyboardType: TextInputType.number,
              validator: RequiredValidator(
                  errorText: "กรุณากรอก รหัสไปรษณีย์ ด้วยครับ"),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "รหัสไปรษณีย์:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card form03() {
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
              onChanged: (volue) => user = volue.trim(),
              keyboardType: TextInputType.emailAddress,
              validator: MultiValidator([
                EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้องครับ"),
                RequiredValidator(errorText: "กรุณากรอก Email ด้วยครับ"),
              ]),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Email:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card form04() {
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
              onChanged: (volue) => password = volue.trim(),
              keyboardType: TextInputType.number,
              obscureText: true,
              validator:
                  RequiredValidator(errorText: "กรุณากรอก Password ด้วยครับ"),
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.lock_clock_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Password:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //ชุดทำรูปภาพโปรไฟ
  File? _imageFile;
  void _takePicture() async {
    final _picker = ImagePicker();
    // ignore: deprecated_member_use
    final _pickedImage = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    setState(() {
      _imageFile = File(_pickedImage!.path);
    });
  }
  //สิ้นสุด--#######

  var typeUser, name, cord, user, password;
  Future<void> createAccountAndInformation() async {
    MyDialog(context: context).alertDialogPorcess();

    String nameProfile = 'profile${Random().nextInt(1000000)}.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference =
        firebaseStorage.ref().child('profileImage/$nameProfile');
    UploadTask uploadTask = reference.putFile(_imageFile!);
    await uploadTask.whenComplete(() async {
      await reference.getDownloadURL().then((value) async {
        String urlProfile = value.toString();

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: user, password: password)
            .then((value) async {
          String uid = value.user!.uid;

          await FirebaseFirestore.instance
              .collection('user')
              .get()
              .then((value) async {
            if (value.docs.isEmpty) {
              cord = '$cord/1';
            } else {
              int i = value.docs.length + 1;
              cord = '$cord/$i';
            }

            UserModel model = UserModel(
              email: user,
              name: name,
              typeuser: typeUser,
              cord: cord,
              urlProfile: urlProfile,
            );
            Map<String, dynamic> data = model.toMap();

            await FirebaseFirestore.instance
                .collection("user")
                .doc(uid)
                .set(data)
                .then((value) {
              // print("ไปที่ Firestore สำเร็จ");
              Navigator.pop(context);
              switch (typeUser) {
                case "shop":
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/story", (route) => false);
                  break;
                case "user":
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/persnal", (route) => false);
                  break;
                default:
              }
            });
          });
        }).catchError((onError) {
          Navigator.pop(context);
          normalDialog(context, onError.code, onError.message);
        });
      });
    });
  } // end Method
}
