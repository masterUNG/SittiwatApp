
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/import_form_auction/my_form_auction.dart';
import 'package:sittiwat_app/c_project_profile/import_bar_profile/top_ber_profile.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';


class OpenProfileAuction extends StatefulWidget {
  const OpenProfileAuction({Key? key}) : super(key: key);

  @override
  _OpenProfileAuctionState createState() => _OpenProfileAuctionState();
}

class _OpenProfileAuctionState extends State<OpenProfileAuction> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: Column(
        children: const [
          //บาแทบบน(สำหรับแสดงที่ห้อง openProFileStory ,openProFileShopping ,openProFileAuction)
          BuilAppberOpenProfile(),
          //เนื้อหาส่วนกลางแสดงผลการโพสขายประมูลสินค้า
          Expanded(child: MyFormAuction()),
          
        ],
      ),
      //บาแทบล่าง
      bottomNavigationBar:const BuilNaviBer() ,
     
    );
  }

 
}
