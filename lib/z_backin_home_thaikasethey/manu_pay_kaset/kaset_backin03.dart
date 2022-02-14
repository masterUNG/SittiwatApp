//รับข้อมูลมาจากหน้า Kaset33 (ชำระค่าสินค้าประมูลชนะ)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin03 extends StatefulWidget {
  KasetBackin03({Key? key}) : super(key: key);

  @override
  _KasetBackin03State createState() => _KasetBackin03State();
}

class _KasetBackin03State extends State<KasetBackin03> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [MyStyle().greenColor, MyStyle().blackColor],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        title: const Text(
          " (ชำระค่าสินค้าประมูลชนะ)",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("จ่ายเงินค่าสินค้าประมูลชนะ").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map(
              (document) {
                return Card(
                  color: Colors.green.shade700,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: MyStyle().greenColor,
                                  radius: 22,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, "/openprofilestory"),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10
                                ),
                                MyStyle().fonyellouu15("Data:โปรไฟ(ผู้ซื้อ)"),
                              ],
                            ),
                            MyStyle().fonyellouu15("Data:วันที่"),
                          ],
                        ),
                        MyStyle().fonWhite15("รายการสินค้าที่ประมูลชนะ"),

                        //ชิ้นที่ 1
                        Card(
                          elevation: 3,
                          shadowColor: Colors.black,
                          color: Colors.green.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              MyStyle().orangeColor,
                                          radius: 22,
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                                context, "/openprofilestory"),
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                              //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyStyle().fonyellouu12(
                                                "Data:โปรไฟ(ผู้ขาย)"),
                                            MyStyle().fonyellouu12("Data:รหัส"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        MyStyle().fonWhite12("รายการสินค้า:"),
                                        const SizedBox(width: 5),
                                        MyStyle().fonWhite12("Data:รายการ:"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite12("จำนวน:"),
                                        const SizedBox(width: 5),
                                        MyStyle().fonWhite12("Data:ชิ้น:"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15(
                                            "มูลค่าสินค้าปิดประมูล:"),
                                            const SizedBox(width: 5),
                                        MyStyle()
                                            .fonyellouu20("Data:จำนวนเงิน:"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          color: Colors.white10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ExpansionTile(
                              title: MyStyle()
                                  .fonBack15("รายการโอนเงินสินค้าประมูลชนะ"),
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  color: MyStyle().telColor01,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ชื่อผู้โอน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user1"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("จำนวนเงิน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user2"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("วันที่โอน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user3"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("เวลาที่โอน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user4"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15("เบอร์โทร:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user5"])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                MyStyle().fonBack15("รูปสลีปการโอนเงิน"),


                                Card(
                                      elevation: 3,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SizedBox(
                                        width: screen * 0.8,
                                        height: screen * 0.5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  document["image"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),



                                const SizedBox(height: 15),
                                MyStyle().fonBack15("รายละเอืยดการวางมัดจำ"),
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  color: MyStyle().telColor01,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ชื่อ-สกุล:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user6"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("วันที่โอน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user7"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15("เวลาโอน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user8"])
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15(
                                                  "รายละเอียดเพื่ม:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user9"])
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // MyStyle().fonorange15("รูปสลีปการโอนเงิน"),
                                // Container(
                                //   color: Colors.black12,
                                //   height: 200,
                                //   width: double.infinity,
                                // ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SizedBox(
                                        width: screen*0.4,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueGrey.shade900,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MyStyle()
                                                .fonorange20("ไม่ถูกต้อง"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SizedBox(
                                        width: screen*0.4,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueGrey.shade900,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MyStyle()
                                                .fonyellouu20("ถูกต้อง"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
