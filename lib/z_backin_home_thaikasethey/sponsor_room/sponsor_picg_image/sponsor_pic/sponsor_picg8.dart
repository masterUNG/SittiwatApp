import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SponsorPicg8 extends StatefulWidget {
  const SponsorPicg8({Key? key}) : super(key: key);

  @override
  _SponsorPicg8State createState() => _SponsorPicg8State();
}

class _SponsorPicg8State extends State<SponsorPicg8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("จ่ายค่าโฆษณาชนิดภาพแบบที่8")
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
                  color: MyStyle().telColor02,
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
                                  backgroundColor: MyStyle().orangeColor,
                                  radius: 27,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, "/openprofilestory"),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25,
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
                        MyStyle().fonWhite15("โปรโมชั่น  6,000 บาท"),
                        Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: MyStyle().blueColor01,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          )),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyStyle().greenColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(250),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          color: MyStyle().orangeColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          )),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyStyle().greenColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(250),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                            child: ExpansionTile(
                              title: MyStyle().fonWhite15(
                                  "รายการโอนเงินค่าโฆษณา Vdo รายเดือน:"),
                              children: [
                                Card(
                                  color: MyStyle().telColor01,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("ชื่อผู้โอน:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user1"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("ที่อยู่:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user2"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite15("เบอร์โทร:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user3"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle()
                                                .fonWhite15("จำนวนเงินที่โอน:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user4"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle()
                                                .fonWhite15("วันที่โอนเงิน:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user5"]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            MyStyle()
                                                .fonWhite15("เวลาที่โอนเงิน:"),
                                            const SizedBox(width: 10),
                                            MyStyle().fonyellouu15(
                                                document["user6"]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MyStyle().fonyellouu15("รูปสลีปการโอนเงิน"),
                                Container(
                                  color: Colors.white10,
                                  height: 200,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 10),
                                const Divider(color: Colors.white),
                                const SizedBox(height: 10),
                                MyStyle().fonyellouu15("VDO ที่ลงโฆษณา"),
                                Container(
                                  color: Colors.white10,
                                  height: 200,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: SizedBox(
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
