import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
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
                    image: AssetImage("lib/video/backgroundstar7.jpg"),
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
                      Center(child: MyStyle().fonWhite15("รายการร้านโปรดของฉัน")),
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
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, "/openprofilestory"),
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: MyStyle().greenColor,
                                          radius: 22,
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.white70,
                                            radius: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
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
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
          
          
          ],
        ),
      ),
    );
  }
}
