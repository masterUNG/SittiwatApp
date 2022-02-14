import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/import_sponsor_in_story/my_show_sponsor_in_story.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/import_sponsor_in_story/my_show_sponsor_vdo_in_story.dart';
import 'package:sittiwat_app/k_chat/chat_story_room/chat_room_story.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';
import 'package:video_player/video_player.dart';

class RoomProfileStory extends StatefulWidget {
  const RoomProfileStory({Key? key}) : super(key: key);

  @override
  _RoomProfileStoryState createState() => _RoomProfileStoryState();
}

class _RoomProfileStoryState extends State<RoomProfileStory> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      appBar: AppBar(
        
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
          Container(
            child: Center(
              child: Card(
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, "/posstoryroom"),
                  child: SizedBox(
                    width: 190,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 25,
                          width: 160,
                          child: Center(
                            child: MyStyle().fonWhite15("สร้างโพสสตอรี่"),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.pink.shade400,
                            borderRadius: const BorderRadius.only(
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
            ),
          ),
          const SizedBox(width: 50),
        ],
      ),
      body: 
      
      
      StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection("ห้องโพสต์สตอรี่")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  MyStyle().fongreen25("ยังไม่มีโพสต์แสดง"),
                ],
              ),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map(
              (document) {
                return Card(
                  color: Colors.green.shade900,
                  elevation: 1,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
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
                                backgroundColor: Colors.white,
                                radius: 20,
                                //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Expanded(child: ProfileNameGmail()),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MyStyle().fonWhite12("ผู้ติดตาม"),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.pinkAccent.shade200,
                                              size: 18,
                                            ),
                                            onPressed: masterHeart),
                                        MyStyle().fonWhite15('$heart'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //showIconFavorite(),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: MyStyle().fonWhite15(document["user1"])),
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: screen * 0.9,
                            child: Chewie(
                              key: PageStorageKey(document["videoFile"]),
                              controller: ChewieController(
                                //aspectRatio: 50 / 100,
                                aspectRatio: 3 / 2.8,
                                autoInitialize: true,
                                looping: false,
                                autoPlay: false,
                                fullScreenByDefault: false,
                                videoPlayerController:
                                    VideoPlayerController.network(
                                        document["videoFile"]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screen * 0.25,
                            height: screen * 0.23,
                            // child: Center(child: MyStyle().fonWhite12("โซนโฆษณา\nภาพนิ่ง")),
                            child: const Expanded(
                              child: MyShowSponsorInStory(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: screen * 0.25,
                        child: const Expanded(
                          child: MyShowSponsorVdoInStory(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: masterHand),
                              MyStyle().fonWhite15('$hand'),
                              const SizedBox(width: 5),
                              Text('$hand1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red.shade900,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  icon: Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: Colors.red.shade900,
                                    size: 20,
                                  ),
                                  onPressed: masterHand1),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.question_answer_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    masterMouth();

                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ChatRoomStory();
                                      },
                                    );
                                  }),
                              MyStyle().fonWhite15('$mouth'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    masterShard();
                                    // เมื่อทำแอพเสร็จแล้วให้เปลียนลิ้งอันนี้เป็นลิ้งของแอพและผู้โพสสตอรี่  #######################################
                                    Share.share(
                                        "https://play.google.com/store/apps/details?id=com.instivetech.testapp");
                                  }),
                              MyStyle().fonWhite15('$share'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton.icon(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            label: MyStyle().fonWhite15("แก้ไข"),
                            onPressed: () {},
                          ),
                          TextButton.icon(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            label: MyStyle().fonWhite15("ลบทิ้ง"),
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
                );
              },
            ).toList(),
          );
        },
      ),
   
   
   
    );
  }

  Widget showAlert(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen25("KASET HEY"),
      content: MyStyle().fongreen15("คุณต้องการลบโพสทิ้งนะครับ"),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyStyle().fongreen15("ยกเลิก"),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyStyle().fongreen15("ตกลง"),
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

  int hand = 0;
  void masterHand() {
    setState(() {
      hand++;
    });
  }

  int hand1 = 0;
  void masterHand1() {
    setState(() {
      hand1++;
    });
  }

  int mouth = 0;
  void masterMouth() {
    setState(() {
      mouth++;
    });
  }

  int share = 0;
  void masterShard() {
    setState(() {
      share++;
    });
  }
}
