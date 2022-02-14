import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class RoomProfileAuction extends StatefulWidget {
  const RoomProfileAuction({Key? key}) : super(key: key);

  @override
  _RoomProfileAuctionState createState() => _RoomProfileAuctionState();
}

class _RoomProfileAuctionState extends State<RoomProfileAuction> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade900,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, "/profilecontrol"),
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.orange.shade800,
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.black38,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/posauction");
                      },
                      child: SizedBox(
                        width: screen * 0.5,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: screen * 0.4,
                              child: Center(
                                child: MyStyle().fonWhite15("โพสประมูลสินค้า"),
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(200.0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.gavel_outlined,
                              size: 20,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Card(
                //color: Colors.blueGrey.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MyStyle().fonBack12("รายการปิดการประมูล"),
                      const SizedBox(width: 5),
                      Row(
                        children: [
                          MyStyle().fonBack12("รหัส/"),
                          const SizedBox(width: 5),
                          MyStyle().fonBack15("DATA"),
                          const SizedBox(width: 5),
                          MyStyle().fonBack12("ราคาปิด/ "),
                          const SizedBox(width: 5),
                          MyStyle().fonBack15("DATA"),
                          const SizedBox(width: 5),
                          MyStyle().fonBack12("บาท"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("ห้องโพสต์ประมูลสินค้า")
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
                    elevation: 3,
                    shadowColor: Colors.black,
                    color: Colors.blueGrey.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: MyStyle().greenColor,
                                  radius: 22,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, "/openprofilestory"),
                                    child: const CircleAvatar(
                                      radius: 20,
                                      //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Expanded(child: ProfileNameGmail()),
                                Row(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.cyan.shade200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: MyStyle()
                                            .fonBack15(document["choice4"]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    child: SizedBox(
                                      width: screen * 0.4,
                                      height: 30,
                                      child: Center(
                                          child: MyStyle()
                                              .fonBack15("นำค่าเวลามาใส่")),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    MyStyle().fonWhite12("ผู้เข้าประมูล"),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Card(
                                        child: SizedBox(
                                          width: screen * 0.2,
                                          height: 30,
                                          child: Center(
                                              child:
                                                  MyStyle().fonBack15("DATA")),
                                        ),
                                      ),
                                    ),
                                    MyStyle().fonWhite12("คน"),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 3,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                    width: screen * 0.5,
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
                                SizedBox(
                                  height: screen * 0.5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: screen * 0.35,
                                        child: MyStyle()
                                            .fonWhite15(document["user1"]),
                                      ),
                                      SizedBox(
                                        width: screen * 0.35,
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite12("ราคาเริ่ม"),
                                            const SizedBox(width: 5),
                                            MyStyle()
                                                .fonWhite15(document["user3"]),
                                            const SizedBox(width: 5),
                                            MyStyle().fonWhite12("บาท"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          width: screen * 0.35,
                                          child: MyStyle()
                                              .fonWhite15(document["choice3"])),
                                      SizedBox(
                                          width: screen * 0.35,
                                          child: MyStyle()
                                              .fonWhite15(document["choice1"])),
                                      SizedBox(
                                          width: screen * 0.35,
                                          child: MyStyle()
                                              .fonWhite15(document["choice2"])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            showFormText(document), //แถวโชชื่อ ราคาสินค้า
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            );
          }),
    );
  }

  //แถวโชชื่อ ราคาสินค้า
  Row showFormText(QueryDocumentSnapshot<Object?> document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyStyle().fonWhite12("ราคาปัจจุบัน"),
        MyStyle().fonWhite25("data"),
        MyStyle().fonWhite12("บาท"),
      ],
    );
  }
}
