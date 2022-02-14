import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ShareLikeOnShop extends StatefulWidget {
  const ShareLikeOnShop({Key? key}) : super(key: key);

  @override
  _ShareLikeOnShopState createState() => _ShareLikeOnShopState();
}

class _ShareLikeOnShopState extends State<ShareLikeOnShop> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(70),
        bottomRight: Radius.circular(10),
      )),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.tealAccent.shade400,
              Colors.greenAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(70),
            bottomLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                icon:  Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),),
                  child:  const CircleAvatar(
                      backgroundColor: Colors.black38,
                      radius: 25,
                      child: Icon(Icons.share)),
                ),
                label: MyStyle().fonBack15("ฟรี ทดลองเปิดขายสินค้า 30 วัน"),
                onPressed: () =>
                    Navigator.pushNamed(context, "/PosSoppingShareLike"),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                     decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.black54, Colors.black12],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow.shade400,
                  ),
                    width: screen * 0.5,
                    height: 25,
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: RequiredValidator(
                            errorText: "กรุณากรอก Password ด้วยครับ"),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_clock_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          labelText: "Password:",
                          labelStyle: TextStyle(
                            color: Colors.white38,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      MyStyle().fongreen15("30 วัน ใช้แล้ว"),
                      Container(
                         decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.black54, Colors.black12],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow.shade400,
                  ),
                        width: screen * 0.4,
                        height: 35,
                        child: Center(
                            child: Text(
                          display2,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.black38,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // ตัวแปลทำนาฬิกาจับเวลาเปิดห้องขายสินค้าแบบฟรีแชร์ไล
                          setState(() {
                            if (stopwatch2.isRunning) {
                              // display2 = stopwatch.elapsed.inSeconds.toString();

                            } else {
                              stopwatch2.reset();
                              stopwatch2.start();
                              if (timer2?.isActive == true) {
                                timer2?.cancel();
                              }
                              timer2 = Timer.periodic(
                                  const Duration(microseconds: 96), (_) {
                                setState(() {
                                  //วัน
                                  var d = stopwatch2.elapsed.inDays
                                      .remainder(45)
                                      .toString()
                                      .padLeft(2, '0');
                                  //ชั่วโมง
                                  var h = stopwatch2.elapsed.inHours
                                      .remainder(24)
                                      .toString()
                                      .padLeft(2, '0');
                                  //นาที
                                  var m = stopwatch2.elapsed.inMinutes
                                      .remainder(60)
                                      .toString()
                                      .padLeft(2, '0');
                                  //วินาที
                                  var s = stopwatch2.elapsed.inSeconds
                                      .remainder(60)
                                      .toString()
                                      .padLeft(2, '0');
                                  //เซี่ยววินาที
                                  var ms = stopwatch2.elapsed.inMilliseconds
                                      .remainder(1000)
                                      .toString()
                                      .padLeft(3, '0');
                                  display2 = '$d:$h:$m:$s:$ms';
                                });
                              });
                            }
                          });

                          Navigator.pushNamed(context, "/RoomProfileShopping");
                        }
                      },
                      child: SizedBox(
                        width: screen * 0.5,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: screen * 0.4,
                              child: Center(
                                  child: MyStyle().fonBack15("โพสขายสินค้า")),
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(200.0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.local_grocery_store_outlined,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //ชุดประกาศตัวแปลทำนาฬิกาจับเวลาเปิดห้องขายสินค้า(แบบฟรีแชร์ไล)
  final formKey = GlobalKey<FormState>();
  var stopwatch2 = Stopwatch();
  var display2 = '00:00:00:00:000';
  Timer? timer2;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stopwatch2.stop();
    timer2?.cancel();
    super.dispose();
  }
  //สิ้นสุดประกาศตัวแปลทำนาฬิกาจับเวลา
}
