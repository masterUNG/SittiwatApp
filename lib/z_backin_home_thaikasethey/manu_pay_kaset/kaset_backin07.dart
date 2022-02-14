import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin07 extends StatefulWidget {
  KasetBackin07({Key? key}) : super(key: key);

  @override
  _KasetBackin07State createState() => _KasetBackin07State();
}

class _KasetBackin07State extends State<KasetBackin07> {
  var choice;
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
          "KasetBackin07 รายการผู้ซื้อประกันสินค้าเปิดประมูล",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("จ่ายเงินประกันสินค้าประมูล")
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: MyStyle().greenColor,
                              radius: 22,
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            children: [
                              MyStyle().fonWhite15("data:ชื่อ"),
                              MyStyle().fonWhite12("data:รหัส"),
                            ],
                          ),
                        ],
                      ),
                      MyStyle().fonWhite15("ผู้สั่งซื้อประกันสินค้า"),
                      Card(
                        color: Colors.black12,
                        child: ExpansionTile(
                          title: MyStyle()
                              .fonWhite15("รายระเอียดการซื้อประกันสินค้า"),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("รหัสร้านค้า:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user1"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("ชื่อร้านค้า:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user2"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("ราคาเริ่ม:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user3"]),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      MyStyle()
                                          .fonWhite15("ระยะเวลาส่งสินค้า :"),
                                      const SizedBox(width: 10),
                                      MyStyle().fonWhite15(document["choice"]),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("ชื่อผู้โอน:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user4"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("จำนวนเงินโอน:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user5"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      MyStyle().fonWhite15("เบอร์โทร:"),
                                      const SizedBox(width: 5),
                                      MyStyle().fonWhite15(document["user6"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            MyStyle().fonWhite15("รูปสลีปการโอนเงิน"),
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
                            const SizedBox(height: 10),
                            const Divider(color: Colors.black),
                            const SizedBox(height: 10),
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
                                        child:
                                            MyStyle().fonyellouu20("ถูกต้อง"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
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
