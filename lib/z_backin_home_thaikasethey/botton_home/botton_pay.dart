import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class BottonPay extends StatefulWidget {
  const BottonPay({Key? key}) : super(key: key);

  @override
  _BottonPayState createState() => _BottonPayState();
}

class _BottonPayState extends State<BottonPay> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        toolbarHeight: 50,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.home_work,color: Colors.white,)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child:
                    SizedBox(width: screen * 0.3, child: MyStyle().showLogo())),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowUploadApp(),//ห้องโชตัวเลขผู้โหลดใช้แอพแบบรวมและแยกรายอำเภอ
                      const SizedBox(height: 10),
                      MyStyle().fonBack15("1.) ส่วนควบคุมการสนทนา Chat"),
                      const SizedBox(height: 10),
                      TextChatMD(),//ห้องแชทรวมทีมบริหาร   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      TextChatAdmin(),//ห้องแชท แอดมิน-ลูกค้า   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 15),
                      MyStyle().fonBack15("2.) ส่วนเช็คดูรายการชำระเงินค่าสินค้าต่างๆ"),
                      const SizedBox(height: 10),
                      TextMonne1(),//การชำระเงินค่าซื้อสินค้าทั่วไป   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      TextMonne2(),//การชำระเงินค่าประมูลสินค้าที่ชนะ   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      TextMonne3(),//การขอเงินวางมัดจำคืน ประมูลแพ้   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      TextMonne4(),//เช็คจ่ายเงินวางมัดจำเข้าร่วมประมูล   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 15),
                      MyStyle().fonBack15("3.) ส่วนเช็คดูรายการชำระเงินค่าสมัครสมาชิก"),
                      const SizedBox(height: 10),
                      Mamber1(),//เช็คชำระเงินค่าสมาชิกร้านค้ารายปี  ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      Mamber2(),//เช็คชำระค่าเปิดห้องประมูลสินค้า   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      Mamber3(),//เช็คชำระค่าประกันสินค้าประมูล   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 15),
                      MyStyle().fonBack15("4.) ส่วนเช็คดูรายการชำระเงินค่าโฆษณารายปี"),
                      const SizedBox(height: 10),
                      SponsorYear(),//เช็คชำระค่าโฆษณา Video รายปี   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 15),
                      MyStyle().fonBack15("5.) ส่วนเช็คดูรายการชำระเงินค่าโฆษณาแบบปล่อยกดเอง"),
                      const SizedBox(height: 10),
                      SponsorImage(),//เช็คชำระค่าโฆษณาชนิดภาพ/และไฟภาพ   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      SponsorVideo(),//เช็คชำระค่าโฆษณาชนิด Video /และไฟ Video   ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 15),
                      MyStyle().fonBack15("6.) ส่วนเช็คดูรายการคำขอร่วมบริหาร/เปิดรับโฆษณา"),
                      ApplicationMd(),//ข้อมูลผู้ขอเข้าร่วมบริหารแพรทฟร์อม  ###### ต่อระบบแล้ว ######
                      const SizedBox(height: 10),
                      ApplicationSponsor(),//ข้อมูลผู้ขอเปิดรับโฆษณา   ###### ต่อระบบแล้ว ######

                      const SizedBox(height: 15),
                      MyStyle().fonBack15("7.) ส่วนการโพสค่า Video ส่วนต่างๆของแอพเอง"),
                      const SizedBox(height: 10),
                      VideoShowAppBarSyory(),//Video โปรโหมดแอพขึ้นBarStory
                      const SizedBox(height: 15),

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

  // ignore: non_constant_identifier_names
  Widget ShowUploadApp() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.blueGrey.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("โชยอดผู้โหลดแอพแบบรวม/แยกรายอำเภอ")),
        onPressed: () {},
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextChatMD() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("ห้องแชทรวมทีมบริหาร")),
        onPressed: () => Navigator.pushNamed(context, "/ChatRoomMd"),
        
      ),
    );
  }
 
  // ignore: non_constant_identifier_names
  Widget TextChatAdmin() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("ห้องแชท แอดมิน-ลูกค้า")),
        onPressed: () =>Navigator.pushNamed(context, "/ChatAdmin"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextMonne1() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("การชำระเงินค่าซื้อสินค้าทั่วไป")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin02"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextMonne2() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("การชำระเงินค่าประมูลสินค้าที่ชนะ")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin03"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextMonne3() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("การขอเงินวางมัดจำคืน ประมูลแพ้")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin06"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextMonne4() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คจ่ายเงินวางมัดจำเข้าร่วมประมูล")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin05"),
        
      ),
    );
  }
  
 
 
  // ignore: non_constant_identifier_names
  Widget Mamber1() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระเงินค่าสมาชิกร้านค้ารายปี")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin01"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Mamber2() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระค่าเปิดห้องประมูลสินค้า")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin04"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Mamber3() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระค่าประกันสินค้าประมูล")),
        onPressed: () => Navigator.pushNamed(context, "/kasetbackin07"),
        
      ),
    );
  }


// ignore: non_constant_identifier_names
  Widget SponsorYear() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.blueGrey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระค่าโฆษณา Video รายปี")),
        onPressed: () =>Navigator.pushNamed(context, "/ManuMemberYear"),
        
      ),
    );
  }


  // ignore: non_constant_identifier_names
  Widget SponsorImage() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.blueGrey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระค่าโฆษณาชนิดภาพ/และไฟภาพ")),
        onPressed: () => Navigator.pushNamed(context, "/SponsorPicg"),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SponsorVideo() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.blueGrey.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15("เช็คชำระค่าโฆษณาชนิด Video /และไฟ Video")),
        onPressed: () => Navigator.pushNamed(context, "/SponsorVdo"),
        
      ),
    );
  }

  

  // ignore: non_constant_identifier_names
  Widget VideoShowAppBarSyory() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.lightBlue.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonWhite15(" Video โปรโหมดแอพขึ้นBarStory ")),
        onPressed: ()=>Navigator.pushNamed(context, "/PostVideoTitel") ,
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ApplicationMd() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.amber.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonBack15("ข้อมูลผู้ขอเข้าร่วมบริหารแพรทฟร์อม")),
        onPressed: () => Navigator.pushNamed(context, "/ApplicationBackin01"),
        
      ),
    );
  }

   // ignore: non_constant_identifier_names
   Widget ApplicationSponsor() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.amber.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonBack15("ข้อมูลผู้ขอเปิดรับโฆษณา")),
        onPressed: () => Navigator.pushNamed(context, "/ApplicationBackin02"),
        
      ),
    );
  }



}
