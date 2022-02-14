
import 'package:flutter/material.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/my_form_story.dart';
import 'package:sittiwat_app/c_project_profile/import_bar_profile/top_ber_profile.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';


//import 'package:stretchy_header/stretchy_header.dart';

class OpenProfileStory extends StatefulWidget {
  const OpenProfileStory({Key? key}) : super(key: key);

  @override
  _OpenProfileStoryState createState() => _OpenProfileStoryState();
}

class _OpenProfileStoryState extends State<OpenProfileStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: const [
          //บาแทบบน(สำหรับแสดงที่ห้อง openProFileStory ,openProFileShopping ,openProFileAuction)
          BuilAppberOpenProfile(),
           //เนื้อหาส่วนกลางแสดงผลการโพสสตอรี่
          Expanded(child: MyFormStory()),
          
        ],
      ),
      
      //บาแทบล่าง
      bottomNavigationBar:const BuilNaviBer() ,
    );
  }

 



  


}
