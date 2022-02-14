import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/pop_star_rating/pop_star.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class BuilAppberOpenProfile extends StatefulWidget {
  const BuilAppberOpenProfile({Key? key}) : super(key: key);

  @override
  _BuilAppberOpenProfileState createState() => _BuilAppberOpenProfileState();
}

class _BuilAppberOpenProfileState extends State<BuilAppberOpenProfile> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return AppBar(
      backgroundColor: Colors.green.shade400,
      automaticallyImplyLeading: false,
      toolbarHeight: 140,
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: MyStyle().greenColor,
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screen * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ProfileNameGmail(),
                        SizedBox(height: 5),
                        PopStar(),
                        
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: Colors.green.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.shade400,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: screen * 0.3,
                          height: 30,
                          child: TextButton.icon(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/chatscreen"),
                            icon: const Icon(
                              Icons.question_answer_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                            label: MyStyle().fonWhite12("คุยกับร้านค้า"),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shadowColor: Colors.black,
                        color: Colors.pink.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screen * 0.3,
                          height: 30,
                          child: TextButton.icon(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 16,
                              ),
                              label: MyStyle().fonBack12("กดติดตาม"),
                              onPressed: () {
                                masterHeart();
                                Fluttertoast.showToast(
                                  msg:
                                      "เพิ่มการติดตามแล้ว",
                                  timeInSecForIosWeb: 7,
                                  fontSize: 12,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                );
                              }),
                        ),
                      ),
                      MyStyle().fonBack12('$heart'),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: SizedBox(
                      width: screen * 0.22,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: screen * 0.16,
                            child: Center(
                              child: MyStyle().fonWhite12("สตอรี่"),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(200.0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.sentiment_very_satisfied_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofileshopping"),
                    child: SizedBox(
                      width: screen * 0.22,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: screen * 0.16,
                            child: Center(
                              child: MyStyle().fonWhite12("ร้านค้า"),
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(200.0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.store_mall_directory_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofileauction"),
                    child: SizedBox(
                      width: screen * 0.22,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: screen * 0.16,
                            child: Center(
                              child: MyStyle().fonWhite12("ประมูล"),
                            ),
                            decoration: BoxDecoration(
                              color: MyStyle().telColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(200.0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.gavel_outlined,
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
          ],
        ),
      ],
    );
  }

  int heart = 0;
  void masterHeart() {
    setState(() {
      heart++;
    });
  }
}
