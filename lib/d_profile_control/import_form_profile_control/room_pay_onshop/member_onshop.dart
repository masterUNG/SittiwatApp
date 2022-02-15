import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/model/my_style.dart';

class MemberOnShop extends StatefulWidget {
  const MemberOnShop({Key? key}) : super(key: key);

  @override
  _MemberOnShopState createState() => _MemberOnShopState();
}

class _MemberOnShopState extends State<MemberOnShop> {
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
        bottomRight: Radius.circular(70),
        bottomLeft: Radius.circular(70),
      )),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.greenAccent.shade100
              
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
          color: Colors.yellow.shade400,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              label: MyStyle().fonBack12(
                  "สมัครสมาชิกจำหน่ายสินค้า\nรับสิทธิ์เปิดรับโฆษณาในสตอรี่และอื่นๆอีกมากมาย"),
              icon: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const CircleAvatar(
                  child: Icon(Icons.touch_app),
                  backgroundColor: Colors.black38,
                  radius: 25,
                ),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context,  "/paymember", (route) => false),
            ),
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
                    key: formKey1,
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
                    MyStyle().fonBack12("1 ปี ใช้ไปแล้ว"),
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
                      height: 30,
                      child: Center(
                          child: Text(
                        display,
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


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      if (formKey1.currentState!.validate()) {
                        //ตัวแปลทำนาฬิกาจับเวลาเปิดห้องขายสินค้าแบบสมาชิกรายปี
                        setState(() {
                          if (stopwatch.isRunning) {
                            // display = stopwatch.elapsed.inSeconds.toString();

                          } else {
                            stopwatch.reset();
                            stopwatch.start();
                            if (timer?.isActive == true) {
                              timer?.cancel();
                            }
                            timer = Timer.periodic(
                                const Duration(microseconds: 96), (_) {
                              setState(() {
                                //วัน
                                var d = stopwatch.elapsed.inDays
                                    .remainder(365)
                                    .toString()
                                    .padLeft(3, '0');
                                //ชั่วโมง
                                var h = stopwatch.elapsed.inHours
                                    .remainder(24)
                                    .toString()
                                    .padLeft(2, '0');
                                //นาที
                                var m = stopwatch.elapsed.inMinutes
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, '0');
                                //วินาที
                                var s = stopwatch.elapsed.inSeconds
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, '0');
                                //เซี่ยววินาที
                                var ms = stopwatch.elapsed.inMilliseconds
                                    .remainder(1000)
                                    .toString()
                                    .padLeft(3, '0');
                                display = '$d:$h:$m:$s:$ms';
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
                              child: MyStyle().fonBack15("โพสขายสินค้า"),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade300,
                              borderRadius: const BorderRadius.only(
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
    );
  }

  //ชุดประกาศตัวแปลทำนาฬิกาจับเวลาเปิดห้องขายสินค้าแบบสมาชิกรายปี
  final formKey1 = GlobalKey<FormState>();
  var stopwatch = Stopwatch();
  var display = '000:00:00:00:000';
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer?.cancel();
    super.dispose();
  }
  //สิ้นสุดประกาศตัวแปลทำนาฬิกาจับเวลา
}
