//ห้องโพสขายสินค้าประมูล ส่งข้อมูลไปเก็บที่ Firebase และส่งไปที่ห้องระบบหลังบ้านที่่ KasetBackin03
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class PosAuction extends StatefulWidget {
  const PosAuction({Key? key}) : super(key: key);

  @override
  _PosAuctionState createState() => _PosAuctionState();
}

class _PosAuctionState extends State<PosAuction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  showAvatar(),
                  const SizedBox(height: 10),
                  builImage(),
                  const SizedBox(height: 10),
                  builCamara(), //ปุ่มกดกล้อง-เลือกภาพ
                  const SizedBox(height: 10),
                  builTitle(context),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),
                  builChoice(), //ช้อยเลือกประเภทสินค้า
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),

                  builChoice02(context), //ช้อยเลือกประกันสินค้า
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),

                  builChoice03(), //ช้อยเลือกกำหนดส่งสินค้า
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),
                  builChoice04(), //ช้อยเลือกระบุการส่งสินค้า
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),
                  builPoint(), //รายระเอียดจุดนัดส่งสินค้า
                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),
                  const SizedBox(height: 10),
                  MyStyle().fonBack15("ระบุตำแหน่งส่งมอบสินค้า"),
                  const SizedBox(height: 10),                
                  // ignore: unnecessary_null_comparison
                  lat == null
                      ? MyStyle().showProgress()
                      : builMapGps(), //ระบุตำแหน่ง GPS
                  builIconSaveMap(), //ปุ่มกดบันทึกพิกัด Map
                  Divider(color: Colors.orange.shade900),
                  builFormAuction(), //เงื่อนไขการโพสประมูล
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellowAccent.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          if (image == null) {
                            normalDialog(context, "ไม่มีรูปภาพ",
                                "กรุณาใส่รูปสินค้าด้วยครับ");
                          }
                          if (choice4 == null) {
                            normalDialog(context, "ประเภทสินค้า",
                                "กรุณากดเลือกระบุประเภทของสินค้าด้วยครับ\nผู้ซื้อจะหาสินค้าของท่านง่ายขึ้นครับ");
                          }
                          if (choice3 == null) {
                            normalDialog(context, "ประกันสินค้า",
                                "กรุณาเลือกระบุประเภทการ\nทำประกันสินค้า\nไม่ทำประกันสินค้า\nด้วยครับ");
                          }
                          if (choice1 == null) {
                            normalDialog(context, "กำหนดส่งสินค้า",
                                "กรุณาเลือกระบุกำหนดระยะเวลาวันส่งมอบสินค้าด้วยครับ");
                          }
                          if (choice2 == null) {
                            normalDialog(context, "การส่งมอบสินค้า",
                                "กรุณาเลือกระบุวิธีการส่งมอบสินค้าด้วยครับ");
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return showAlert(context);
                              },
                            );
                          }
                        },
                        child: MyStyle().fongreen15("โพสประมูลทันที"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row showAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: MyStyle().greenColor,
          radius: 27,
          child: const CircleAvatar(
            radius: 25,
            //backgroundImage: ตัวนี้เป็นการนำรูปภาพมาใส่,
            backgroundColor: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(child: ProfileNameGmail()),
      ],
    );
  }

  Padding builImage() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: image == null ? MyStyle().showLogo() : Image.file(image!),
        ),
      ),
    );
  }

  //ปุ่มกดกล้อง-เลือกภาพ
  Row builCamara() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.add_photo_alternate,
            color: Colors.black38,
            size: 20,
          ),
          onPressed: getImagefromGallery,
        ),
        IconButton(
          icon: const Icon(
            Icons.add_a_photo,
            color: Colors.black38,
            size: 20,
          ),
          onPressed: getImagefromcamera,
        ),
      ],
    );
  }

  AlertDialog showAlert(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15("KASET HEY"),
      content: MyStyle().fonyellouu15(
        "ตรวจสอบรายละเอียดการจะโพสประมูลดีแล้วนะครับ\nโพสออกไปแล้วไม่สามารถแก้ไขได้นะครับ",
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: MyStyle().fongreen15("ตรวจสอบอีกรอบ"),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                uploadPictureToStorage();
                Fluttertoast.showToast(
                  msg: "ขอให้ได้ราคาสูงๆนะครับ",
                  timeInSecForIosWeb: 5,
                  fontSize: 20,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                );
                Navigator.pushNamed(context, "/profilecontrol");
              },
              child: MyStyle().fongreen15("โพสเลย"),
            ),
          ],
        ),
      ],
    );
  }

  Column builTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 150,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(15)],
            onChanged: (value) {
              user1 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.black38,
              ),
              labelText: "ชื่อสินค้า:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 30,
          width: 150,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(8)],
            onChanged: (value) {
              user3 = value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.black38,
              ),
              labelText: "ราคาเริ่ม:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 300,
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(100)],
            maxLines: 3,
            onChanged: (value) {
              user2 = value;
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().blueColor04)),
              labelStyle: const TextStyle(
                color: Colors.black38,
              ),
              labelText: "รายละเอียด:",
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ],
    );
  }

//แถวปุ่มกดเลือกประเภทสินค้า
  Card builChoice() {
    return Card(
      color: Colors.amber.shade100,
      child: ExpansionTile(
        backgroundColor: MyStyle().telColor02,
        title: MyStyle().fonBack15("เลือกประเภทสินค้าที่ขายด้วยครับ:"),
        children: [
          Column(
            children: [
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวนผลไม้",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สวนผลไม้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวนผัก",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สวนผัก"),
              ),
               RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "อาหาร",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("อาหาร"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ปศุสวัตว์",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("ปศุสวัตว์"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สวัตว์เลี้ยง",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สวัตว์เลี้ยง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าชุมชน",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าชุมชน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "งานแฮนเมค",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("งานแฮนเมค"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เครื่องเกษตร",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("เครื่องเกษตร"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "กล้าไม้",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("กล้าไม้"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พระเครื่อง",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("พระเครื่อง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "แฟชั่น",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("แฟชั่น"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "บ้าน-ที่ดิน",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("บ้าน-ที่ดิน"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้ามือสอง",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้ามือสอง"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "เฟอร์นิเจอร์",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("เฟอร์นิเจอร์"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าทั่วไป",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าทั่วไป"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าใกล้ตัว",
                groupValue: choice4,
                onChanged: (var value) {
                  setState(() {
                    choice4 = value;
                  });
                },
                title: MyStyle().fonWhite15("สินค้าใกล้ตัว"),
              ),
            ],
          )
        ],
      ),
    );
  }

  //ช้อยเลือกประกันสินค้า
  Widget builChoice02(BuildContext context) {
    return Card(
      color: Colors.amber.shade100,
      child: ExpansionTile(
        backgroundColor: MyStyle().telColor02,
        title: MyStyle().fonBack15(" สินค้าชิ้นนี้ทำประกันหรือไม่:"),
        children: [
          Column(
            children: [
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้าไม่ทำประกัน",
                groupValue: choice3,
                onChanged: (var value) {
                  setState(() {
                    choice3 = value;
                  });
                },
                title: MyStyle().fonWhite10("( ไม่ทำประกัน )"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "สินค้ามีทำประกัน",
                groupValue: choice3,
                onChanged: (var value) {
                  setState(() {
                    choice3 = value;
                  });
                  //ต่อเข้าห้องโอนเงินค่าประกันสินค้า
                  Navigator.pushNamed(context, "/guarantee");
                },
                title: MyStyle().fonWhite10("( ทำประกัน )"),
              ),
            ],
          )
        ],
      ),
    );
  }

  //ช้อยเลือกกำหนดส่งสินค้า
  Widget builChoice03() {
    return Card(
      color: Colors.amber.shade100,
      child: ExpansionTile(
        backgroundColor: MyStyle().telColor02,
        title: MyStyle().fonBack15("กำหนดสินค้าพร้อมส่ง:"),
        children: [
          Column(
            children: [
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "พร้อมส่งทันที",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("( พร้อมส่งทันที )"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "กำหนดส่งอีก 15วัน",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("( 15วัน )"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "กำหนดส่งอีก 30วัน",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("( 30วัน )"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "กำหนดส่งอีก 45วัน",
                groupValue: choice1,
                onChanged: (var value) {
                  setState(() {
                    choice1 = value;
                  });
                },
                title: MyStyle().fonWhite10("( 45วัน )"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //ช้อยเลือกระบุการส่งสินค้า
  Widget builChoice04() {
    return Card(
      color: Colors.amber.shade100,
      child: ExpansionTile(
        backgroundColor: MyStyle().telColor02,
        title: MyStyle().fonBack15(" การส่งมอบสินค้า:"),
        children: [
          Column(
            children: [
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ร้านจัดส่ง",
                groupValue: choice2,
                onChanged: (var value) {
                  setState(() {
                    choice2 = value;
                  });
                },
                title: MyStyle().fonWhite10("( ร้านจัดส่ง )"),
              ),
              RadioListTile(
                activeColor: MyStyle().orangeColor,
                value: "ลูกค้ารับเอง",
                groupValue: choice2,
                onChanged: (var value) {
                  setState(() {
                    choice2 = value;
                  });
                },
                title: MyStyle().fonWhite10("( ลูกค้ารับเอง )"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //รายระเอียดจุดนัดส่งสินค้า
  Row builPoint() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              MyStyle().fonBack15("ระบุสถานที่ส่งมอบสินค้า"),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  maxLines: 3,
                  onChanged: (value) {
                    user4 = value;
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: MyStyle().blueColor04)),
                    labelStyle: const TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "รายละเอียด:",
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //ระบุตำแหน่ง GPS#########################################
  late double lat, lng;
  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<void> findLatLng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat = locationData!.latitude!;
      lng = locationData.longitude!;
    });
    // print("lat = $lat, lng = $lng");
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  Set<Marker> myMarker() {
    return <Marker>{
      Marker(
        markerId: const MarkerId("myshoop"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: "ตำแหน่งผู้ขายสินค้า",
          snippet: "ละติจูด = $lat,ลองติจูด = $lng",
        ),
      )
    };
  }

  Container builMapGps() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);
    return Container(
      color: Colors.white54,
      width: double.infinity,
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.satellite,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }

  //ปุ่มกดบันทึกพิกัด Map
  TextButton builIconSaveMap() => TextButton.icon(
        icon: const Icon(
          Icons.save_alt,
          size: 25,
          color: Colors.black,
        ),
        label: MyStyle().fonBack15("กดบันทึกตำแหน่งเมื่อมาร์คจุดได้แล้ว"),
        onPressed: () {},
      );

  //สิ้นสุด ###################################################

  //เงื่อนไขการโพสประมูล
  Card builFormAuction() {
    return Card(
      color: MyStyle().blueColor05,
      child: ExpansionTile(
        backgroundColor: Colors.grey.shade300,
        title: MyStyle()
            .fonBack15("เงื่อนไขการโพสสินค้าประมูลเข้าใจก่อนโพส กด >"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyStyle().fonBack12("1 )."),
                MyStyle().fonBack12(
                  "สินค้าที่นำออกโพสประมูลจะต้องตรงตามความเป็นจริงทั้วภาพและคำอธิบายรายละเอียด",
                ),
                MyStyle().fonBack12("2 )."),
                MyStyle().fonBack12(
                  "-กรณีระบุให้ลูกค้ามารับสินค้าเอง คุณจะต้องลงที่อยู่ และกดระบุพิกัดตำแหน่งให้ชัดเจน",
                ),
                MyStyle().fonBack12("3 )."),
                MyStyle().fonBack12(
                  "-ห้องการประมูลนี้เปลียบเสมอนการซื้อขายสินค้าล่วงหน้าเหมาะกับสินค้าภาคการเกษตรที่ต้องการหาผู้ซื้อก่อนผลผลิตจะเก็บได้เพราะมีช่องกดให้ระบุกำหนดวันส่งมอบสินค้า",
                ),
                MyStyle().fonBack12(
                  "-ห้องการประมูลนี้ยังเหมาะกับสินค้าทุกชนิดทั่วไปที่มีมูลค่าต้องการผู้ซื้อที่มีมาตรฐานในการเข้าร่วมประมูล",
                ),
                MyStyle().fonBack12("4 )."),
                MyStyle().fonBack12(
                  "-แนะนำการทำให้สินค้าของท่านมีความน่าเชื่อถือมากยิ่งขึ้นกับผู้ที่จะเข้าร่วมประมูลหรือผู้ที่เข้าประมูลตัดสินใจในการเพิ่มราคาเพื่อสู้คือ (ทำประกันสินค้า)",
                ),
                MyStyle().fonBack12(
                  "/-เงื่อนไขการทำประกันสินค้า \n-กรณีกดระบุ สินค้าพร้อมส่งทันที คิด 5 % ของราคาสินค้าปิดประมูล \n(ต้องชำระก่อน 5% ของราคาเปิดประมูลก่อนกดโพส)  ",
                ),
                MyStyle().fonBack12(
                  "-กรณีกดระบุ 15 วัน คิด 6% ของราคาสินค้าปิดประมูล \n(ต้องชำระก่อน 6% ของราคาเปิดประมูลก่อนกดโพส)",
                ),
                MyStyle().fonBack12(
                  "-กรณีกดระบุ 30 วัน คิด 7% ของราคาสินค้าปิดประมูล \n(ต้องชำระก่อน 7% ของราคาเปิดประมูลก่อนกดโพส)",
                ),
                MyStyle().fonBack12(
                  "-กรณีกดระบุ 45 วัน คิด 8% ของราคาสินค้าปิดประมูล \n(ต้องชำระก่อน 8% ของราคาเปิดประมูลก่อนกดโพส)",
                ),
                Divider(color: Colors.yellow.shade900),
                MyStyle().fonBack12("การส่งมอบสินค้า"),
                MyStyle().fonBack12("1 )."),
                MyStyle().fonBack12(
                  "-หากท่านส่งมอบสินค้าครบเป็นที่พอใจกับลูกค้าแล้ว ลูกค้าจะกดรับสินค้าแล้วทางแอพจะทำการโอนเงินค่าสินค้าให้ท่านภายใน 24ชม.",
                ),
                MyStyle().fonBack12("2 )."),
                MyStyle().fonBack12(
                  "-หากสินค้าไม่มีการส่งมอบตามกำหนดโดยที่ท่านไม่พร้อมและลูกค้ากดไม่ได้รับสินค้า ร้านท่านจะถูกลดชั้นหรือถอดออกจากแอพ และค่าประกันสินค้าจะเพิ่มขึ้นในครั้งถัดไป",
                ),
                MyStyle().fonBack12("3 )."),
                MyStyle().fonBack12(
                  "-เมือถึงกำหนดส่งมอบแต่ไม่มีการมารับสินค้า(ในกรณีระบุลูกค้ามารับเอง)ทางแอพจะชดเชยค่าสินค้าให้ท่าน 10% จากราคาสินค้าเริ่มประมูล",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง  ห้องโพสต์ประมูลสินค้า
  File? image;
  final picker = ImagePicker();
  //ชุดนี้ทำภาพถ่ายรูป
  Future getImagefromcamera() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  //ชุดนี้ทำถ่ายรูปภาพ
  Future getImagefromGallery() async {
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  //ชุดส่งค่า firebase ############################################
  // ignore: prefer_typing_uninitialized_variables
  var choice3; //เลือกการทำประกันสินค้า
  // ignore: prefer_typing_uninitialized_variables
  var choice1; //เลือกกำหนดสินค้าพร้อมส่ง
  // ignore: prefer_typing_uninitialized_variables
  var choice2; //เลือกการส่งมอบสินค้า
  // ignore: prefer_typing_uninitialized_variables
  var choice4; //เลือกประเภทสินค้า
  late String user1, user2, user3, user4, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("ห้องโพสต์ประมูลสินค้า/product$i.jpg");
    UploadTask storageUploadTask = storageReference.putFile(image!);

    urlimage = (await (await storageUploadTask).ref.getDownloadURL());
    //print("urlimage=$urlimage");
    insertValueToFireStore();
  }

  Future<void> insertValueToFireStore() async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // ignore: prefer_collection_literals
    Map<String, dynamic> map = Map();
    map["choice1"] = choice1;
    map["choice2"] = choice2;
    map["choice3"] = choice3;
    map["choice4"] = choice4;
    map["user1"] = user1;
    map["user2"] = user2;
    map["user3"] = user3;
    map["user4"] = user4;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("ห้องโพสต์ประมูลสินค้า")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }
}
