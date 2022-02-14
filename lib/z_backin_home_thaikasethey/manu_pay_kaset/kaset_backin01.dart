//รับค่ามาจากหน้าเปิดห้องสมาชิกรายปี-เปิดห้องประมูล  Kaset31
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin01 extends StatefulWidget {
  const KasetBackin01({Key? key}) : super(key: key);

  @override
  _KasetBackin01State createState() => _KasetBackin01State();
}

class _KasetBackin01State extends State<KasetBackin01> {
 
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
        title: MyStyle().fonWhite15("ชำระค่าเปิดห้องรายปี / 1,500 บาท"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("สมัครสมาชิกรายปี")
            .snapshots(),
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
                  elevation: 5,
                  shadowColor: Colors.black,
                  color: Colors.green.shade900,
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
                                const SizedBox(width: 10),
                                MyStyle()
                                    .fonyellouu15("Data:บอกชื่อเจ้าของโปรไฟ"),
                              ],
                            ),
                            MyStyle().fonyellouu15("Data:วันที่"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          color: Colors.yellow.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ExpansionTile(
                              title: MyStyle().fonyellouu15("รายการโอนเงิน:"),
                              children: [
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  color: MyStyle().telColor01,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("ชื่อผู้โอน:"),
                                            const SizedBox(width: 10),
                                            MyStyle()
                                                .fonWhite15(document["user1"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("จำนวนเงิน:"),
                                            const SizedBox(width: 10),
                                            MyStyle()
                                                .fonWhite15(document["user2"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("วันที่โอน:"),
                                            const SizedBox(width: 10),
                                            MyStyle()
                                                .fonWhite15(document["user3"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("เวลาที่โอน:"),
                                            const SizedBox(width: 10),
                                            MyStyle()
                                                .fonWhite15(document["user4"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("เบอร์โทร:"),
                                            const SizedBox(width: 10),
                                            MyStyle()
                                                .fonWhite15(document["user5"]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MyStyle().fonBack15("รูปสลีปการโอนเงิน"),
                                const SizedBox(height: 5),
                                Card(
                                  elevation: 3,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                    width: screen * 0.8,
                                    height: screen * 0.5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(document["image"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Divider(color: Colors.red, height: 5),
                                const SizedBox(height: 10),
                                Card(
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  color: MyStyle().telColor01,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        MyStyle().fonWhite15(
                                            "บัญชีร้านค้าจำหน่ายสินค้าได้ให้แอพโอนเข้าบัญชีนี้"),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ชื่อร้าน/สวน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user11"]),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ชื่อ-สกุล:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user12"]),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("รหัสสมาชิก/สวน:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user13"]),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ที่อยู่:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user14"]),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("สถานะ:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["choice"]),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ใบกำกับภาษี:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["choice1"]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle()
                                                  .fonWhite15("ชื่อบัญชี:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user6"]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15("ธนาคาร:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user7"]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15("สาขา:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user8"]),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              MyStyle().fonWhite15("เลขบีญชี:"),
                                              const SizedBox(width: 10),
                                              MyStyle().fonWhite15(
                                                  document["user9"]),
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
                                                  document["user10"]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SizedBox(
                                        width: screen * 0.4,
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
                                        width: screen * 0.4,
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
                        const SizedBox(height: 20),
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
