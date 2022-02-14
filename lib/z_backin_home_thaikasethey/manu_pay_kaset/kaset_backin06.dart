//สมัครเข้าร่วมประมูลสินค้ารับมาจากหน้า Kaset10
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin06 extends StatefulWidget {
  KasetBackin06({Key? key}) : super(key: key);

  @override
  _KasetBackin06State createState() => _KasetBackin06State();
}

class _KasetBackin06State extends State<KasetBackin06> {
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
        title: MyStyle().fonWhite15(
          "KasetBackin06 (ขอคืนเงินวางประมูล)",
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("ขอคืนเงินวางมัดจำประมูล")
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
                                const SizedBox(
                                  width: 10,
                                ),
                                MyStyle()
                                    .fonyellouu15("Data:บอกชื่อเจ้าของโปรไฟ"),
                              ],
                            ),
                            MyStyle().fonyellouu15("Data:วันที่"),
                          ],
                        ),
                        ExpansionTile(
                          title: MyStyle()
                              .fonWhite15("รายการขอคืนเงินวางมัดจำประมูล"),
                          children: [
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            MyStyle().fonWhite15(
                                                "ชื่อร้านค้าที่เข้าร่วม"),
                                            MyStyle().fonyellouu15("xxxxx"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            MyStyle().fonWhite15("รหัส"),
                                            MyStyle().fonyellouu15("xxxx"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("ชื่อบัญชี:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user1"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("ธนาคาร:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user2"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("สาขา:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user3"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("เลขที่บัญชี:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user4"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("จำนวนเงินขอคืน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user5"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("เบอร์โทร:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user6"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.white),
                            const SizedBox(height: 5),
                            MyStyle().fonorange15("รูปสลีปการโอนเงิน"),
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
                                      image: NetworkImage(document["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                    Row(
                                      children: [
                                        MyStyle()
                                            .fonWhite15("ชื่อ-สกุล ผู้โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user7"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("วันที่โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user8"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("เวลาโอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user9"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle()
                                            .fonWhite15("จำนวนเงินที่โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle()
                                            .fonWhite15(document["user10"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            MyStyle().fonorange20("ไม่ถูกต้อง"),
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
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                            MyStyle().fonyellouu20("ถูกต้อง"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
