import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';


class UploadFileVdoYear extends StatefulWidget {
  const UploadFileVdoYear({ Key? key }) : super(key: key);

  @override
  _UploadFileVdoYearState createState() => _UploadFileVdoYearState();
}

class _UploadFileVdoYearState extends State<UploadFileVdoYear> {
  late double screen;
  @override
  Widget build(BuildContext context) {
     screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return  
     Scaffold(
      backgroundColor: MyStyle().greenColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: MyStyle().fonWhite25("Thai...Kaset Hey")),
              Center(
                  child:
                      MyStyle().fonWhite15("ยินดีต้อนรับสู่การลงโฆษณา VDO")),
              const SizedBox(height: 15),
              MyStyle()
                  .fonWhite15("-กดปุ่มรูปภาพและเลือกไฟรูปของคุณที่เตรียมไว้"),
              MyStyle().fonWhite15("-เมื่อพร้อมกดปุ่ม Up load "),
              MyStyle()
                  .fonWhite15("-ไฟภาพจะถูกส่งไปตามเงื่อนไขที่ท่านเลือกไว้"),
               builVdo(), //แสดงภาพ VDO
              const SizedBox(height: 15),
              textForm1(),
              const SizedBox(height: 15),
              textForm2(),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: MyStyle().yellouuColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if (videoFile == null) {
                        normalDialog(context, "NO VDO", "กรุณา Up VDO ด้วยครับ");
                      } else {
                        uploadPictureToStorage();
                        Navigator.pushNamed(context, "/OpenAdvertisement");
                        Fluttertoast.showToast(
                          msg:
                              "ขอบคุณทีสนับสนุน\nThai..KasetHey\nข้อมูล Up Load เสร็จแล้ว",
                          timeInSecForIosWeb: 7,
                          fontSize: 20,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        );
                      }
                    },
                    icon: const Icon(Icons.touch_app),
                    label: MyStyle().fonWhite20("Up Load")),
              ),
            ],
          ),
        ),
      ),
    );
 
  }

  // การเตรียม Firebase เนื้อหาชุดที่ 1 โฆษณาด้วยภาพ("uploadVDOโฆษณาแบบที่1")
  late String user1, user2, urlvdo;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("uploadVDOโฆษณารายปี/product$i.jpg");
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
    map["user1"] = user1;
    map["user2"] = user2;
    map["videoFile"] = urlvdo;
    await FirebaseFirestore.instance
        .collection("uploadVDOโฆษณารายปี")
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
    final pickedImage = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      videoFile = File(pickedImage!.path);
    });
  }

   //แสดงภาพ VDO
  Card builVdo() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.black38,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: screen*0.6,
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
                                  VideoPlayerController.file(videoFile!),
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
              Icons.video_settings_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }

  
  Center textForm1() {
    return Center(
      child: SizedBox(
        height: 35,
        width: screen * 0.8,
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(25)],
          onChanged: (value) {
            user1 = value;
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().blueColor04)),
            labelStyle: const TextStyle(
              color: Colors.white38,
            ),
            labelText: "ชื่อสินค้า:",
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Center textForm2() {
    return Center(
      child: SizedBox(
        height: 35,
        width: screen * 0.8,
        child: TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(25)],
          onChanged: (value) {
            user2 = value;
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().blueColor04)),
            labelStyle: const TextStyle(
              color: Colors.white38,
            ),
            labelText: "ชื่อผู้ลงสินค้า:",
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

}