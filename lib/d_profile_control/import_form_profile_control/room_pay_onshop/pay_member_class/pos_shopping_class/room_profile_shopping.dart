import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class RoomProfileShopping extends StatefulWidget {
  const RoomProfileShopping({Key? key}) : super(key: key);

  @override
  _RoomProfileShoppingState createState() => _RoomProfileShoppingState();
}

class _RoomProfileShoppingState extends State<RoomProfileShopping> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/posshopping");
                      },
                      child: SizedBox(
                        width: screen * 0.4,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: screen * 0.32,
                              child: Center(
                                child: MyStyle().fonBack15("โพสขายสินค้า"),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade300,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  topLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(200.0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.local_grocery_store_outlined,
                              size: 20,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SizedBox(
                  width: screen*0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyStyle().fonBack12('โพสทั้งหมด'),
                        MyStyle().fonBack12('โพสแล้ว'),
                        MyStyle().fonBack12('โพสได้อีก'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("ห้องโพสต์ขายสินค้า")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //ListWheelScrollView
            //ListView
            return ListView(
              //  physics: FixedExtentScrollPhysics(),
              //  itemExtent: 250,
              //  perspective: 0.001,
              children: snapshot.data!.docs.map(
                (document) {
                  return Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 350,
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
                                        color: Colors.cyan.shade200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: MyStyle()
                                              .fonBack15(document["choice"]),
                                        )),
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
                                    height: screen * 0.3,
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
                                  height: screen * 0.3,
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
                                            MyStyle().fonWhite12("ราคา"),
                                            const SizedBox(width: 5),
                                            MyStyle()
                                                .fonWhite15(document["user3"]),
                                            const SizedBox(width: 5),
                                            MyStyle().fonWhite12("บาท"),
                                          ],
                                        ),
                                      ),
                                      showShop(context),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            showText40(document),
                            const SizedBox(height: 5),
                            const Divider(color: Colors.black),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton.icon(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  label: MyStyle().fonBack15("แก้ไข"),
                                  onPressed: () {},
                                ),
                                TextButton.icon(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                  label: MyStyle().fonBack15("ลบทิ้ง"),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return showAlert(context);
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
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

  //โซนปุ่มกดซื้อสินค้า
  Row showShop(BuildContext context) {
    return Row(
      children: [
        MyStyle().fonorange20('$mouth'),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(
            Icons.local_grocery_store_outlined,
            color: Colors.white,
            size: 18,
          ),
          onPressed: () {
            masterMouth();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return showAlert(context);
              },
            );
          },
        ),
      ],
    );
  }

  //โชป๊อปอัป
  AlertDialog showAlert(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15(
        "KASET HEY",
      ),
      content: MyStyle().fongreen15(
        "ชุมชนคน เกษตรเฮ ขอขอบคุณครับที่อุดหนุนสินค้า",
      ),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            if (mouth != 0) {
              setState(() {
                mouth--;
              });
            }

            Navigator.pop(context);
          },
          child: MyStyle().fongreen15(
            "ยกเลิก",
          ),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyStyle().fongreen15(
            "ยินดี",
          ),
        ),
      ],
    );
  }

  //รายละเอียดสินค้าและจำนวนคงเหลือ
  Widget showText40(QueryDocumentSnapshot<Object?> document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screen * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle().fonWhite12(document["user2"]),
            ],
          ),
        ),
        SizedBox(
          width: screen * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyStyle().fonWhite12("เหลือ:"),
              const SizedBox(width: 5),
              MyStyle().fonWhite12(document["user4"]),
              const SizedBox(width: 5),
              MyStyle().fonWhite12("ชิ้น"),
            ],
          ),
        )
      ],
    );
  }

  final formKey = GlobalKey<FormState>();
  int mouth = 0;
  get shopping => null;

  void masterMouth() {
    setState(() {
      mouth++;
    });
  }
}
