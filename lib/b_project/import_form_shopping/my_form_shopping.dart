//###############################
//หน้ารับค่าและแสดงผลการโพสขายสินค้าทั่วไป (ใช้ส่งต่อไปยังห้อง shopping , open_profile_shopping , และห้องอื่นๆที่ต้องการ)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class MyFormShopping extends StatefulWidget {
  const MyFormShopping({Key? key}) : super(key: key);

  @override
  _MyFormShoppingState createState() => _MyFormShoppingState();
}

class _MyFormShoppingState extends State<MyFormShopping> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
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

            return ListView(
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
                                        context, "/openprofileshopping"),
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
        "THAI KASET HEY",
      ),
      content: MyStyle().fongreen15(
        "ชุมชนคน เกษตรเฮ ขอขอบคุณครับที่อุดหนุนสินค้า\nสินค้าลงตะกล้าแล้ว",
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
