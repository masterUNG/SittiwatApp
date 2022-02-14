import 'package:flutter/material.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image1.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image2.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image3.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image4.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image5.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image6.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image7.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/pay_sponsor_image/sponsor_image8.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SponsorTwo extends StatefulWidget {
  const SponsorTwo({Key? key}) : super(key: key);

  @override
  _SponsorTwoState createState() => _SponsorTwoState();
}

class _SponsorTwoState extends State<SponsorTwo> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().greenhiColor,
        title: MyStyle().fonWhite15("โฆษณาที่เราสามารถกำหนดงบประมาณได้เอง"),
      ),
      body: Column(
        children: [
          builTitle(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  SponsorTwo1(),
                  SizedBox(height: 10),
                  SponsorTwo2(),
                  SizedBox(height: 10),
                  SponsorTwo3(),
                  SizedBox(height: 10),
                  SponsorTwo4(),
                  SizedBox(height: 10),
                  SponsorTwo5(),
                  SizedBox(height: 10),
                  SponsorTwo6(),
                  SizedBox(height: 10),
                  SponsorTwo7(),
                  SizedBox(height: 10),
                  SponsorTwo8(),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: MyStyle().yellouuColor,
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
