import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class MyStoryKaset extends StatefulWidget {
  const MyStoryKaset({Key? key}) : super(key: key);

  @override
  _MyStoryKasetState createState() => _MyStoryKasetState();
}

class _MyStoryKasetState extends State<MyStoryKaset> {
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
                  Center(child: MyStyle().fonBack15("เงื่อนไขการใช้ห้องต่างๆ")),
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
                      Center(
                        child: MyStyle().fonBack15("เงื่อนไขการห้องโพสสอรี่"),
                      ),
                      MyStyle().fonBack12("คุณมีเวลาในการโพสสตอรี่ได้ 1 นาที ต่อ 1 ครั้ง"),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 1.)"),
                      MyStyle().fonBack12(
                        "ห้ามโพสเนื้อหาคำพูดหรือการพิมพ์ข้อความที่หยาบคายไม่สุภาพหรือพาดพิงบุคคลอื่นๆให้เกิดความเสียหาย",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 2.)"),
                      MyStyle().fonBack12(
                        "ห้ามโพสเนื้อหาคำพูดหรือการพิมพ์ข้อความที่แฝงการโฆษณาขายสินค้าที่ไม่ใช้ของร้านหรือของตนเองที่ลงขายไว้หรือการโฆษณาแฝงต่างๆ",
                      ),
                      MyStyle().fonBack12("ห้ามทำการซื้อขายสินค้าหรือบอกราคาสินค้าของท่านบุคคลอื่นๆทางห้องสตอรี่โดยเด็ดขาด\nแต่ให้ทำการแนะนำช่องทางซื้อขายของร้านหรือตัวสินค้าแทนได้"),
                      MyStyle().fonBack12(
                          "ห้ามโพสเนื้อหาสินค้าที่เป็นตัวแทนจำหน่ายหรือตัวแทนขายของสินค้าในรูปแบบบริษัทของบุคคลอื่นเด็ดขาด"),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 3.)"),
                      MyStyle().fonBack12(
                          "ท่านสามารถมีส่วนช่วยหรือดูแลความไม่เหมาะสมในการโพสได้โดยการกด ไม่ถูกใจ หากยอด ไม่ถูกใจ มากว่ายอด ถูกใจ โพสนั้นจะถูกลบทับที"),
                      const Divider(color: Colors.white),
                      MyStyle()
                          .fonBack15("ข้อแนะนำวิธีใช้แอพให้เกิดประโยชน์สูงสุด"),
                      const SizedBox(height: 10),
                      MyStyle().fonBack12(
                        "เพื่อให้ร้านค้า/สวน ของท่านเป็นที่รูจักเร็วมากยิ่งขึ้นควรโพสสตอรี่อย่างน้อยอาทิตย์ละ 1 ครั้ง",
                      ),
                      MyStyle().fonBack12(
                        "ห้องโพสสตอรี่นี้มีไว้เพื่อให้พื้นที่ในการแสดงออกของท่านเจ้าของสินค้าทั้งหลายได้ทำการพรีเซ้นร้านค้า/สินค้าของตัวท่านเองให้เกิดความน่าเชื่อถือมากยิ่งๆขึ้นในระยะยาว",
                      ),
                      MyStyle().fonBack12(
                        "เมื่อร้านของท่าน/หรือสวนผลไม้ อื่นๆ สร้างความน่าเชื่อถือและมีผู้ติดตามที่มากพอจำนวนหนึ่งแล้วท่านเองยังสามารถบริหารรายได้เพิ่มจากการเปิดรับโฆษณาทีทางแอพจัดเตรียมไว้ให้ (กรุณาศึกษากฎการเปิดรับโฆษณา)",
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black, height: 5),
                      const SizedBox(height: 20),
                      Center(
                          child: MyStyle()
                              .fonBack15("เงื่อนไขการห้องจำหน่ายสินค้า")),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 1.)"),
                      MyStyle().fonBack12(
                        "สินค้าที่นำเข้ามาจำหน่ายในแอพต้องเป็นสินค้าที่ถูกต้องตามกฎหมายและไม่ละเมิดสิทธิ์ของผู้อื่น",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 2.)"),
                      MyStyle().fonBack12(
                        "สินค้าที่ต้องที่ใบอนุญาติในการจำหน่ายต้องแจ้งและแสดงหลักฐานให้ทางแอพทราบก่อนลงขาย",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 3.)"),
                      MyStyle().fonBack12(
                        "ห้ามจำหน่ายสินค้าประเภทเดียวกันหรือใกล้เคียงกับสินค้าที่ทางแอพจัดไว้เพื่อทำการโฆษณาให้กับท่านในการ(เปิดรับโฆษณา)",
                      ),
                      const Divider(color: Colors.white),
                      MyStyle()
                          .fonBack15("ข้อแนะนำวิธีใช้แอพให้เกิดประโยชน์สูงสุด"),
                      const SizedBox(height: 10),
                      MyStyle().fonBack12(
                        "การลงรูปสินค้าหรือรายละเอียดควรเป็นรูปจากสินค้าตัวจริงและรายละเอียดตามความเป็นจริง จะทำให้ลูกค้าที่ซื้อสินค้าแล้วกลับมาซื้อใหม่อีกในครั้งต่อๆไป",
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black, height: 5),
                      const SizedBox(height: 20),
                      Center(
                          child: MyStyle()
                              .fonBack15("เงื่อนไขการห้องประมูลสินค้า")),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 1.)"),
                      MyStyle().fonBack12(
                        "สินค้าที่นำเข้ามาจำหน่ายในแอพต้องเป็นสินค้าที่ถูกต้องตามกฎหมายและไม่ละเมิดสิทธิ์ของผู้อื่น",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 2.)"),
                      MyStyle().fonBack12(
                        "สินค้าที่ต้องที่ใบอนุญาติในการจำหน่ายต้องแจ้งและแสดงหลักฐานให้ทางแอพทราบก่อนลงขาย",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 3.)"),
                      MyStyle().fonBack12(
                        "ห้ามจำหน่ายสินค้าประเภทเดียวกันหรือใกล้เคียงกับสินค้าที่ทางแอพจัดไว้เพื่อทำการโฆษณาให้กับท่านในการ(เปิดรับโฆษณา)",
                      ),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 4.)"),
                      MyStyle().fonBack12(
                          "การกำหนดระยะเเวลาการส่งมอบสินค้าและจุดส่งมอบสินค้าต้องกำหนดชัดเจน"),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 5.)"),
                      MyStyle().fonBack12(
                          "รูปภาพและเนื้อหารายละเอ๊ยดต้องเป็นไปตามความเป็นจริง"),
                      MyStyle().fonBack15("เงื่อนไข ข้อที่ 6.)"),
                      MyStyle().fonBack12(
                          "การตั้งราคาและจำนวนต้องชัดเจนตามความเป็นจริง"),
                      const Divider(color: Colors.white),
                      MyStyle()
                          .fonBack15("ข้อแนะนำวิธีใช้แอพให้เกิดประโยชน์สูงสุด"),
                      const SizedBox(height: 10),
                      MyStyle().fonBack12(
                        "การลงรูปสินค้าหรือรายละเอียดควรเป็นรูปจากสินค้าตัวจริงและรายละเอียดตามความเป็นจริง จะทำให้ลูกค้าที่ซื้อสินค้าแล้วกลับมาซื้อใหม่อีกในครั้งต่อๆไป",
                      ),
                      MyStyle().fonBack12(
                        "การทำประกันสินค้าที่นำออกประมูลจะสร้างความน่าเชื่อถือให้กับตัวสินค้ามากยิ่งขึ้นและทำให้ผู้ซื้อกล้าที่จะเข้าร่วมประมูลและสู้ราคา",
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 20),
                      MyStyle().fonBack12(
                        "ข้อแนะนำการใช้ห้อง ทางแอพขอสงนการแก้ไขหรือเปลี่ยนแปลงเพิ่มเติมหรือลดเนื้อหาข้อความเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า",
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
