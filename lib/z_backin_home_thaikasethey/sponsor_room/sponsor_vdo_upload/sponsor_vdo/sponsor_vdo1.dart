import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class SponsorVdo1 extends StatefulWidget {
  const SponsorVdo1({Key? key}) : super(key: key);

  @override
  _SponsorVdo1State createState() => _SponsorVdo1State();
}

class _SponsorVdo1State extends State<SponsorVdo1> {
  late double screen;
  @override
  Widget build(BuildContext context) {
     screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("จ่ายค่าโฆษณาVDOแบบที่1")
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
                return  
                
                 Card(
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
                        const SizedBox(height: 10),
                        MyStyle().fonWhite15("โปรโมชั่น  6,000 บาท"),
                        Card(
                          elevation: 1,
                          shadowColor: Colors.black,
                          color: Colors.black12,
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
                                          MyStyle()
                                              .fonWhite15(document["user1"]),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          MyStyle().fonWhite15("ที่อยู่:"),
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
                                          MyStyle().fonWhite15("เบอร์โทร:"),
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
                                          MyStyle()
                                              .fonWhite15("จำนวนเงินที่โอน:"),
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
                                          MyStyle()
                                              .fonWhite15("วันที่โอนเงิน:"),
                                          const SizedBox(width: 10),
                                          MyStyle()
                                              .fonWhite15(document["user5"]),
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
                                          MyStyle()
                                              .fonWhite15(document["user6"]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MyStyle().fonyellouu15("รูปสลีปการโอนเงิน"),
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
                              const Divider(color: Colors.white),
                              const SizedBox(height: 10),
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
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                            ],
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
