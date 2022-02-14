// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class MyGetAds extends StatefulWidget {
  const MyGetAds({Key? key}) : super(key: key);

  @override
  _MyGetAdsState createState() => _MyGetAdsState();
}

class _MyGetAdsState extends State<MyGetAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Center(child: MyStyle().fonBack20("Thai...KASET HEY")),
                  Center(child: MyStyle().fonBack15("เงื่อนไขการเปิดรับโฆษณา")),
                ],
              ),
            ),
           
           
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 1.)"),
                      MyStyle().fonBack12(
                          "-ท่านจะต้องมีโพสสตอรี่ของท่านขึ้นหน้าฟีดทุกอาทิตย์อย่างน้อย 1 โพส ย้อนหลัง 5 เดือน นับจากวันสมัครขอเปิดรับโฆษณา "),
                      MyStyle().fonBack12(
                          "-ท่านจะต้องมีผู้ติดตามไม่น้อยกว่า 1,000 คน "),
                      MyStyle().fonBack12(
                          "-ท่านจะต้องมียอดกดไลไม่น้อยกว่า 300 คน ต่อ 1โพส ย้อนหลังติดต่อกันอย่างน้อย 3 เดือน นับจากวันสมัคร"),
                      MyStyle().fonBack12(
                          "-ท่านจะต้องเป็นสมาชิกรายปีของทางแอพพิเคชั่นมาแล้วอย่างน้อย 6 เดือน "),
                      MyStyle().fonBack12(
                          "-ท่านจะต้องเคยนำสินค้าออกประมูลไม่น้อยกว่า 5 ครั้ง "),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 2.)"),
                      MyStyle().fonBack12(
                        "ท่านจะต้องไม่เคยทำผิดกฎการใชห้อง โพสสตอรี่ , จำหน่ายสินค้า , ประมูลสินค้า",
                      ),
                      MyStyle().fonBack15("หมายเหตุ:"),
                      MyStyle().fonBack12("คุณจะได้เวลาการโพสสตอรี่เพิ่มขึ้นเป็น 2 นาที"),
                      MyStyle().fonBack12(
                        "เมื่อท่านคิดว่าคุณสมบัติครบเข้าหลักเกณ ให้กด ฉันพร้อมแล้ว และกรอกข้อมูลเมื่อทางแอพตรวจสอบผ่านรหัสเปิดใช้งานจะถูกส่งในข้อความท่านสามารถนำรหัสใส่และเปิดใช้งาน",
                      ),
                      MyStyle().fonBack12(
                          "-ในนั้นจะมีรายระเอียดชนิดของโฆษณาให้ท่านเลือกได้ และการแสดงรายได้ของท่านที่จะได้รับอย่างชัดเจน"),
                      MyStyle().fonBack12(
                          "-ท่านจะสามารถบริหารการวางโฆษณาเองพร้อมรายได้ที่จะได้รับ"),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 20),
                      MyStyle().fonBack12(
                        "เงื่อนไขการเปิดรับโฆษณาทางแอพขอสงนการแก้ไขหรือเปลี่ยนแปลงเพิ่มเติมหรือลดเนื้อหาข้อความเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า",
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyStyle().orangeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: MyStyle().fonWhite20("ฉันพร้อมแล้ว"),
                            onPressed: () =>
                                Navigator.pushNamed(context, "/application02"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
