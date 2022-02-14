import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';


class FileVdoYear extends StatefulWidget {
  const FileVdoYear({ Key? key }) : super(key: key);

  @override
  _FileVdoYearState createState() => _FileVdoYearState();
}

class _FileVdoYearState extends State<FileVdoYear> {
  late double screen;
  @override
  Widget build(BuildContext context) {


    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("uploadVDOโฆษณารายปี")
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
                  color: Colors.green.shade900,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                const SizedBox(width: 10),
                                MyStyle()
                                    .fonWhite15("Data:บอกชื่อเจ้าของโปรไฟ"),
                              ],
                            ),
                            MyStyle().fonWhite15("Data:วันที่"),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 1,
                          shadowColor: Colors.black12,
                          color: Colors.black12,
                          child: ExpansionTile(
                            title: MyStyle()
                                .fonWhite15("รายการไฟภาพโฆษณาแบบที่1:"),
                            children: [
                              Card(
                                color: MyStyle().telColor01,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          MyStyle().fonWhite15("ชื่อสินค้า:"),
                                          const SizedBox(width: 10),
                                          MyStyle()
                                              .fonWhite15(document["user1"]),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          MyStyle()
                                              .fonWhite15("ชื่อเจ้าของสินค้า:"),
                                          const SizedBox(width: 10),
                                          MyStyle()
                                              .fonWhite15(document["user2"]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              MyStyle().fonyellouu15("รูปไฟภาพโฆษณา"),
                              SizedBox(
                                width: screen * 0.95,
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
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      width: screen * 0.4,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueGrey.shade900,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: MyStyle()
                                              .fonorange20("ไม่ถูกต้อง"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      width: screen * 0.4,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueGrey.shade900,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              MyStyle().fonyellouu20("ถูกต้อง"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
 
  }


}