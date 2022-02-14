import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';


class MyHomeKasetHey extends StatefulWidget {
  const MyHomeKasetHey({Key? key}) : super(key: key);

  @override
  _MyHomeKasetHeyState createState() => _MyHomeKasetHeyState();
}

class _MyHomeKasetHeyState extends State<MyHomeKasetHey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        toolbarHeight: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade700,
                Colors.green.shade900,
                MyStyle().greenColor,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: MyStyle().fonyellouu15("Thai... KASET HEY"),
      ),
      body: Card(
        color: Colors.green.shade400,
        elevation: 5,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(100),
        )),
        child: Container(
          width: 380,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: MyStyle().fonWhite25("Thai... KASET HEY")),
                  const SizedBox(
                    height: 15,
                  ),
                  MyStyle().fonWhite12("วัตถุประสงค์แอพพิเคชั่น :"),
                  MyStyle().fonWhite12(
                      "แอพนี้สร้างขึ้นด้วยแรงบรรณดาลใจที่หวังว่าอยากให้เป็นช่องทางการขายสินค้าของชาวเกษตรกรและสินค้าชุมชนชาวบ้านมีรายได้เพิ่มขึ้น"),
                  MyStyle().fonWhite12(
                      "และนอกจากการขายสินค้าแล้วยังสามารถมีรายได้จากช่องทางอื่นๆอีก"),
                  MyStyle().fonWhite12("แอพพิเคชั่น kaset het นี้เปลียบเสมอนชุมชนที่ทุกท่านเข้ามาในแอพนแล้วสามารถบริหารส่วนต่างๆภายในแอพได้เอง"),
                  MyStyle().fonWhite12("การใช้งานและการแบ่งปัน :"),
                  MyStyle().fonWhite12("ทางแอพจะเปิดการบริหารแอพส่วนหนึ่งให้ผู้ที่ใช้แอพได้มีส่วนร่วมในการสอดส่องดูแลกันเอง (จึงเรียกว่าชุมชน)"),
                  MyStyle().fonWhite12("-เช่นการโพสสตอรี่ของบุคคลใดบุคคลหนึ่งที่ไม่เป็นไปตามกฏของทางแอพหรือว่ามิ่นเหม่ในทางไม่เหมาะสมทุกๆท่านที่ใช้แอพสามารถกดลบโพสนั้นๆได้โดยต้องมียอดกดลบมากกว่ายอดถูกใจโพสนั้นจะถูกลบในทันที"),
                  MyStyle().fonWhite12("-หรือท่านใดที่มีความสามารถและทำตามเงื่อนไขได้ก็จะมีรายได้ในช่องทางอื่นๆอีกและอาจได้เป็นผู้บริหารชุมชนนั้นๆ เพื่อที่จะช่วยทางแอพพิเคชั่นพัฒนาร้านค้าให้จำหน่ายสินค้าได้ดียิ่งขึ้น"),
                  MyStyle().fonWhite12("string"),
                  MyStyle().fonWhite12("string"),
                  MyStyle().fonWhite12("string"),
                  MyStyle().fonWhite12("string"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
