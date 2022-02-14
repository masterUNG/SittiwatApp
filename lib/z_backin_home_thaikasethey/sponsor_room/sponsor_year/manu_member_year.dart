import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ManuMemberYear extends StatefulWidget {
  const ManuMemberYear({Key? key}) : super(key: key);

  @override
  _ManuMemberYearState createState() => _ManuMemberYearState();
}

class _ManuMemberYearState extends State<ManuMemberYear> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 15),
          Center(
              child:
                  MyStyle().fonWhite15("เช็ครายการจ่ายเงินค่าโฆษณารายปีไฟvdo")),
          const SizedBox(height: 15),
          SizedBox(
            width: screen * 0.9,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              icon: const Icon(
                Icons.video_call,
                color: Colors.white,
              ),
              label: MyStyle().fonWhite15("เช็คยอดเงินค่าโฆษณาเข้า"),
              onPressed: () => Navigator.pushNamed(context, "/GetMoneyMember"),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.white, height: 5),
          const SizedBox(height: 10),
          SizedBox(
            width: screen * 0.9,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              icon: const Icon(
                Icons.file_copy_outlined,
                color: Colors.white,
              ),
              label: MyStyle().fonWhite15("เช็ค (ไฟ VDO โฆษณารายปี)"),
              onPressed: () => Navigator.pushNamed(context, "/FileVdoYear"),
            ),
          ),
          const SizedBox(height: 5),
        ],
      )),
    );
  }
}
