import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ManuSponsorPicgImage extends StatefulWidget {
  const ManuSponsorPicgImage({Key? key}) : super(key: key);

  @override
  _ManuSponsorPicgImageState createState() => _ManuSponsorPicgImageState();
}

class _ManuSponsorPicgImageState extends State<ManuSponsorPicgImage> {
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
            Center(child: MyStyle().fonWhite20("โฆษณาเข้าประเภท ภาพนิ่ง")),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 1 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg1"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 2 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg2"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 3 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg3"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 4 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg4"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 5 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg5"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 6 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg6"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 7 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg7"),
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
                  Icons.photo_sharp,
                  color: Colors.white,
                ),
                label: MyStyle().fonWhite15(
                    "แบบที่ 8 (โฆษณาขึ้นภาพนิ่ง 10 วินาที)"),
                onPressed: ()=>Navigator.pushNamed(context, "/SponsorPicg8"),
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
                    "แบบที่ 1 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage1"),
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
                    "แบบที่ 2 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage2"),
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
                    "แบบที่ 3 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage3"),
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
                    "แบบที่ 4 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage4"),
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
                    "แบบที่ 5 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage5"),
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
                    "แบบที่ 6 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage6"),
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
                    "แบบที่ 7 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage7"),
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
                    "แบบที่ 8 (ไฟภาพโฆษณา)"),
                onPressed: ()=>Navigator.pushNamed(context, "/FileUploadImage8"),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      )),
    );
  }
}
