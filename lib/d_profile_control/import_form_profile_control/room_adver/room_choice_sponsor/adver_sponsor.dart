
import 'package:flutter/material.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic1.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic2.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic3.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic4.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic5.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic6.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic7.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_pic8.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_vdo1.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_vdo2.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_vdo3.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_vdo4.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/timer_sponsor/thaim_vdo5.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class AdverSponsor extends StatefulWidget {
  const AdverSponsor({Key? key}) : super(key: key);

  @override
  _AdverSponsorState createState() => _AdverSponsorState();
}

class _AdverSponsorState extends State<AdverSponsor> {
  // ignore: prefer_typing_uninitialized_variables
  var choice;
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              //height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar10.jpg"),
                    fit: BoxFit.cover),
              ),
            ),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black26,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
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
                                onPressed: () => Navigator.pushNamed(
                                    context, "/profilecontrol"),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              icon: const Icon(
                                Icons.touch_app,
                                color: Colors.pinkAccent,
                              ),
                              label: MyStyle().fonWhite15("วิธีใช้งาน/กติกกา"),
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.green.shade900,
                                  barrierColor: Colors.black45,
                                  enableDrag: false,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return popForm();
                                  },
                                );
                              },
                            ),
                            TextButton.icon(
                              icon: const Icon(Icons.touch_app),
                              label:
                                  MyStyle().fonWhite15("ผูกบัญชี/เช็ครายได้"),
                              onPressed: () =>
                                  Navigator.pushNamed(context, "/AdverMonne"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        MyStyle().fonWhite20(
                            "โฆษณาแบบแสดงภาพนิ่ง"), //โซนเลือกโฆษณาชนิดภาพนิ่ง
                        const SizedBox(height: 10),
                        const ThaimPic1(), //ชุดที่1
                        const SizedBox(height: 10),
                        const ThaimPic2(), //ชุดที่ 2
                        const SizedBox(height: 10),
                        const ThaimPic3(), //ชุดที่ 3
                        const SizedBox(height: 10),
                        const ThaimPic4(), //ชุดที่ 4
                        const SizedBox(height: 10),
                        const ThaimPic5(), //ชุดที่ 5
                        const SizedBox(height: 10),
                        const ThaimPic6(), //ชุดที่ 6
                        const SizedBox(height: 10),
                        const ThaimPic7(), //ชุดที่ 7
                        const SizedBox(height: 10),
                        const ThaimPic8(), //ชุดที่ 8

                        const SizedBox(height: 10),
                        const Divider(color: Colors.red, height: 5),
                        const SizedBox(height: 10),
                        //โซนเลือกโฆษณาชนิด Vdo
                        MyStyle().fonWhite20("โฆษณาแบบ VDO "),
                        const SizedBox(height: 10),
                        const ThaimVdo1(), //ชุดที่ 1
                        const SizedBox(height: 10),
                        const ThaimVdo2(), //ชุดที่ 2
                        const SizedBox(height: 10),
                        const ThaimVdo3(), //ชุดที่ 3
                        const SizedBox(height: 10),
                        const ThaimVdo4(), //ชุดที่ 4
                        const SizedBox(height: 10),
                        const ThaimVdo5(), //ชุดที่ 5
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            ),

            
          ],
        ),
      ),
    );
  }

  //กติกา วิธีใช้งาน
  Widget popForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SizedBox(width: 70, child: MyStyle().showLogo())),
            Center(child: MyStyle().fonWhite15("Thai...Kaset Hey")),
            MyStyle().fonWhite15("วิธีใช้งาน"),
            MyStyle().fonWhite15(
                "1.) โฆษณาทุกแบบทุกโซนท่านสามารถกดเลือกโฆษณาที่ต้องการได้โซนละ 1 ชนิด"),
            MyStyle().fonWhite15(
                "2.) เมื่อท่านกดเลือกได้แล้ว ให้กด UpLoad ในส่วนของโซนนั้นๆ ระบบจะส่งโฆษณาชนิดที่ท่านเลือกไปแสดงยังส่วนโพสสตรี่ของท่าน"),
            MyStyle().fonWhite15(
                "3.) นาฬิกาจะเริ่มจับเวลาเมื่อครบ 1 ชม.ระบบจะเปิดให้ท่านสามารถเข้ามากดใหม่ได้อีกครั้งในโซนเดิม"),
            MyStyle().fonWhite15(
                "4.) การเลือกชนิดรูปแบบการโฆษณาทางแอพได้แบ่งออกเป็น 2 ประเภทหลักๆคือ ชนิดแบบ VDO , ภาพนิ่ง ให้ท่านได้เลือกตามความเหมาะสม"),
            MyStyle().fonWhite15(
                "5.) การเลือกประเภทชนิดของโฆษณาทางแอพได้ระบุไว้ภายในใต้เนื้อหาvdo,รูปภาพ มีชื่อเจ้าของโฆษณาและประเภท เพื่อให้ท่านดูได้ว่าโฆษณาเข้ากันได้กับเรื่องราวของท่านหรือไม่"),
            MyStyle().fonyellouu15("6.) แนะนำ"),
            MyStyle().fonWhite15(
                "การเลือกโฆษณาลงในหน้าโพสสตอรี่ควรวางช่วงเวลาและจังหวะให้เหมาะสมจะไม่ทำให้ผูที่ติดตามเบื่อและหายไป"),
            MyStyle().fonyellouu15("หมายเหตุ"),
            MyStyle().fonWhite15(
                "หากผู้ติดตามท่านลดลงต่ำกว่า 900 และยอดกดถูกใจของแต่ละโพสน้อยกว่า 300 ท่านอาจถูกตัดสิทธิ์การเข้าถึงการรับโฆษณาได้"),
            MyStyle().fonyellouu15("วิธีคำนวนรายได้เบื้องต้น"),
            MyStyle().fonWhite15(
                "-กดวางโฆษณาชนิด VDO 1 ครั้ง/1โซน(เฉลี่ย) 5 บาท \n(มีทั้งหมด 5 โซน) \nกดได้ 1ชม. 1 ครั้ง/1โซน = 1ชม. มีรายได้ 25 บาท \n(1 วัน คุณกดได้กี่รอบลองคูณดูนะครับ)"),
            const Divider(color: Colors.red, height: 5),
            MyStyle().fonWhite15(
                "-กดวางโฆษณาชนิด ภาพนิ่ง 1 ครั้ง/1โซน(เฉลี่ย) 3 บาท \n(มีทั้งหมด 5 โซน) \nกดได้ 1ชม. 1 ครั้ง/1โซน = 1ชม. มีรายได้ 15 บาท \n(1 วัน คุณกดได้กี่รอบลองคูณดูนะครับ)"),
            const SizedBox(height: 10),
            const Divider(color: Colors.red, height: 5),
            MyStyle().fonyellouu15(
                "Thai...Kaset Hey ขอให้ท่านโชคดีและพัฒนาศักยาภาพก้าวเข้าไปสู่การเข้าร่วมบริหารแฟรตฟร์อม(แอพ Thai...Kaset Hey) ด้วยกันนะครับ"),
            const SizedBox(height: 10),
            MyStyle().fonorange12(
                "*** วิธีใช้งานและกติกาเบื้องต้นนี้ทางแอพขอสงวนการแก้ไขหรือเปลี่ยนแปลงโดยไม่ต้องแจ้งให้ท่านทราบล่วงหน้า ***"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
