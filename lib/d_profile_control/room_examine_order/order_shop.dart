import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class Order1 extends StatefulWidget {
  const Order1({Key? key}) : super(key: key);

  @override
  _Order1State createState() => _Order1State();
}

class _Order1State extends State<Order1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow.shade50,
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.green.shade900,
                    //Colors.greenAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/story"),
                            icon: const Icon(
                              Icons.switch_account_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("สตอรี่")
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: MyStyle().greenColor,
                        radius: 32,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/profilecontrol"),
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("ฉัน")
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: ProfileNameGmail()),
                  const SizedBox(height: 5),
                  Center(child: MyStyle().fonWhite12("Order สินค้าทั่วไป")),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/order1"),
                        icon: const Icon(
                          Icons.store_mall_directory_outlined,
                          color: Colors.white,
                        ),
                        label: MyStyle().fonWhite15("สินค้าทั่วไป"),
                      ),
                      TextButton.icon(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/order2"),
                        icon: const Icon(
                          Icons.gavel_outlined,
                          color: Colors.white,
                        ),
                        label: MyStyle().fonWhite15("สินค้าประมูล"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
           
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                        Center(
                            child:
                                MyStyle().fonBack15("ใบสั่งซื้อสินค้า")),
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
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                        const Divider(color: Colors.red),
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
                        MyStyle().fonBack15("กรุณาจัดส่งภายใน3วัน"),
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
      ),
    );
  }
}
