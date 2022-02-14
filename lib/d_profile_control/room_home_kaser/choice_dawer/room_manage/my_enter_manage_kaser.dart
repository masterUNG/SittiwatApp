import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class MyEnterManageKaset extends StatefulWidget {
  const MyEnterManageKaset({Key? key}) : super(key: key);

  @override
  _MyEnterManageKasetState createState() => _MyEnterManageKasetState();
}

class _MyEnterManageKasetState extends State<MyEnterManageKaset> {
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
                  Center(
                      child: MyStyle()
                          .fonBack15("เงื่อนไขการเข้าร่วมบริหารแพรทฟรอม")),
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
                        "-ท่านจะต้องมีโพสสตอรี่ของท่านขึ้นหน้าฟีดทุกอาทิตย์อย่างน้อย 1 โพส ย้อนหลัง 6 เดือน นับจากวันสมัครขอเข้าร่วมบริหารแพรตฟร์อมและโพสยังคงอยู่ ",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องมีผู้ติดตามไม่น้อยกว่า 1,500 คน ",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องมีผู้ติดตามเป็นคนในพื้นที่รหัสอำเภอเดียวกับท่านไม่น้อยกว่า 500 คน ",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องมียอดกดไลไม่น้อยกว่า 500 คน ต่อ 1โพส ย้อนหลังติดต่อกันอย่างน้อย 5 เดือน นับจากวันสมัคร",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องอาศัยอยู่ในพื้นที่ตามรหัสอำเภอของท่าน ",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องเป็นสมาชิกรายปีของทางแอพพิเคชั่น มาแล้วไม่น้อยกว่า 10 เดือน",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องมียอดจำหน่ายสินค้าไม่น้อยกว่า 100ชิ้น/เดือน ติดต่อกัน ยอนหลัง 9 เดือน นับจากวันที่ท่านสมัครเข้าร่วมบริหารแพรทฟรอม",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะต้องเคยนำสินค้าออกประมูลไม่น้อยกว่า 20 ครั้ง ",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 2.)"),
                      MyStyle().fonBack12(
                        "ท่านจะต้องไม่เคยทำผิดกฎการใชห้อง โพสสตอรี่ , จำหน่ายสินค้า , ประมูลสินค้า",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 3.)"),
                      MyStyle().fonBack12(
                        "ท่านจะต้องเคยทำคลิปแบ่งปันเทคนิคการขายและการใช้แอพลงใน สตอรี่  เป็นประจำอย่างน้อย 1 อาทิตย์ 1 คลิปติดต่อกันอย่างน้อย 6 เดือน ย้อนหลังนับจากวันที่ท่านสมัครเข้าร่วมบริหารแพรทฟรอม",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 4.)"),
                      MyStyle().fonBack12(
                          "ปัจจุบันท่านจะต้องผ่านเกณและรับโฆษณาจากทางแอพไปแล้วและยังใช้งานอยู่)"),
                      Divider(color: Colors.orange.shade900),
                      MyStyle().fonBack15("หมายเหตุ:"),
                      MyStyle().fonBack12(
                        "เมื่อท่านคิดว่าคุณสมบัติครบเข้าหลักเกณ ให้กด ฉันพร้อมแล้ว และกรอกรายละเอียดเมื่อทางแอพตรวจสอบผ่านรหัสเปิดใช้งานจะถูกส่งในข้อความท่านสามารถนำรหัสใส่และเปิดใช้งาน",
                      ),
                      MyStyle().fonBack15("แนะนำหน้าที่และผลประโยชน์ บางส่วน:"),
                      MyStyle().fonBack12(
                        "-ท่านจะเข้าถึงส่วนควบคุมและการดูแลร้านค้าในพื้นที่รหัสอำเภอเดียวกันทั้งหมด",
                      ),
                      MyStyle().fonBack12(
                        "-รับแนวทางและนโยบายของทางแอพเพื่อบริหารตลาดร้านค้าในพื้นที่รหัสอำเภอเดียวกัน",
                      ),
                      MyStyle().fonBack12(
                        "-ท่านจะได้รับงบประมาณ/รายไตรมาส/ในการบริหารส่วนพื้นที่รหัสอำเภอ คิดเป็น % ของยอดจำหน่ายสินค้าในพื้นที่รหัสอำเภอทุกชิ้นที่ขายได้",
                      ),
                      const SizedBox(height: 30),
                      Divider(color: Colors.orange.shade900),
                      MyStyle().fonBack12(
                        "เงื่อนไขการเข้าร่วมบริหารแพรทฟรอม ทางแอพขอสงนการแก้ไขหรือเปลี่ยนแปลงเพิ่มเติมหรือลดเนื้อหาข้อความเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า",
                      ),
                      MyStyle().fonBack15(
                        " ทางแอพขอสงวนสิทธิ์รับผู้เข้าร่วมบริหารแพรทฟรอม 1 ท่าน ต่อ พื้นที่รหัสอำเภอ  ",
                      ),
                      const Divider(color: Colors.white),
                      MyStyle().fonBack15(
                          "ความหมาย(รหัสอำเภอ) = รหัสไปรษณีย์ ตอนที่ท่านสมัครเปิดใช้แอพ"),
                      const Divider(color: Colors.white),
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
                                Navigator.pushNamed(context, "/application01"),
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
