import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ApplicationSponsor extends StatefulWidget {
  const ApplicationSponsor({Key? key}) : super(key: key);

  @override
  _ApplicationSponsorState createState() => _ApplicationSponsorState();
}

class _ApplicationSponsorState extends State<ApplicationSponsor> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().greenhiColor,
        title: MyStyle().fonWhite15("รายการผู้ขอเปิดรับโฆษณา"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("คำขอเปิดรับโฆษณา")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             Card(
                                elevation: 3,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: SizedBox(
                                  width: screen * 0.5,
                                  height: screen * 0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(document["image"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyStyle().fonWhite12("ชื่อ :"),
                                    MyStyle().fonWhite15(document["user1"]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyStyle().fonWhite12("รหัส :"),
                                    MyStyle().fonWhite15(document["user2"]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Card(
                          color: Colors.white10,
                          child: ExpansionTile(
                            title: MyStyle().fonWhite15("รายละเอียดเพิ่มเติม"),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white10,
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        MyStyle().fonWhite12("เบอร์โทร :"),
                                        const SizedBox(width: 10),
                                        MyStyle().fonWhite15(document["user3"]),
                                      ],
                                    ),
                                    MyStyle().fonWhite12("ที่อยู่ อ. จ. :"),
                                    MyStyle().fonWhite15(document["user4"]),
                                    const SizedBox(height: 5),
                                    MyStyle()
                                        .fonWhite12("รายละเอียดแนะนำตัว :"),
                                    MyStyle().fonWhite15(document["user5"]),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: screen * 0.2,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green.shade700,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child:
                                                  MyStyle().fonWhite15("ผ่าน")),
                                        ),
                                        SizedBox(
                                          width: screen * 0.2,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green.shade700,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: MyStyle()
                                                  .fonWhite15("ไม่ผ่าน")),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
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
              }).toList(),
            );
          }),
    );
  }
}
