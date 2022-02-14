//รับข้อมูลมาจากหน้า Kaset33 (ชำระค่าสินค้าประมูลชนะ)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class KasetBackin02 extends StatefulWidget {
  KasetBackin02({Key? key}) : super(key: key);

  @override
  _KasetBackin02State createState() => _KasetBackin02State();
}

class _KasetBackin02State extends State<KasetBackin02> {
  //ประกาศตัวแปลของ  ListView.builder
  final List<String> items =
      List<String>.generate(5, (index) => "Item:${++index}");
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
          title: MyStyle().fonWhite15("ชำระค่าสินค้าทั่วไป")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("จ่ายเงินค่าสินค้าทั่วไป")
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyStyle().greenColor,
                              radius: 22,
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white, radius: 20),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyStyle().fonWhite15("data:ชื่อ"),
                                MyStyle().fonWhite12("data:รหัส"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyStyle().fonWhite15("ผู้สั่งซื้อสินค้า"),
                            Row(
                              children: [
                                MyStyle().fonWhite12("ราคารวม"),
                                const SizedBox(width: 5),
                                MyStyle().fonyellouu15("Data"),
                                const SizedBox(width: 5),
                                MyStyle().fonWhite12("บาท"),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          color: Colors.white10,
                          child: ExpansionTile(
                            
                            title: MyStyle()
                                .fonBack15("รายระเอียดสินค้าที่สั่งซื้อ"),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: double.infinity),
                                    Container(
                                      height: 150,
                                      child: Expanded(
                                        child: ListView.builder(
                                            itemCount: items.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const CircleAvatar(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .black54,
                                                                        radius:
                                                                            20),
                                                                    const SizedBox(
                                                                        width:
                                                                            5),
                                                                    Column(
                                                                      children: [
                                                                        MyStyle()
                                                                            .fonBack12("data:ชื่อ"),
                                                                        MyStyle()
                                                                            .fonBack12("data:รหัส"),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            MyStyle().fonWhite12(
                                                                "ผู้ขายสินค้า"),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            MyStyle().fonBack12(
                                                                "รายการ:"),
                                                            MyStyle()
                                                                .fonyellouu12(
                                                                    "data"),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            MyStyle().fonBack12(
                                                                "ราคา:"),
                                                            MyStyle()
                                                                .fonyellouu12(
                                                                    "data"),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    const Divider(color: Colors.black),
                                    Row(
                                      children: [
                                        MyStyle()
                                            .fonBack12("ยอดเงินค่าสินค้ารวม:"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonyellouu15("Data"),
                                      ],
                                    ),
                                    const Divider(color: Colors.black),


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
                                            MyStyle().fonWhite15("รายการโอนเงิน"),
                                            Row(
                                              children: [
                                                MyStyle().fonWhite15("ชื่อผู้โอน:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(document["user1"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle().fonWhite15("ยอดเงินโอน:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(document["user2"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle().fonWhite15("วันที่โอน:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(document["user3"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle().fonWhite15("เวลาโอน:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(document["user4"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle().fonWhite15("เบอร์โทร:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(document["user5"]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                    const SizedBox(height: 10),
                                    MyStyle().fonBack15("รูปสลีปการโอนเงิน"),
                                    Card(
                                      elevation: 3,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: SizedBox(
                                        width: screen * 0.5,
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
                                    const SizedBox(height: 10),
                                    const Divider(color: Colors.black),
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
                                            MyStyle()
                                                .fonWhite15("สถานที่จัดส่ง"),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                MyStyle()
                                                    .fonWhite15("ชื่อ-สกุล:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(
                                                    document["user6"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle()
                                                    .fonWhite15("ที่อยู่:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(
                                                    document["user7"]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                MyStyle()
                                                    .fonWhite15("เบอร์โทร:"),
                                                const SizedBox(width: 10),
                                                MyStyle().fonWhite15(
                                                    document["user8"]),
                                              ],
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
                                                primary:
                                                    Colors.blueGrey.shade900,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                primary:
                                                    Colors.blueGrey.shade900,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                            ],
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
