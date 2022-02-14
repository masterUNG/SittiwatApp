import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class UploadVdoApplication extends StatefulWidget {
  const UploadVdoApplication({Key? key}) : super(key: key);

  @override
  _UploadVdoApplicationState createState() => _UploadVdoApplicationState();
}

class _UploadVdoApplicationState extends State<UploadVdoApplication> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shadowColor: Colors.black,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: screen * 0.6,
                    child: videoFile == null
                        ? const Center(
                            child: Icon(
                              Icons.play_circle_outlined,
                              color: Colors.black38,
                              size: 70,
                            ),
                          )
                        : FittedBox(
                            fit: BoxFit.fill,
                            child: mounted
                                ? Chewie(
                                    controller: ChewieController(
                                      videoPlayerController:
                                          VideoPlayerController.file(
                                              videoFile!),
                                      aspectRatio: 50 / 100, //ขนาดจอแสดง
                                      // autoPlay: true,
                                      // looping: true,
                                      //fullScreenByDefault: true,
                                    ),
                                  )
                                : Container(),
                          ),
                  ),
                  IconButton(
                    onPressed: getImagefromVideo,
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: screen * 0.62,
              child: TextButton.icon(
                icon: const Icon(Icons.save),
                onPressed: () {
                  if (videoFile == null) {
                    normalDialog(
                        context, "file Vdo", "กรุณาใส่ file Vdoด้วยครับ");
                  } else {
                   // uploadPictureToStorage();  ปิดการอัปโหลดไปก่อนจนว่าจะมีการเปิดใช้งานของหน้าหลัก ################################
                    Fluttertoast.showToast(
                      msg: "ขอบคุณมากครับ",
                      timeInSecForIosWeb: 5,
                      fontSize: 20,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    );
                  }
                },
                label: MyStyle().fonWhite15("กด Up Load Video"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late String urlvdo;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("FileVideoขอร่วมบริหารแพรทฟร์อม/product$i.jpg");
    UploadTask storageUploadTask = storageReference.putFile(videoFile!);

    urlvdo = (await (await storageUploadTask).ref.getDownloadURL());
    //print("urlimage=$urlimage");
    insertValueToFireStore();
  }

  Future<void> insertValueToFireStore() async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: prefer_collection_literals
    Map<String, dynamic> map = Map();
    map["videoFile"] = urlvdo;
    await FirebaseFirestore.instance
        .collection("FileVideoขอร่วมบริหารแพรทฟร์อม")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพแต่ ต้องเปลี่ยนเป็น vdo มาแสดง
  File? videoFile;
  final picker = ImagePicker();
  //ชุดนี้ทำกล้องถ่ายรูป แต่ ต้องเปลี่ยนเป็น vdo
  Future getImagefromVideo() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getVideo(source: ImageSource.camera);
    setState(() {
      videoFile = File(pickedImage!.path);
    });
  }
}
