//สมัครเข้าร่วมประมูลสินค้ารับมาจากหน้า Kaset10
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin05 extends StatefulWidget {
  KasetBackin05({Key? key}) : super(key: key);

  @override
  _KasetBackin05State createState() => _KasetBackin05State();
}

class _KasetBackin05State extends State<KasetBackin05> {
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
          "KasetBackin05 (สมัครร่วมประมูล)",
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("จ่ายเงินวางมัดจำเข้าประมูล")
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
                        ExpansionTile(
                          title: MyStyle()
                              .fonWhite15("รายการโอนเงินวางมัดจำประมูล"),
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
                                       children: [
                                         MyStyle().fonWhite15("จำนวนเงินที่ต้องวาง 20% :"),
                                         const SizedBox(width: 10),
                                         MyStyle().fonyellouu15("Data:"),
                                       ],
                                     ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("ชื่อร้าน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user1"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle()
                                            .fonWhite15("รหัสร้าน/สินค้า:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user2"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MyStyle().fonWhite15("รายละเอืยดผู้เข้าร่วม"),
                             MyStyle().fonWhite15(
                                      "รายการโอนเงินค่าวางประมูล20%:"),
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
                                        MyStyle().fonWhite15("ชื่อผู้โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user3"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("รหัสสมาชิก:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user4"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle()
                                            .fonWhite15("จำนวนเงินที่โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user5"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("วันที่โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user6"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("เวลาที่โอน:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user7"]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite15("เบอร์โทร:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user8"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            MyStyle().fonorange15("รูปสลีปการโอนเงิน"),
                            const SizedBox(height: 10),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: SizedBox(
                                    width: screen * 0.4,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey.shade900,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                    width: screen * 0.4,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey.shade900,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MyStyle()
                                              .fonyellouu20("ถูกต้อง")),
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
