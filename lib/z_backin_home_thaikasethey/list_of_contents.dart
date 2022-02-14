import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';



class ListOfContents extends StatefulWidget {
  const ListOfContents({Key? key}) : super(key: key);

  @override
  _ListOfContentsState createState() => _ListOfContentsState();
}

class _ListOfContentsState extends State<ListOfContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:   SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // fiutter pub run flutter_launcher_icons:main    **คำสั่งเปลี่ยนโลโก้ไอคอนแอบ**
                    //SHA1: F7:B8:F7:E2:9F:19:C6:B4:31:A9:09:A4:C7:EB:76:19:F0:78:43:FE
                    MyStyle().fonWhite15("ค่า \nSHA1: F7:B8:F7:E2:9F:19:C6:B4:31:A9:09:A4:C7:EB:76:19:F0:78:43:FE"),
                    MyStyle().fonWhite15(
                      "import package  \nform_field_validator: ^1.1.0\ncloud_firestore: ^2.5.2\nfirebase_core: ^1.8.0"
                    ),
                     



                     //###########-----------#################--------------###########      


                     // รายชื่อคลาสที่ส่งขึ้นระบบ Firebase Storage และส่งค่าข้ามไป Firebase Cloud Firestore
                     //######### room_pos ############################################ 
                           
                            //## ("ห้องโพสต์สตอรี่")   *     / ส่ง และ รับ ข้อมูลได้ เหลือการปรับปรุงตัวรับวีดีโอให้เสถียนกว่านี้  และปุ่มกดค่าต่างๆ
                            //## ("ห้องโพสต์ขายสินค้า")  *   / ส่ง และ รับ ข้อมูลได้ เหลือระบบการเก็บค่าการกดสั่งซื้อสินค้า
                            //## ("ห้องโพสต์ประมูลสินค้า")  *  / ส่ง และ รับ ข้อมูลได้ เหลือระบบการกดเพิ่มราคาสินค้า และระบบ OTP
                     
                     //######### pay_room ############################################# 
                            //## ("จ่ายเงินค่าสินค้าประมูลชนะ")  *     / ส่ง และ รับ ข้อมูลได้ เหลือทำระบบการจับคู่ของผู้ซื้ผู้ขาย และ ส่งข้อมูลผู้ขายให้กับผู้ซื้อ
                            //## ("จ่ายเงินค่าสินค้าทั่วไป")  *         / ส่ง และ รับ ข้อมูลได้ เหลือทำระบบการสั่งซื้อสินค้า และ แยกสินค้า
                            //## ("ขอคืนเงินวางมัดจำประมูล")  *     / ส่ง และ รับ ข้อมูลได้
                            //## ("จ่ายเงินวางมัดจำเข้าประมูล")  *    / ส่ง และ รับ ข้อมูลได้
                            //## ("จ่ายเงินประกันสินค้าประมูล")   *    / ส่ง และ รับ ข้อมูลได้
                      //####### member_pay_tax #########################################
                            //## ("สมัครสมาชิกรายปี")  *                 / ส่ง และ รับ ข้อมูลได้  เหลือระบบเปิดใช้งาน
                            //## ("ร้านขอใบกำกับภาษีค่าสมาชิกรายปี")      / ส่ง และ รับ ข้อมูลได้
                            //## ("สมัครเปิดห้องประมูล")   *              / ส่ง และ รับ ข้อมูลได้  เหลือระบบเปิดใช้งาน
                     //##### sponsor01 ################################################
                     //######### pay_sponsor_image ####################################
                     //############ upload_image ######################################
                     //############ ("uploadภาพโฆษณาแบบที่1")     / ส่ง และ รับ ข้อมูลได้  และจะทดลองย้ายจากหน้านี้ไปหน้า ผู้ใช้กดเลือกลงโฆษณา
                     //############ ("uploadภาพโฆษณาแบบที่2") 
                     //############ ("uploadภาพโฆษณาแบบที่3") 
                     //############ ("uploadภาพโฆษณาแบบที่4")
                     //############ ("uploadภาพโฆษณาแบบที่5") 
                     //############ ("uploadภาพโฆษณาแบบที่6") 
                     //############ ("uploadภาพโฆษณาแบบที่7") 
                     //############ ("uploadภาพโฆษณาแบบที่8") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่1")           / ส่ง และ รับ ข้อมูลได้  
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่2") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่3") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่4") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่5") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่6") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่7") 
                     //######### ("จ่ายค่าโฆษณาชนิดภาพแบบที่8") 
                     // ##
                     //######### pay_sponsor_vdo ####################################
                     //############ upload_vdo ########################################
                     //############ ("uploadVDOโฆษณาแบบที่1") 
                     //############ ("uploadVDOโฆษณาแบบที่2") 
                     //############ ("uploadVDOโฆษณาแบบที่3") 
                     //############ ("uploadVDOโฆษณาแบบที่4")
                     //############ ("uploadVDOโฆษณาแบบที่5") 
                     //######### ("จ่ายค่าโฆษณาVDOแบบที่1") 
                     //######### ("จ่ายค่าโฆษณาVDOแบบที่2") 
                     //######### ("จ่ายค่าโฆษณาVDOแบบที่3") 
                     //######### ("จ่ายค่าโฆษณาVDOแบบที่4") 
                     //######### ("จ่ายค่าโฆษณาVDOแบบที่5") 
                     // ##
                     //######### vip_sponsor_year ####################################
                     //############ ("uploadVDOโฆษณารายปี")  *
                     //######### ("จ่ายค่าโฆษณาVDOแบบรายปี")  *
                     // ##
                     //######## home_kaset ###########################################
                     //########### application_tset ##################################
                     //############ ("คำขอร่วมบริหารแพรทฟร์อม") 
                     //############ ("คำขอเปิดรับโฆษณา") 
                     //############ ("FileVideoขอร่วมบริหารแพรทฟร์อม") 
                    
                    
                    
                   
                   
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}