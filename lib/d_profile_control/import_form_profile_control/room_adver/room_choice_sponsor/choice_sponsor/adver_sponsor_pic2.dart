import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class AdverSponsorPic2 extends StatefulWidget {
  const AdverSponsorPic2({Key? key}) : super(key: key);

  @override
  _AdverSponsorPic2State createState() => _AdverSponsorPic2State();
}

class _AdverSponsorPic2State extends State<AdverSponsorPic2> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: MyStyle().fonWhite15("คุณมีรายได้ประมาณ 3.3 บาท/การกด1ครั้ง"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("uploadภาพโฆษณาแบบที่2")
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
                  color: Colors.green,
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
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                MyStyle()
                                    .fonWhite15("Data:บอกชื่อเจ้าของโปรไฟ"),
                              ],
                            ),
                            MyStyle().fonWhite15("Data:วันที่"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyStyle().fonWhite15("ชื่อสินค้า:"),
                                    const SizedBox(width: 10),
                                    MyStyle().fonWhite15(document["user1"]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyStyle().fonWhite15("ชื่อเจ้าของสินค้า:"),
                                    const SizedBox(width: 10),
                                    MyStyle().fonWhite15(document["user2"]),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: screen * 0.3,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.black54, Colors.black12],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow.shade400,
                              ),
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: MyStyle().fonyellouu15("Up Load"),
                              ),
                            ),
                          ],
                        ),
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
