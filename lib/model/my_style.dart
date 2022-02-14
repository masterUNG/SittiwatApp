import 'package:flutter/material.dart';

class MyStyle {

  //สร้างหมุนถ่วงเวลาโหลดภาพ หรือ ข้อมูลต่างๆ
  Widget showProgress(){
    return const SizedBox(child: Center(child: CircularProgressIndicator(),));
  }
 
  //ประกาศตัวแปลทำพื้นหลัง
  Widget showbackground1() => Image.asset("images/background1.png");
  Widget showbackground2() => Image.asset("images/background2.png");
  Widget showbackground3() => Image.asset("images/background3.png");


  //ประกาศตัวแปลโลโก้
  Widget showLogo() => Image.asset("images/iconapp01.png");
  Widget showLogo1() => Image.asset("images/logo9.png");
  Widget showLogo2() => Image.asset("images/logoslip.png");
  Widget showLogoPic() => Image.asset("images/pictu3.png");

  //การประกาศค่าตัวแปรของสีที่จะนำไปใช้ในที่ต่างๆ
  Color blueColor = const Color(0xFF050D3A);
  Color bluehiColor =const Color(0xFF363f93);
  Color orangeColor =const Color(0xffF64A1D);
  Color greenColor =const Color(0xff0B2C12);
  Color redhiColor =const Color(0xff85032f);
  Color redColor =const Color(0xffFC0B0B);
  Color blackColor =const Color(0xff000000);
  Color greenhiColor =const Color(0xff07270D);
  Color telColor =const Color(0xFF6E6C6C);
  Color sdColor =const Color(0xFF50473B);
  Color yellouuColor =const Color(0xFFB68E0B);
  Color whColor =const Color(0xFFffffff);

  Color blueColor01 =const Color(0xFF0026ca);
  Color blueColor02 = const Color(0xFF304ffe);
  Color blueColor03 = const Color(0xFF004ecb);
  Color blueColor04 = const Color(0xFF2979ff);
  Color blueColor05 = const Color(0xFF03a9f4);
  Color blueColor06 = const Color(0xFF4fc3f7);
  Color blueColor07 = const Color(0xFF8bf6ff);


  Color redColor01 =const Color(0xffc4001d);
  Color redColor02 =const Color(0xffff1744);
 
  Color purpleColor01 =const Color(0xff4a0072);
  Color purpleColor02 =const Color(0xff7b1fa2);
  Color purpleColor03 =const Color(0xffae52d4);
  
  Color telColor01 =const Color(0xff1b3039);
  Color telColor02 =const Color(0xff445963);
  Color telColor03 =const Color(0xff708690);

  Color textgreenColor =const Color(0xff00c853);
  Widget fonText13(String string) => Text(string,
 style:const TextStyle( fontSize: 13,fontWeight: FontWeight.bold,color: Color(0xff009624),),);

 
  
  //การประกาศตัวแปร ขนาดอักษร และสีตัวอักษร
    Widget fonWhite35(String string) => Text(string,
 style:TextStyle( fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonWhite25(String string) => Text(string,
 style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonWhite20(String string) => Text(string,
 style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonWhite15(String string) => Text(string,
 style:TextStyle( fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonWhite12(String string) => Text(string,
 style:TextStyle( fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonWhite10(String string) => Text(string,
 style:TextStyle( fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white,),);

  Widget fonorange40(String string) => Text(string,
 style:TextStyle( fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orange.shade900,),);


 Widget fonorange25(String string) => Text(string,
 style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange.shade900,),);


 Widget fonorange20(String string) => Text(string,
 style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange.shade900,),);

  Widget fonorange15(String string) => Text(string,
 style:TextStyle( fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orange.shade700,),);

  Widget fonorange12(String string) => Text(string,
 style:TextStyle( fontSize: 12,fontWeight: FontWeight.bold,color: Colors.orange.shade900,),);

  Widget fonorange10(String string) => Text(string,
 style:TextStyle( fontSize: 10,fontWeight: FontWeight.bold,color: Colors.orange.shade900,),);

  Widget fonBack15(String string) => Text(string,
 style:TextStyle( fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,),);

  Widget fonBack12(String string) => Text(string,
 style:TextStyle( fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,),);

  Widget fonBack10(String string) => Text(string,
 style:TextStyle( fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black,),);

Widget fonBack20(String string) => Text(string,
 style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,),);


 Widget fonyellouu15(String string) => Text(string,
 style:TextStyle( fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orange,),);

 Widget fonyellouu20(String string) => Text(string,
 style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange,),);


 Widget fonyellouu25(String string) => Text(string,
 style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange,),);

  Widget fonyellouu12(String string) => Text(string,
 style:TextStyle( fontSize: 12,fontWeight: FontWeight.bold,color: Colors.orange,),);

  Widget fonyellouu10(String string) => Text(string,
 style:TextStyle( fontSize: 10,fontWeight: FontWeight.bold,color: Colors.orange,),);

  Widget fongreen40(String string) => Text(string,
 style:TextStyle( fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

 Widget fongreen25(String string) => Text(string,
 style:TextStyle( fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

 Widget fongreen20(String string) => Text(string,
 style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

  Widget fongreen15(String string) => Text(string,
 style:TextStyle( fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

  Widget fongreen12(String string) => Text(string,
 style:TextStyle( fontSize: 12,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

  Widget fongreen10(String string) => Text(string,
 style:TextStyle( fontSize: 10,fontWeight: FontWeight.bold,color: Colors.green.shade900,),);

}
