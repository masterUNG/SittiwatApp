
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/my_form_shopping.dart';
import 'package:sittiwat_app/c_project_profile/import_bar_profile/top_ber_profile.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';

class OpenProfileShopping extends StatefulWidget {
  const OpenProfileShopping({Key? key}) : super(key: key);

  @override
  _OpenProfileShoppingState createState() => _OpenProfileShoppingState();
}

class _OpenProfileShoppingState extends State<OpenProfileShopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          //บาแทบบน(สำหรับแสดงที่ห้อง openProFileStory ,openProFileShopping ,openProFileAuction)
          BuilAppberOpenProfile(),
          //เนื้อหาส่วนกลาง การแสดงผลโพสขายสินค้าทั่วไป
          Expanded(child: MyFormShopping()),
          
        ],
      ),
      //บาแทบล่าง
      bottomNavigationBar:const BuilNaviBer() ,
    );
  }
}
