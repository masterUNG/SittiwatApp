
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/monne_user_class/class_advermonestateone.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class AdverMonne extends StatefulWidget {
  const AdverMonne({Key? key}) : super(key: key);

  @override
  _AdverMonneState createState() => _AdverMonneState();
}

class _AdverMonneState extends State<AdverMonne> {
  final formKey = GlobalKey<FormState>();
  var now = DateTime.now();
  late double screen;
  var choice;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      backgroundColor: MyStyle().telColor02,
      body: SafeArea(
        child: Container(
           decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent.shade400,
              Colors.lightBlueAccent.shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
         
        ),
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
               Center(child: MyStyle().fonWhite20("Welcome to monne adver")),
                const SizedBox(height: 10)
              ],
            ),
          ),
         



            





              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyStyle().fonWhite15("วันที่ :"),
                              MyStyle().fonWhite15(
                                  "${now.day}/${now.month}/${now.year}"),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            //color: Colors.black12,
                            width: double.infinity,
                            height: 150,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                  builData(),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          showMonney(),
                          const SizedBox(height: 15),
                          radioChoice(),
                          MyStyle().fonBack15(
                              "กรุณากรอกเลขที่บัญชีที่ต้อวการรับเงินด้วยครับ "),
                          const SizedBox(height: 15),
                          textMonne01(),
                          const SizedBox(height: 15),
                          textMonne02(),
                          const SizedBox(height: 15),
                          textMonne03(),
                          const SizedBox(height: 15),
                          textMonne04(),
                          const SizedBox(height: 15),
                          textMonne05(),
                          const SizedBox(height: 15),
                          Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            color: MyStyle().blueColor01,
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),),
                            child: Container(
                              width: screen * 0.95,
                              decoration: BoxDecoration(
                                color: MyStyle().greenColor,
                                borderRadius:  BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: TextButton.icon(
                                  icon: const Icon(Icons.touch_app),
                                  label: MyStyle().fonWhite20("ส่งบัญชีรับเงิน"),
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      await adverMoneStateOneCollection.add({
                                        "choice": myAdverMoneStateOne.choice,
                                        "user1": myAdverMoneStateOne.user1,
                                        "user2": myAdverMoneStateOne.user2,
                                        "user3": myAdverMoneStateOne.user3,
                                        "user4": myAdverMoneStateOne.user4,
                                        "user5": myAdverMoneStateOne.user5,
                                      });
                                    }
                                    if (choice == null) {
                                      normalDialog(context, "ถอนเงิน",
                                          "กรุณากดเลือกชนิดการถอนเงินด้วยครับ");
                                    } else {
                                      formKey.currentState!.reset();
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                        msg:
                                            "Thai..Kaset Hey \nยินดีกับรายได้ที่ได้รับ\nระบบกำลังตัดยอดและโอนเงินให้ท่าน",
                                        timeInSecForIosWeb: 5,
                                        fontSize: 20,
                                        gravity: ToastGravity.CENTER,
                                        backgroundColor:
                                            Colors.greenAccent.shade400,
                                        textColor: Colors.black,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row builData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyStyle().fonyellouu15("data ประเภทที่เลือก"),
        Row(
          children: [
            MyStyle().fonWhite15("รายได้ "),
            Container(
              color: Colors.white12,
              width: screen * 0.2,
              height: 30,
              child: Center(
                child: MyStyle().fonyellouu15("Data"),
              ),
            ),
            MyStyle().fonWhite15(" บาท"),
          ],
        ),
      ],
    );
  }

  Row showMonney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyStyle().fonyellouu15("รวมรายได้"),
        Row(
          children: [
            Container(
              color: Colors.white12,
              width: screen * 0.2,
              height: 30,
            ),
            MyStyle().fonWhite15(" บาท"),
          ],
        ),
      ],
    );
  }

  Column radioChoice() {
    return Column(
      children: [
        MyStyle().fonBack15("คุณต้องการถอนเงิน (แบบอัตโนมัติ)"),
        const SizedBox(height: 15),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: 1,
          groupValue: choice,
          onChanged: (var value) {
            setState(() {
              choice = value;
            });
          },
          title: MyStyle().fonBack15("ต้องการถอน 30% ของยอดเต็ม"),
          subtitle: MyStyle()
              .fonBack12("ระบบจะทำการตัดยอดและโอนเข้าบัญชีท่าน วันถัดไป"),
        ),
        const SizedBox(height: 15),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: 2,
          groupValue: choice,
          onChanged: (var value) {
            setState(() {
              choice = value;
            });
          },
          title: MyStyle().fonBack15("ต้องการถอน 50% ของยอดเต็ม"),
          subtitle: MyStyle()
              .fonBack12("ระบบจะทำการตัดยอดและโอนเข้าบัญชีท่าน วันถัดไป"),
        ),
        const SizedBox(height: 15),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: 3,
          groupValue: choice,
          onChanged: (var value) {
            setState(() {
              choice = value;
            });
          },
          title: MyStyle().fonBack15("ต้องการถอน 70% ของยอดเต็ม"),
          subtitle: MyStyle()
              .fonBack12("ระบบจะทำการตัดยอดและโอนเข้าบัญชีท่าน วันถัดไป"),
        ),
        const SizedBox(height: 15),
        RadioListTile(
          activeColor: MyStyle().orangeColor,
          value: 4,
          groupValue: choice,
          onChanged: (var value) {
            setState(() {
              choice = value;
            });
          },
          title: MyStyle().fonBack15("ต้องการถอน 100% ของยอดเต็ม"),
          subtitle: MyStyle()
              .fonBack12("ระบบจะทำการตัดยอดและโอนเข้าบัญชีท่าน วันถัดไป"),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  //ชื่อบัญชี
  Card textMonne01() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
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
              onSaved: (var user1) {
                myAdverMoneStateOne.user1 = user1!;
              },
              autofocus: true,
              validator: RequiredValidator(
                errorText: "กรุณากรอก ชื่อบัญชี ด้วยครับ",
              ),
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
  Card textMonne02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
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
              onSaved: (var user2) {
                myAdverMoneStateOne.user2 = user2!;
              },
              autofocus: true,
              validator: RequiredValidator(
                errorText: "กรุณากรอก ธนาคาร ด้วยครับ",
              ),
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
  Card textMonne03() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
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
              onSaved: (var user3) {
                myAdverMoneStateOne.user3 = user3!;
              },
              autofocus: true,
              validator: RequiredValidator(
                errorText: "กรุณากรอก ธนาคารสาขา ด้วยครับ",
              ),
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
  Card textMonne04() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
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
              onSaved: (var user4) {
                myAdverMoneStateOne.user4 = user4!;
              },
              autofocus: true,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return "กรุณากรอก เลขที่บัญชี ด้วยครับ";
                }
                if (double.parse(str) <= 0) {
                  return "กรุณาป้อนตัวเลขมากกว่า 0 ด้วยครับ";
                }
                return null;
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
  Card textMonne05() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
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
              onSaved: (var user5) {
                myAdverMoneStateOne.user5 = user5!;
              },
              autofocus: true,
              validator: (String? str) {
                if (str!.isEmpty) {
                  return "กรุณากรอก เบอร์โทรติดต่อ ด้วยครับ";
                }
                if (double.parse(str) <= 0) {
                  return "กรุณาป้อนตัวเลขมากกว่า 0 ด้วยครับ";
                }
                return null;
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

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference adverMoneStateOneCollection =
      FirebaseFirestore.instance.collection("AdverMoneStateOnes");
  //เตรียมชุดข้อมูลส่งเข้าไป Firebase
  AdverMoneStateOne myAdverMoneStateOne = AdverMoneStateOne(
    choice: '',
    user1: "",
    user2: '',
    user3: '',
    user4: '',
    user5: '',
  );
}
