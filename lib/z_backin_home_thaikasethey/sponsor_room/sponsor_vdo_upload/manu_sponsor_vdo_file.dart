import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SponsorVdo extends StatefulWidget {
  const SponsorVdo({Key? key}) : super(key: key);

  @override
  _SponsorVdoState createState() => _SponsorVdoState();
}

class _SponsorVdoState extends State<SponsorVdo> {
  late double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");

    return Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Center(child: MyStyle().fonWhite20("โฆษณาเข้าประเภท Vdo")),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 1 (โฆษณาขึ้นต้นก่อน vdo ความยาว 7 วินาที)"),
                onPressed: () => Navigator.pushNamed(context, "/SponsorVdo1"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.video_call,
                  color: Colors.white
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 2 (โฆษณาขึ้นกลางคลิป vdo ความยาว 7 วินาที)"),
                onPressed: () => Navigator.pushNamed(context, "/SponsorVdo2"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 3 (โฆษณาขึ้นท้ายคลิป vdo ความยาว 7 วินาที)"),
                onPressed: () => Navigator.pushNamed(context, "/SponsorVdo3"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15("แบบที่ 4 (โฆษณาสไลใต้คลิป)"),
                onPressed: () => Navigator.pushNamed(context, "/SponsorVdo4"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.video_call,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15("แบบที่ 5 (โฆษณาขั้นระหว่างคลิป)"),
                onPressed: () => Navigator.pushNamed(context, "/SponsorVdo5"),
              ),
            ),
          
             const SizedBox(height: 10),
            const Divider(color: Colors.white,height: 5),
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
                icon:  const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 1 (ไฟ VDO โฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadVdo1"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 2 (ไฟ VDO โฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadVdo2"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 3 (ไฟ VDO โฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadVdo3"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 4 (ไฟ VDO โฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadVdo4"),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: screen * 0.9,
              child: ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon:  const Icon(
                  Icons.file_copy_outlined,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 5 (ไฟ VDO โฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadVdo5"),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      )),
    );
  }
}
