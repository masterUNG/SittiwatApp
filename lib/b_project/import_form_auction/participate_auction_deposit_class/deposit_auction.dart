//สมัครเข้าร่วมประมูลสินค้า
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

class DepositAuction extends StatefulWidget {
  const DepositAuction({Key? key}) : super(key: key);

  @override
  _DepositAuctionState createState() => _DepositAuctionState();
}

class _DepositAuctionState extends State<DepositAuction> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      backgroundColor: MyStyle().telColor03,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.greenAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
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
                  Center(
                      child:
                          MyStyle().fonBack15("เข้าร่วมประมูล/ชำระเงินมัดจำ")),
                  const SizedBox(height: 10)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      formKaset(), //บัญชีบริษัท
                      const SizedBox(height: 20),
                      avatarProfile(), //รูปโปรไฟเจ้าของสินค้า
                      const SizedBox(height: 20),
                      Center(
                          child: MyStyle().fonBack15(
                              "กรุณากรอกรายละเอียดร้านที่จะเข้าร่วมประมูลด้วยครับ")),
                      const SizedBox(height: 20),
                      textDeposit01(), //ชื่อร้าน
                      const SizedBox(height: 15),
                      textDeposit02(), //รหัสร้าน
                      const SizedBox(height: 20),
                      Center(child: MyStyle().fonBack15("รูปสลีปการโอนเงิน")),
                      const SizedBox(height: 20),
                      imageDeposit(), //รูปสลีปโอนเงิน
                      const SizedBox(height: 20),
                      Center(
                          child: MyStyle().fonBack15(
                              "กรุณากรอกรายละเอียดผู้เข้าร่วมประมูลสินค้าด้วยครับ")),
                      const SizedBox(height: 20),
                      textDeposit07(), //ชื่อ-สกุล
                      const SizedBox(height: 15),
                      textDeposit08(), //รหัสสมาชิก
                      const SizedBox(height: 15),
                      textDeposit03(), //จำนวนเงินที่โอน
                      const SizedBox(height: 15),
                      textDeposit04(), //วัน-เดือน-ปี
                      const SizedBox(height: 15),
                      textDeposit05(), //เวลาโอนเงิน
                      const SizedBox(height: 15),
                      textDeposit06(), //เบอร์โทรติดต่อ
                      const SizedBox(height: 20),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 10),
                      // ignore: unnecessary_null_comparison
                      lat == null
                          ? MyStyle().showProgress()
                          : builMapGps(), //ระบุตำแหน่ง GPS
                      builIconSaveMap(), //ปุ่มกดบันทึกพิกัด Map
                      const SizedBox(height: 20),
                      Center(
                          child: MyStyle().fonyellouu12(
                        "ชำระเงินแล้วทางแอพจะทำการจัดส่งรหัส OTP ให้ทางข้อความครับ",
                      )),
                      const SizedBox(height: 30),
                      Container(
                        width: screen * 0.6,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              MyStyle().redColor,
                              MyStyle().orangeColor,
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            if (image == null) {
                              normalDialog(context, "ไม่มีรูปสลีป",
                                  "กรุณาใส่รูปสลีปการโอนเงินวางประมูลด้วยครับ");
                            } else {
                              uploadPictureToStorage();
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                msg:
                                    "สู้ๆให้ชนะนะครับ\nขอบคุณที่เข้าร่วมประมูล\nสินค้าจาก Thai...Kaset Hey ครับ",
                                timeInSecForIosWeb: 5,
                                fontSize: 20,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.white,
                                textColor: Colors.black,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.touch_app,
                            color: Colors.white,
                            size: 30,
                          ),
                          label: MyStyle()
                              .fonWhite15("ส่งข้อมูลเงินวางมัดจำประมูล"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //การเตรียม Firebase ("จ่ายเงินวางมัดจำเข้าประมูล")
  late String user1, user2, user3, user4, user5, user6, user7, user8, urlimage;
  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(100000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference =
        firebaseStorage.ref().child("จ่ายเงินวางมัดจำเข้าประมูล/product$i.jpg");
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
    map["user1"] = user1;
    map["user2"] = user2;
    map["user3"] = user3;
    map["user4"] = user4;
    map["user5"] = user5;
    map["user6"] = user6;
    map["user7"] = user7;
    map["user8"] = user8;
    map["image"] = urlimage;
    await FirebaseFirestore.instance
        .collection("จ่ายเงินวางมัดจำเข้าประมูล")
        .doc()
        .set(map)
        .then((value) {
      // print("ok Firebase");
    });
  }

  //รูปโปรไฟเจ้าของสินค้า
  Row avatarProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: MyStyle().orangeColor,
              radius: 27,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                MyStyle().fonWhite15("ชื่อ :(เจ้าของสินค้า)"),
                MyStyle().fonWhite12("รหัส :(ตามโปไฟ)"),
              ],
            )
          ],
        ),
      ],
    );
  }

  //บัญชีบริษัท
  Card formKaset() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: MyStyle().fonWhite15(
                "กรุณาโอนเงินเข้าร่วมประมูล",
              )),
              MyStyle().fonWhite15(
                "บริษัท ไทยแลนด์เกษตรเฮ จำกัด",
              ),
              MyStyle().fonWhite15(
                "ธนาคาร xxxxxxxxxxxxxx",
              ),
              MyStyle().fonWhite15(
                "สาขาธนาคาร xxxxxxxxxxxxxx",
              ),
              MyStyle().fonWhite15(
                "เลขบัญชีธนาคาร xxxxxxxxxxxxxx",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyStyle().fonWhite15("จำนวนเงินที่ต้องโอน"),
                  MyStyle().fonyellouu15("(ค่าคำนวนมาอัตโนมัติ)"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card textDeposit01() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user1 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อร้าน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit02() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user2 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "รหัสร้าน/สินค้า:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit03() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user3 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "จำนวนเงินที่โอน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit04() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user4 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "วัน-เดือน-ปี :",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit05() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user5 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เวลาโอนเงิน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit06() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user6 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "เบอร์โทรติดต่อ:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card imageDeposit() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Container(
            width: screen * 8,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: image == null ? MyStyle().showLogo2() : Image.file(image!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: getImagefromGallery,
                icon: const Icon(
                  Icons.photo_size_select_actual_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: getImagefromcamera,
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card textDeposit07() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user7 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "ชื่อ-สกุล ผู้โอน:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Card textDeposit08() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.9,
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(25)],
              autofocus: true,
              onChanged: (value) {
                user8 = value;
              },
              decoration: const InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: "รหัสสมาชิก:",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  //ชุดประกาศตัวแปลทำกล้องถ่ายภาพและดึงภาพจากgalleryมาแสดง
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

  //ระบุตำแหน่ง GPS#########################################
  late double lat, lng;
  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
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
          title: "ตำแหน่งผู้ซื้อสินค้า",
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
          color: Colors.yellowAccent,
        ),
        label: MyStyle().fonWhite15("กดบันทึกตำแหน่งเมื่อมาร์คจุดได้แล้ว"),
        onPressed: () {},
      );

  //สิ้นสุด ###################################################

}
