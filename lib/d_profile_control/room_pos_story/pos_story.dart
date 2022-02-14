import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name.dart';
import 'package:video_player/video_player.dart';

class PosStoryRoom extends StatefulWidget {
  const PosStoryRoom({Key? key}) : super(key: key);

  @override
  _PosStoryRoomState createState() => _PosStoryRoomState();
}

class _PosStoryRoomState extends State<PosStoryRoom> {
  final formKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.greenAccent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  builAvatar(), //โปรไฟ
                  const SizedBox(height: 15),
                  builText(), //คำบรรณยาย
                  const SizedBox(height: 15),
                  builImage(), //รูปภาพ
                  const SizedBox(height: 15),
                  builIconImage(), //แถวกล้อง
                  const SizedBox(height: 15),
                  builIcon(), //แถวปุ๋มกด
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    color: Colors.black,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.touch_app,
                          color: Colors.white,
                          size: 30,
                        ),
                        label: MyStyle().fonWhite15("โพสตอนนี้"),
                        onPressed: () async {
                          if (videoFile == null) {
                            normalDialog(
                                context, "ไม่มีVDO", "กรุณาใส่VDoด้วยครับ");
                          } else {
                            uploadPictureToStorage();
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row builAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: MyStyle().greenColor,
          radius: 32,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: MyStyle().showLogo(),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(child: ProfileName()),
      ],
    );
  }

  SizedBox builText() {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(200)],
        onChanged: (value) {
          user1 = value;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().blueColor04)),
          labelStyle: const TextStyle(
            color: Colors.black38,
          ),
          labelText: "บรรณยาย:",
          border: InputBorder.none,
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Container builImage() {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      height: 300,
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
    );
  }

  Row builIconImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.video_call,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              getfromVideocamera();
            }),
        IconButton(
          icon: const Icon(
            Icons.video_library,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            getfromVideogallery();
          },
        ),
      ],
    );
  }

  Row builIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: MyStyle().fonWhite12("ถูกใจ"),
          icon: const Icon(
            Icons.thumb_up_alt_outlined,
            color: Colors.black38,
            size: 25,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: MyStyle().fonWhite12("ข้อความ"),
          icon: const Icon(
            Icons.question_answer_outlined,
            color: Colors.black38,
            size: 25,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: MyStyle().fonWhite12("แชร์"),
          icon: const Icon(
            Icons.share_outlined,
            color: Colors.black38,
            size: 25,
          ),
        ),
      ],
    );
  }

  //###########################################################
  File? videoFile;
  final picker = ImagePicker();
  //ชุดนี้ทำกล้องถ่ายรูป แต่ ต้องเปลี่ยนเป็น vdo
  Future getfromVideocamera() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getVideo(source: ImageSource.camera);
    setState(() {
      videoFile = File(pickedImage!.path);
    });
  }

  Future getfromVideogallery() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      videoFile = File(pickedImage!.path);
    });
  }
  //###########################################################

  late String user1, urlPicture;
  //ตัวส่งรูปภาพขึ้น Firebase #######################################################
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("ห้องโพสต์สตอรี่/product$i.jpg");
    UploadTask storageUploadTask = storageReference.putFile(videoFile!);

    urlPicture = await (await storageUploadTask).ref.getDownloadURL();
    insertValueToFireStore();
  }

  Future<void> insertValueToFireStore() async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: prefer_collection_literals
    Map<String, dynamic> map = Map();
    map["user1"] = user1;
    map["videoFile"] = urlPicture;
    await FirebaseFirestore.instance
        .collection("ห้องโพสต์สตอรี่")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }
  // ###################################  ห้องโพสต์สตอรี่

}
