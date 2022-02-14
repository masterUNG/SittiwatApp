import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class AdverSponsorVdo5 extends StatefulWidget {
  const AdverSponsorVdo5({Key? key}) : super(key: key);

  @override
  _AdverSponsorVdo5State createState() => _AdverSponsorVdo5State();
}

class _AdverSponsorVdo5State extends State<AdverSponsorVdo5> {
  late double screen;
  @override
  Widget build(BuildContext context) {


    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        automaticallyImplyLeading: false,
        title: MyStyle().fonWhite15("คุณมีรายได้ประมาณ 7 บาท/การกด1ครั้ง"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("uploadVDOโฆษณาแบบที่5")
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
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
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

                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyStyle().fonWhite15("ชื่อสินค้า:"),
                                    const SizedBox(width: 10),
                                    MyStyle().fonWhite15(document["user1"]),
                                  ],
                                ),
                                Row(
                                  children: [
                                    MyStyle().fonWhite15("ชื่อเจ้าของสินค้า:"),
                                    const SizedBox(width: 10),
                                    MyStyle().fonWhite15(document["user2"]),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: screen * 0.3,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.black54, Colors.black12],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow.shade400,
                              ),
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: MyStyle().fonyellouu15("Up Load"),
                              ),
                            ),
                          ],
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
