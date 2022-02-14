import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class Bell extends StatefulWidget {
  const Bell({Key? key}) : super(key: key);

  @override
  _BellState createState() => _BellState();
}

class _BellState extends State<Bell> {
  final List<String> items =
      List<String>.generate(20, (index) => "Item:${++index}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar2.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black26,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
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
                                onPressed: () => Navigator.pushNamed(
                                    context, "/profilecontrol"),
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
                      Center(child: MyStyle().fonWhite15("ข้อความของฉัน")),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 3,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                MyStyle().greenColor,
                                            radius: 22,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: const CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 20,
                                                //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            children: [
                                              MyStyle().fonBack12("ชื่อ:"),
                                              MyStyle().fonBack12("รหัส:"),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.auto_delete_outlined,
                                            size: 25,
                                            color: Colors.black45,
                                          ))
                                    ],
                                  ),
                                  //ตัวทำยืดขยายพื้นที่
                                  ExpansionTile(
                                    title:
                                        MyStyle().fonWhite15("รายการข้อความ:"),

                                    //subtitle: Text("data"),
                                    backgroundColor: Colors.black26,
                                    collapsedBackgroundColor: Colors.black26,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      ListTile(
                                        title: MyStyle()
                                            .fonWhite15("data ชื่อเรื่อง"),
                                        subtitle: MyStyle()
                                            .fonWhite15("data เนื้อหา"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
