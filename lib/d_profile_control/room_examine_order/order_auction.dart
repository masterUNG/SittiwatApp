import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class Order2 extends StatefulWidget {
  Order2({Key? key}) : super(key: key);

  @override
  _Order2State createState() => _Order2State();
}

class _Order2State extends State<Order2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: MyStyle().fonWhite15("หน้าแจ้งรายการสั่งซื้อสินค้า"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 35,
                  width: 150,
                  color: Colors.amber.shade100,
                  child: TextButton.icon(
                      onPressed: () => Navigator.pushNamed(context, "/order1"),
                      icon: const Icon(Icons.store_mall_directory_outlined),
                      label: MyStyle().fonBack15("สินค้าทั่วไป"))),
              Container(
                  height: 35,
                  width: 150,
                  color: Colors.blueGrey.shade200,
                  child: TextButton.icon(
                      onPressed: () => Navigator.pushNamed(context, "/order2"),
                      icon: const Icon(Icons.gavel_outlined),
                      label: MyStyle().fonBack15("สินค้าประมูล"))),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: MyStyle().fongreen25("Order สินค้าประมูล")),
              const SizedBox(width: 10),
              const Icon(Icons.gavel_outlined),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyStyle().fonBack15(
                              "บริษัท ไทยแลนด์เกษตรเฮ จำกัด\nที่อยู่ xxxxxxxxxxxxx "),
                          Row(
                            children: [
                              MyStyle().fonBack15("ออกวันที่ :"),
                              MyStyle().fonorange15("Data"),
                            ],
                          )
                        ],
                      ),
                      Center(child: MyStyle().fonBack15("ใบสั่งซื้อสินค้า")),
                      const Divider(color: Colors.red),
                      Row(
                        children: [
                          MyStyle().fonBack15("ผู้ขาย : "),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white12,
                                radius: 30,
                                child: MyStyle().showLogo1(),
                              ),
                              Column(
                                children: [
                                  MyStyle().fongreen15("data:ชื่อ"),
                                  MyStyle().fongreen12("data:รหัส"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(color: Colors.red),
                      Card(color: Colors.white10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  MyStyle().fonBack15("รหัส"),
                                  MyStyle().fonorange15("Data"),
                                  MyStyle().fonBack15("รวม"),
                                ],
                              ),
                              Column(
                                children: [
                                  MyStyle().fonBack15("รายการสินค้า"),
                                  MyStyle().fonorange15("Data"),
                                  MyStyle().fonBack15(""),
                                ],
                              ),
                              Column(
                                children: [
                                  MyStyle().fonBack15("จำนวน"),
                                  MyStyle().fonorange15("Data"),
                                  MyStyle().fonorange15("Data"),
                                ],
                              ),
                              Column(
                                children: [
                                  MyStyle().fonBack15("ราคา"),
                                  MyStyle().fonorange15("Data"),
                                  MyStyle().fonorange15("Data"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: Colors.red),
                      Row(
                        children: [
                          MyStyle().fonBack15("กำหนดส่งมอบสินค้า : วันที่"),
                          MyStyle().fonorange15("Data"),
                        ],
                      ),
                      MyStyle().fonBack15("สถานที่จัดส่ง :"),
                      Row(
                        children: [
                          MyStyle().fonBack15("ชื่อ :"),
                          MyStyle().fonorange15("Data"),
                        ],
                      ),
                      Row(
                        children: [
                          MyStyle().fonBack15("ที่อยู่ :"),
                          MyStyle().fonorange15("Data"),
                        ],
                      ),
                      Row(
                        children: [
                          MyStyle().fonBack15("เบอร์โทร :"),
                          MyStyle().fonorange15("Data"),
                        ],
                      ),
                      const Divider(color: Colors.red),
                      Row(
                        children: [
                          MyStyle().fonBack15("ผู้ซื้อ : "),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white12,
                                radius: 30,
                                child: MyStyle().showLogo(),
                              ),
                              Column(
                                children: [
                                  MyStyle().fongreen15("data:ชื่อ"),
                                  MyStyle().fongreen12("data:รหัส"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyStyle().fonorange15("หมายเหตุ : "),
                            MyStyle().fonBack12(
                                "กรณีสินค้าไม่เป็นไปตามที่โพสจำหน่ายไว้ผู้รับมีสิทธิ์ไม่รับสินค้าและไม่ต้องรับผิดชอบใดๆทั้งสิ้น"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.grey.shade300,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: MyStyle().showLogo(),
                                ),
                                const SizedBox(width: 15),
                                MyStyle().fonBack15(
                                    "ผู้สั่ง บริษัท ไทยแลนด์เกษตรเฮ จำกัด"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
