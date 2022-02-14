import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ThaimPic5 extends StatefulWidget {
  const ThaimPic5({Key? key}) : super(key: key);

  @override
  _ThaimPic5State createState() => _ThaimPic5State();
}

class _ThaimPic5State extends State<ThaimPic5> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 35,
          width: screen * 0.45,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow.shade400,
          ),
          child: TextButton.icon(
              onPressed: () {
                setState(() {
                  if (stopwatch.isRunning) {
                    stopwatch.stop(); //สั่งหยูด
                    display =
                        stopwatch.elapsed.inSeconds.toString(); //เริ่มต้นใหม่

                  } else {
                    stopwatch.reset();
                    stopwatch.start();
                    if (timer?.isActive == true) {
                      timer?.cancel();
                    }
                    timer =
                        Timer.periodic(const Duration(microseconds: 96), (_) {
                      setState(() {
                       
                        //ชั่วโมง
                        var h = stopwatch.elapsed.inHours
                            .remainder(1)
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
                        display = '$h:$m:$s:$ms';
                      });
                    });
                    Navigator.pushNamed(context, "/AdverSponsorPic5");
                  }
                } 
                );
              },
              icon: const Icon(
                Icons.photo_sharp,
                size: 20,
                color: Colors.black54,
              ),
              label: Center(child: MyStyle().fonText13("โฆษณาภาพชุดที่ 5"))),
        ),
        Container(
          height: 35,
          width: screen * 0.4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow.shade400,
          ),
          child: Center(
              child: Text(
            display,
            style:  TextStyle(
              color: Colors.red.shade600,
              fontSize: 15,
            ),
          )),
        ),
      ],
    );
  }

  //ชุดประกาศตัวแปลทำนาฬิกาจับเวลาห้องประมูลสินค้า
  final formKey = GlobalKey<FormState>();
  var stopwatch = Stopwatch();
  var display = '0:00:00:000';
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
  // สิ้นสุดประกาศตัวแปลทำนาฬิกาจับเวลา
  // สิ้นสุดโซนเลือกโฆษณาชนิดภาพนิ่ง ชุดที่ 2 ######################################
}
