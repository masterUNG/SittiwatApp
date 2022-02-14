import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/import_form_auction/increasc_the_price_import.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class MyFormAuction extends StatefulWidget {
  const MyFormAuction({Key? key}) : super(key: key);

  @override
  _MyFormAuctionState createState() => _MyFormAuctionState();
}

class _MyFormAuctionState extends State<MyFormAuction> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
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
                                        context, "/openprofileauction"),
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
                                      color: Colors.green.shade900,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: MyStyle()
                                            .fonWhite15(document["choice4"]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            showFormExpan(
                                document), //รายละเอียดสินค้าและเงื่อนไข
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
                                          image: NetworkImage(
                                            document["image"],
                                          ),
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
                                        child: MyStyle().fonWhite12(
                                          document["user1"],
                                        ),
                                      ),

                                      SizedBox(
                                        width: screen * 0.35,
                                        child: Row(
                                          children: [
                                            MyStyle().fonWhite12("ราคาเริ่ม"),
                                            const SizedBox(width: 5),
                                            MyStyle().fonWhite15(
                                              document["user3"],
                                            ),
                                            const SizedBox(width: 5),
                                            MyStyle().fonWhite12("บาท"),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        width: screen * 0.35,
                                        child: MyStyle().fonWhite12(
                                          document["choice3"],
                                        ),
                                      ),

                                      SizedBox(
                                        width: screen * 0.35,
                                        child: MyStyle().fonWhite12(
                                          document["choice1"],
                                        ),
                                      ),

                                      SizedBox(
                                        width: screen * 0.35,
                                        child: MyStyle().fonWhite12(
                                          document["choice2"],
                                        ),
                                      ),

                                      showIconUser(
                                          context), //ปุ่มกดสมัครเข้าร่วม
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const IncreascThePrice(),
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

  //ปุ่มกดสมัครเข้าร่วม
  Card showIconUser(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/depositauction"),
        child: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              Container(
                height: 25,
                width: 80,
                child: Center(child: MyStyle().fonWhite12("เข้าร่วม")),
                decoration: BoxDecoration(
                  color: MyStyle().telColor01,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(200.0),
                  ),
                ),
              ),
              const Icon(
                Icons.fingerprint_outlined,
                size: 20,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  //รายละเอียดสินค้าและเงื่อนไข
  Widget showFormExpan(QueryDocumentSnapshot<Object?> document) {
    return Card(
      color: Colors.yellow.shade100,
      child: ExpansionTile(
        backgroundColor: Colors.grey.shade300,
        title:
            MyStyle().fonBack12("รายละเอียดสินค้าและเงื่อนไขการเข้าร่วมประมูล"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyStyle().fonBack12("รายละเอียดสินค้า:-"),
                SizedBox(
                    width: double.infinity,
                    child: MyStyle().fonBack12(document["user2"])),
                const Divider(color: Colors.white),
                MyStyle()
                    .fonBack12("รายละเอียดเงื่อนไขการเข้าร่วมประมูลเพิ่มเติม:"),
                MyStyle().fonBack12("1 )."),
                MyStyle().fonBack12(
                    "ผู้เข้าร่วมประมูลจะต้องวางเงินมัดจำค่าสินค้าเป็นจำนวนเงิน 10 % ของราคาเริ่มต้น โดยการโอนเข้าบัญชีของทางแอพที่จัดเตรียมไว้ (กดปุ่มเข้าร่วม)"),
                MyStyle().fonBack12("2 )."),
                MyStyle().fonBack12(
                    "เมื่อท่านสมัครเข้าร่วมการประมูลและโอนเงินเรียบร้อยแล้วทางแอพจะทำการจัดส่ง รหัส/ Password ให้ท่านทางห้องรับข้อความ (กระดิ่ง) ท่านถึงจะสามารถเพิ่มราคาประมูลได้"),
                MyStyle().fonBack12("3 )."),
                MyStyle().fonBack12(
                    "-กรณีท่านแพ้การประมูลให้ทำการส่งข้อมูลให้ทางแอพเพื่อขอรับเงินวางมัดจำคืนทางแอพจะทำการโอนเงินคืนให้ท่าน (ให้ท่านกดเข้าไปที่ปุ่มรถเข็น)"),
                MyStyle().fonBack12(
                    "-กรณีท่านเป็นผู้ที่ประมูลชนะให้ท่านเช็ครายการสินค้าและชำระเงินได้ทันที (ให้ท่านกดเข้าไปที่ปุ่มรถเข็น หรือ กดชำระเงินในห้องประมูลส่วนตัว)"),
                MyStyle().fonBack12(
                    "-กรณีท่านเป็นผู้ที่ประมูลชนะรายระเอียดสินค้าเพิ่มเติมและจุดรับมอบสินค้าจะถูกส่งเข้าที่กล่องข้อความ (ปุ่มกระดิ่ง)"),
                MyStyle().fonBack12("4 )."),
                MyStyle().fonBack12(
                    "-กรณีการรับสินค้าหากท่านตรวจสอบเป็นที่พอใจแล้วให้กดรับสินค้า เพื่อทางแอพจะทำการโอนเงินค่าสินค้าให้กับเจ้าของสินค้า"),
                MyStyle().fonBack12("5 )."),
                MyStyle().fonBack12(
                    "-กรณีเกิดข้อผิดพลาดสินค้าไม่มีการส่งมอบให้ท่านในเวลาที่กำหนด ให้ท่านกดไม่ได้รับสินค้า ทางแอพจะทำการโอนเงินวางมัดจำการประมูลคืนให้กับท่าน"),
                MyStyle().fonBack12(
                    "-5.1 ) กรณีสินค้ามีการทำประกัน แอพโอนคืนเงินวางมัดจำสินค้าที่เข้าร่วมประมูล 10 % และ + 5 % ของมูลค่าสินค้าเริ่มต้น ให้แก่ท่าน"),
                MyStyle().fonBack12(
                    "-5.2 ) กรณีสินค้าไม่มีการทำประกัน แอพโอนคืนเงินวางมัดจำสินค้าที่เข้าร่วมประมูล 10 % "),
                MyStyle().fonBack12(
                    "หมายเหตุ:การขอเงินคืนท่านต้องอยู่ ณ. จุดรับมอบสินค้าพร้อมเจ้าของสินค้า แล้วจึงกด ไม่ได้รับสินค้า"),
                MyStyle().fonBack12("6 )."),
                MyStyle().fonBack12(
                    "-กรณีท่านประมูลสินค้าได้ท่านจะต้องโอนเงินค่าสินค้าคงเหลือภายใน 24 ชม. หลังมีการปิดประมูลสินค้า"),
                MyStyle().fonBack12(
                    "-กรณีท่านประมูลสินค้าเป็นผู้ชนะแต่ไม่มีการรับสินค้าตามที่กำหนด ทางแอพถือว่าท่านสละสิทธิ์ และจะถูกลิบเงินวางมัดจำการประมูลเพื่อส่งให้เจ้าของสินค้าเป็นการบันเทาความเสียหายที่เกิดขึ้น"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
