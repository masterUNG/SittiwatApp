import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile_uid.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/my_form_story.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_dialog.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/year_member.dart';
import 'package:sittiwat_app/utility/check_year_member.dart';
import 'package:video_player/video_player.dart';

class StoryShow extends StatefulWidget {
  const StoryShow({Key? key}) : super(key: key);

  @override
  _StoryShowState createState() => _StoryShowState();
}

class _StoryShowState extends State<StoryShow> {
  late double screen;
  var yearMemberModels = <YearMemberModel>[];

  FlutterLocalNotificationsPlugin flutterLocalNotifiactionPlugin =
      FlutterLocalNotificationsPlugin();
  InitializationSettings? initializationSettings;
  AndroidInitializationSettings? androidInitializationSettings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkExpairYear();
    setupLocalNoti();
    readAllUser();
  }

  int amountBuyer = 0;
  int amountSeller = 0;

  var idCords = <String>[];

  Future<void> readAllUser() async {
    await FirebaseFirestore.instance.collection('user').get().then((value) {
      for (var item in value.docs) {
        UserModel userModel = UserModel.fromMap(item.data());
        switch (userModel.typeuser) {
          case 'user':
            amountBuyer++;
            break;
          case 'shop':
            amountSeller++;
            break;
          default:
        }

        List<String> strings = userModel.cord.split('/');
        print('#15feb strings ==> $strings');
        strings[0] = strings[0].trim();
        print('#15feb string[0] ==>> ${strings[0]}');

        if (idCords.isEmpty) {
          idCords.add(strings[0]);
        } else {
          bool mybool = true;
          for (var item in idCords) {
            if (strings[0] == item) {
              mybool = false;
            }
          }
          if (mybool) {
            idCords.add(strings[0]);
          }
        }
      }

      setState(() {});

      print(
          '#15feb amountUser ==>> $amountBuyer, amountSeller ==>> $amountSeller  idCords ==>>> $idCords');
    });
  }

  Future<void> setupLocalNoti() async {
    androidInitializationSettings =
        const AndroidInitializationSettings('app_icon');
    initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await flutterLocalNotifiactionPlugin.initialize(
      initializationSettings!,
      onSelectNotification: onSelectNoti,
    );
  }

  Future<void> onSelectNoti(String? string) async {
    if (string != null) {
      checkExpairYear();
    }
  }

  Future<void> processShowLocalNoti(String title, String subTitle) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      priority: Priority.high,
      importance: Importance.max,
      ticker: 'test',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotifiactionPlugin.show(
        0, title, subTitle, notificationDetails);
  }

  Future<void> checkExpairYear() async {
    await CheckYearMember(context: context).processCheck().then((value) async {
      var result = value.docs;
      if (result.isEmpty) {
        normalDialog(
            context, '??????????????????????????? ??????????????????????????????', '???????????? ????????????????????????????????? ????????????????????????????????????');
      } else {
        print('#15feb ??????????????????????????????');
        for (var item in result) {
          YearMemberModel yearMemberModel =
              YearMemberModel.fromMap(item.data());
          yearMemberModels.add(yearMemberModel);
        }

        DateTime currentDatetime = DateTime.now();
        DateTime expairDatetime = yearMemberModels[0].expireMember.toDate();
        DateTime startDatetime = yearMemberModels[0].startMember.toDate();

        DateTime notiDatetime = startDatetime.add(const Duration(days: 275));

        print(
            '#15feb current ==> $currentDatetime, expire ==> $expairDatetime');

        print('#15feb notiDatetime ==>> $notiDatetime');

        notiDatetime = currentDatetime; // ???????????????????????????????????????

        if (currentDatetime.compareTo(notiDatetime) == 0) {
          print('#15feb ?????????????????????????????? ????????? ?????????????????????????????????????????????');

          await Timer(const Duration(seconds: 20), () {
            processShowLocalNoti(
                '????????????????????????????????? ?????????????????????', 'ExpDate ==> $expairDatetime');
          });
        } else {
          print('#15feb ????????????????????????????????????');
        }

        if (currentDatetime.isBefore(expairDatetime)) {
          int difDay = expairDatetime.difference(currentDatetime).inDays;
          print('#15feb ????????????????????????????????? $difDay ?????????');

          if (difDay <= 90) {
            normalDialog(context, '??????????????????????????????????????????????????????',
                'expDate ==> $expairDatetime \n ???????????????????????????????????? $difDay ????????? ???????????????????????????');
          }
        } else {
          print('#15feb ?????????????????????????????????');
          normalDialog(context, 'Expair Year Member',
              'Expire year ==> $expairDatetime \n ??????????????? ???????????????????????? year member');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Text(
                "I wish you all happiness every day.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade200,
              expandedHeight: 280,
              floating: false,
              pinned: true,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.vertical_align_center_sharp,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  // videoBarStory(), //????????????????????? VIdeo ???????????????
                  FlexibleSpaceBar(
                    title: bottonSoppingAuction(context),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              fillOverscroll: false,
              child: Center(
                child: Column(
                  children: [
                    barStar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Text('Amount Buyer : '),
                              Text(amountBuyer.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Text('Amount Seller : '),
                              Text(amountSeller.toString()),
                            ],
                          ),
                        ),
                      ],
                    ), //????????????????????????????????????????????????????????????????????????????????? (????????????????????? ????????????????????????)
                    const Expanded(
                        child:
                            MyFormStory()), //???????????????????????????????????????????????????????????????????????????????????????????????????
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //???????????????????????????
      bottomNavigationBar: const BuilNaviBer(),
      floatingActionButton: Column(
        children: [
          Expanded(
            child: FabCircularMenu(
              fabCloseColor: Colors.green.shade300,
              fabOpenColor: Colors.greenAccent,
              fabElevation: 5.0,
              fabSize: 40,
              ringColor: Colors.greenAccent.shade100,
              ringWidth: 40,
              children: [
                const Icon(Icons.tour_outlined,
                    size: 15, color: Colors.black45),
                const Icon(Icons.tour_rounded, size: 20, color: Colors.black54),
                const Icon(Icons.tour_outlined,
                    size: 25, color: Colors.black87),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/OpenAdvertisement"),
                    icon: Icon(Icons.tv_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/chatscreen"),
                    icon: Icon(Icons.question_answer_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, "/order1"),
                    icon: Icon(Icons.receipt_long_outlined,
                        color: MyStyle().telColor01, size: 30)),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/RoomProfileStory"),
                    icon: Icon(Icons.tag_faces_outlined,
                        color: MyStyle().greenhiColor, size: 30)),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  //?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  SizedBox bottonSoppingAuction(BuildContext context) {
    return SizedBox(
      width: screen * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 3,
              shadowColor: Colors.black,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, "/shopping"),
                child: SizedBox(
                  width: screen * 0.18,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 13,
                        width: screen * 0.14,
                        child: Center(
                          child: MyStyle().fonWhite10("?????????????????????"),
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
                        size: 13,
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
                onTap: () => Navigator.pushNamed(context, "/auction"),
                child: SizedBox(
                  width: screen * 0.18,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 13,
                        width: screen * 0.14,
                        child: Center(
                          child: MyStyle().fonWhite10("??????????????????"),
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
                        size: 13,
                        color: Colors.black,
                      )
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

  //????????????????????? VIdeo ???????????????
  Widget videoBarStory() {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 4),
          reverse: true,
          autoPlay: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: 0.98,
        ),
        items: [
          ClipPath(
            clipper: MyCustomClipperForAppBer(),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Chewie(
                controller: ChewieController(
                  aspectRatio: 4 / 2,
                  autoInitialize: true,
                  looping: true,
                  autoPlay: true,
                  fullScreenByDefault: false,
                  videoPlayerController:
                      VideoPlayerController.asset("lib/video/intorlkaset3.mp4"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //????????????????????????????????????????????????????????????????????????????????? (????????????????????? ????????????????????????)
  Widget barStar() {
    return CarouselSlider(
      options: CarouselOptions(
        height: screen * 0.2,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        viewportFraction: 0.4,
      ),
      items: [
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar1.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar2.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar3.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar4.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar5.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar6.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar7.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar8.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar9.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 3,
          shadowColor: Colors.black,
          color: Colors.green.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: screen * 0.4,
              height: screen * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("lib/video/backgroundstar10.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/openprofilestory"),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      //backgroundImage: ??????????????????????????????????????????????????????????????????????????????,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screen * 0.1, child: MyStyle().showLogo()),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 20,
                          ),
                          MyStyle().fongreen12(" Kaset"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
