import 'package:flutter/material.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/pay_sponsor_video/sponsor_vdo1.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/pay_sponsor_video/sponsor_vdo2.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/pay_sponsor_video/sponsor_vdo3.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/pay_sponsor_video/sponsor_vdo4.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/pay_sponsor_video/sponsor_vdo5.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SponsorOne extends StatefulWidget {
  const SponsorOne({Key? key}) : super(key: key);

  @override
  _SponsorOneState createState() => _SponsorOneState();
}

class _SponsorOneState extends State<SponsorOne> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      //backgroundColor: MyStyle().greenColor,
      appBar: AppBar(
        backgroundColor: MyStyle().greenhiColor,
        title: MyStyle().fonWhite15("KASET HEY หารูปแบบโฆษณาที่โดนใจ"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          builTitle(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: const [
                    SizedBox(height: 10),
                    SponsorOne1(),
                    SizedBox(height: 10),
                    SponsorOne2(),
                    SizedBox(height: 10),
                    SponsorOne3(),
                    SizedBox(height: 10),
                    SponsorOne4(),
                    SizedBox(height: 10),
                    SponsorOne5(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: MyStyle().telColor01,
            child: const Icon(
              Icons.table_view_outlined,
              size: 40,
            ),
            onPressed: () => Navigator.pushNamed(context, "/calculate"),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  //ข้อตกลงเรื่อง ลิขสิทธิ์การโฆษณา
  Card builTitle() {
    return Card(
      color: Colors.cyan.shade900,
      child: ExpansionTile(
        backgroundColor: Colors.green.shade900,
        title: MyStyle().fonWhite15("ข้อตกลงลิขสิทธิ์โฆษณา"),
        children: [],
      ),
    );
  }
}
