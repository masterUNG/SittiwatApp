import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/model/my_style.dart';

class MemberOnAuction extends StatefulWidget {
  const MemberOnAuction({Key? key}) : super(key: key);

  @override
  _MemberOnAuctionState createState() => _MemberOnAuctionState();
}

class _MemberOnAuctionState extends State<MemberOnAuction> {
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
        bottomLeft: Radius.circular(70),
        bottomRight: Radius.circular(70),
      )),
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.greenAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              label: MyStyle().fonBack12(
                  "สมัครเปิดประมูลขายสินค้า\nรับสิทธิ์เปิดรับโฆษณาในสตอรี่และอื่นๆอีกมากมาย"),
              icon: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const CircleAvatar(
                  child: Icon(
                    Icons.touch_app,
                  ),
                  backgroundColor: Colors.black38,
                  radius: 25,
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, "/PayOpenAuction"),
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
                    key: formKey2,
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
                    MyStyle().fonBack12("25ชม.ใช้แล้ว"),
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
                        display1,
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
                      if (formKey2.currentState!.validate()) {
                        //ตัวดำเนินการจับเวลาเปิดห้องประมูลสินค้า

                        setState(() {
                          if (stopwatch1.isRunning) {
                            //stopwatch.stop();
                            // display = stopwatch.elapsed.inSeconds.toString();

                          } else {
                            stopwatch1.reset();
                            stopwatch1.start();
                            if (timer1?.isActive == true) {
                              timer1?.cancel();
                            }
                            timer1 = Timer.periodic(
                                const Duration(microseconds: 96), (_) {
                              setState(() {
                                //วัน
                                var d = stopwatch1.elapsed.inDays
                                    .remainder(1)
                                    .toString()
                                    .padLeft(1, '0');
                                //ชั่วโมง
                                var h = stopwatch1.elapsed.inHours
                                    .remainder(25)
                                    .toString()
                                    .padLeft(2, '0');
                                //นาที
                                var m = stopwatch1.elapsed.inMinutes
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, '0');
                                //วินาที
                                var s = stopwatch1.elapsed.inSeconds
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, '0');
                                //เซี่ยววินาที
                                var ms = stopwatch1.elapsed.inMilliseconds
                                    .remainder(1000)
                                    .toString()
                                    .padLeft(3, '0');
                                display1 = '$d:$h:$m:$s:$ms';
                              });
                            });
                          }
                        });

                        Navigator.pushNamed(context, "/RoomProfileAuction");
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
                              child: MyStyle().fonWhite15("โพสประมูลสินค้า"),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(200.0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.gavel_outlined,
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

  //ชุดประกาศตัวแปลทำนาฬิกาจับเวลาห้องประมูลสินค้า
  final formKey2 = GlobalKey<FormState>();
  var stopwatch1 = Stopwatch();
  var display1 = '0:00:00:00:000';
  Timer? timer1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    stopwatch1.stop();
    timer1?.cancel();
    super.dispose();
  }
  // สิ้นสุดประกาศตัวแปลทำนาฬิกาจับเวลา
}
