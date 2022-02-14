import 'package:flutter/material.dart';
import 'package:sittiwat_app/a_login/kaset_loing.dart';
import 'package:sittiwat_app/a_login/signup.dart';
import 'package:sittiwat_app/a_login/splash_screen_one.dart';
import 'package:sittiwat_app/b_project/imoort_form_story/form_story/my_form_story.dart';
import 'package:sittiwat_app/b_project/import_form_auction/my_form_auction.dart';
import 'package:sittiwat_app/b_project/import_form_auction/participate_auction_deposit_class/deposit_auction.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/my_form_shopping.dart';
import 'package:sittiwat_app/b_project/import_form_shopping/top_bar_slide_choice.dart';
import 'package:sittiwat_app/b_project/room_store_auction/auction.dart';
import 'package:sittiwat_app/b_project/room_store_auction/store_auction.dart';
import 'package:sittiwat_app/b_project/shopping.dart';
import 'package:sittiwat_app/b_project/storyshow.dart';
import 'package:sittiwat_app/c_project_profile/import_bar_profile/top_ber_profile.dart';
import 'package:sittiwat_app/c_project_profile/open_profile_auction.dart';
import 'package:sittiwat_app/c_project_profile/open_profile_shopping.dart';
import 'package:sittiwat_app/c_project_profile/open_profile_story.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/adver_sponsor.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic1.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic2.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic3.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic4.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic5.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic6.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic7.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_pic8.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_vdo1.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_vdo2.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_vdo3.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_vdo4.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/choice_sponsor/adver_sponsor_vdo5.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_adver/room_choice_sponsor/monne_user_class/adver_monne.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onauction/pay_open_auction.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onauction/pos_auction_class/pay_guarantee_class/pay_guarantee.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onauction/pos_auction_class/pos_auction.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onauction/pos_auction_class/room_profile_auction.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onshop/pay_member_class/pay_member.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onshop/pay_member_class/pos_shopping_class/pos_shopping.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onshop/pay_member_class/pos_shopping_class/room_profile_shopping.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_pay_onshop/pay_member_class/tax_member.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/room_shaer_like/sharelike.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/transport_on_map/show_location_map.dart';
import 'package:sittiwat_app/d_profile_control/import_form_profile_control/transport_on_map/transport.dart';
import 'package:sittiwat_app/d_profile_control/profile_control.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/choice_open_advertisement.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/profile_sponsor_image.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image1.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image2.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image3.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image4.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image5.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image6.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image7.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_image/upload_sponsor_image/upload_image8.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/sponsor_one.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/upload_sponsor_video/upload_vdo1.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/upload_sponsor_video/upload_vdo2.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/upload_sponsor_video/upload_vdo3.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/upload_sponsor_video/upload_vdo4.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/pay_upload_sponsor_video/upload_sponsor_video/upload_vdo5.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/vip_year_pay_upload_sponsor/sponsor_vip.dart';
import 'package:sittiwat_app/d_profile_control/room_boy_sponsor/vip_year_pay_upload_sponsor/upload_file_vdo_year.dart';
import 'package:sittiwat_app/d_profile_control/room_examine_order/order_auction.dart';
import 'package:sittiwat_app/d_profile_control/room_examine_order/order_shop.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/my_home_kaset_hey.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/my_story_kaset.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/personal_kaset.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_manage/application_manage_class/application_manage.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_manage/application_manage_class/upload_vdo_application_manage.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_manage/my_enter_manage_kaser.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_sponsor_open/application_get_adve_class/application_get_advet.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/choice_dawer/room_sponsor_open/my_get_advet.dart';
import 'package:sittiwat_app/d_profile_control/room_home_kaser/my_drawer.dart';
import 'package:sittiwat_app/d_profile_control/room_pos_story/pos_story.dart';
import 'package:sittiwat_app/d_profile_control/room_pos_story/room_profile_story.dart';
import 'package:sittiwat_app/e_bar/bell.dart';
import 'package:sittiwat_app/e_bar/botton_ber.dart';
import 'package:sittiwat_app/e_bar/calculate.dart';
import 'package:sittiwat_app/e_bar/heart.dart';
import 'package:sittiwat_app/g_pay_trolley_shopping/icon_pay.dart';
import 'package:sittiwat_app/g_pay_trolley_shopping/pay_auction_class/pay_auction.dart';
import 'package:sittiwat_app/g_pay_trolley_shopping/pay_shopping_class/pay_shopping.dart';
import 'package:sittiwat_app/g_pay_trolley_shopping/refund_auction_class/refund_auction.dart';
import 'package:sittiwat_app/k_chat/chat_room_admin/chat_room_admin.dart';
import 'package:sittiwat_app/k_chat/chat_room_md/chat_room_md.dart';
import 'package:sittiwat_app/k_chat/chat_room_store/chat_store_room.dart';
import 'package:sittiwat_app/k_chat/chat_story_room/chat_room_story.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/application_thaikasethey/application_md.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/application_thaikasethey/application_sponsor.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/botton_home/botton_pay.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/botton_home/bottoncontorl.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/botton_home/profile_backin_thaikasethey.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/list_of_contents.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin01.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin02.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin03.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin04.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin05.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin06.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin07.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/manu_pay_kaset/kaset_backin08.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/manu_sponsor_picg_image.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg1.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg2.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg3.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg4.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg5.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg6.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg7.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/sponsor_pic/sponsor_picg8.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image1.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image2.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image3.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image4.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image6.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image7.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_picg_image/upload_image/file_upload_image8.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/manu_sponsor_vdo_file.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/sponsor_vdo/sponsor_vdo1.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/sponsor_vdo/sponsor_vdo2.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/sponsor_vdo/sponsor_vdo3.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/sponsor_vdo/sponsor_vdo4.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/sponsor_vdo/sponsor_vdo5.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/upload_file_vdo/file_upload_vdo1.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/upload_file_vdo/file_upload_vdo2.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/upload_file_vdo/file_upload_vdo3.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/upload_file_vdo/file_upload_vdo4.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_vdo_upload/upload_file_vdo/file_upload_vdo5.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_year/file_vdo_year.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_year/get_money_member.dart';
import 'package:sittiwat_app/z_backin_home_thaikasethey/sponsor_room/sponsor_year/manu_member_year.dart';



//### ห้อง router แสดงผลการเชื่อมดโยงของห้องต่างๆ และทำการแยกโซน
final Map<String, WidgetBuilder> router = {

  //### lib ###
  // (a_login)#######
  "/login": (BuildContext context) => const Login(),//หน้าloginโดยการใส่รหัสหรือสมัครด้วยเฟสบุ๊คและgoogle
  "/signup01": (BuildContext context) => const Signup01(),//หน้าลงชื่อสมัครสมาชิก
  "/SplashScreenOne": (BuildContext context) => const SplashScreenOne(),//ห้องทำฉากระหว่างโหลดรอหน้าหลัก

   //(chat_kaset)###########
   "/ChatAdmin": (BuildContext context) => const ChatAdmin(),//ห้องแชท ระหว่าง ลูกค้ากับแอดมินแอพ

  // (chat_q&a)##########
   "/ChatQA": (BuildContext context) => const ChatRoomStory(),//ห้องแชทหน้าสตอรี่ ปุ่มข้อความ

  // (chat_room)##########
  "/ChatRoomMd": (BuildContext context) => const ChatRoomMd(),//ห้องแชทรวมทีมบริหาร


  //(chat_widget)#######
  "/chatscreen": (BuildContext context) => const ChatStoreRoom(),//ห้องแชท


  //(class_firebase)#############################################
  //class_auction ด้านใน>>> class Auction{late String user1;-late String user9;} คลาสจ่ายเงินค่าสินค้าประมูลได้
  //class_deposit_auction ด้านใน>>> class OpenAuction{late String user1;-late String user9;} คลาสส่งข้อมูลการจ่ายเงินสมัครเข้าร่วมประมูล
  

  //(form_import)#######
  "/builappberopenprofile": (BuildContext context) => const BuilAppberOpenProfile(),//ห้องต้นแบบแอพบาโปรไฟที่ให้ลูกค้าเข้ามาดูได้
  "/builnaviber": (BuildContext context) => const BuilNaviBer(),//ห้องต้นแบบแอพบาด้านล่างใช้ได้ทุกๆหน้า
  "/builiconhorizontal": (BuildContext context) => const BuilIconHorizontal(),//ห้องต้นแบบบาไสล ซ้าย-ขวา อยู่ด้านบน (หลัก)
  "/calculate": (BuildContext context) => const Calculate(),//ห้องทำเครื่องคิดเลข  
  "/myformauction": (BuildContext context) => const MyFormAuction(),//ห้องต้นแบบรับค่าและส่งไปแดงผลขายสินค้าประมูล
  "/myformshopping": (BuildContext context) => const MyFormShopping(),//ห้องต้นแบบรับค่าและส่งไปแสดงขายสินค้าทั่วไป
  "/myformstory": (BuildContext context) => const MyFormStory(),//ห้องต้นแบบรับค่าและส่งไปแสดงผลโพสสตอรี่
  "/ShowLocationMap": (BuildContext context) => const ShowLocationMap(),//ห้องแสดงแผนที่ GoogleMap
  "/TranSport": (BuildContext context) =>  const TranSport(),//ห้องต้นแบบบาไสล ซ้าย-ขวา ส่วนช่วงกลางเน้นเกี่ยวกับระบบขนส่ง

  //(import_Api)##############



  //(form_profile_contor)#######
  "/PosSoppingShareLike": (BuildContext context) => const PosSoppingShareLike(),//ห้องทำแบบโซนตัวเลือกแบบโพสขายสินค้าฟรี(และนำอันนี้เข้าไปโชที่หน้า Profile_contor)



  //(home_kaset)#######
  "/UploadVdoApplication": (BuildContext context) => const UploadVdoApplication(),//ห้องโหลดไฟvdoพรีเซ้น
  "/application01": (BuildContext context) => const Application01(),//ห้องกรอกใบสมัครเข้าร่วมบริหารแพรทฟรอม
  "/application02": (BuildContext context) => const Application02(),//ห้องกรอกใบสมัครเปิดรับโฆษณา
  //"/myauctionkaset": (BuildContext context) => MyAuctionKaset(),//ห้อง เงื่อนไขการใช้ห้องประมูลสินค้า
  "/mydrawer": (BuildContext context) => const MyDrawer(),//ห้องแสดงเนื้อหาในหน้าต่าง Drawer ปุ่มกดไปยังห้องต่างๆ
  "/myentermanagekaset": (BuildContext context) => const MyEnterManageKaset(),//ห้อง เงื่อนไขการเข้าร่วมบริหารแพรทฟรอม
  "/mygetads": (BuildContext context) => const MyGetAds(),//ห้อง เงื่อนไขการเปิดรับโฆษณา
  "/myhomekasethey": (BuildContext context) => const MyHomeKasetHey(),//ห้อง บรรณยายวัตถุประสงค์ต่างๆของ แอพ Kaset Hey
 
  "/mystorykaset": (BuildContext context) => const MyStoryKaset(),//ห้อง เงื่อนไขการใช้ห้องโพสสตอรี่
  
  
  "/persnal": (BuildContext context) => Persnal(),//ห้องนโยบายส่วนตัว kaset Hey


  //(kaset_backin)#######
   //(Sponsor)
  "/ManuMemberYear": (BuildContext context) => const ManuMemberYear(),//ห้องแสดงปุ่มเมนู
  "/GetMoneyMember": (BuildContext context) => const GetMoneyMember(),//ห้องเช็คเงินค่าโฆษณารายปี
  "/FileVdoYear": (BuildContext context) => const FileVdoYear(),//ห้องไฟวีดีโอรายปี  
         //#############image
  "/SponsorPicg": (BuildContext context) => const ManuSponsorPicgImage(),//ห้องปุ่มกดเลือกดูรับค่าโฆษณา ภาพนิ่ง
  "/FileUploadImage1": (BuildContext context) => const FileUploadImage1(),//ห้องเก็บไฟภาพโฆษณาแบบที่1
  "/FileUploadImage2": (BuildContext context) => const FileUploadImage2(),//ห้องเก็บไฟภาพโฆษณาแบบที่2
  "/FileUploadImage3": (BuildContext context) => const FileUploadImage3(),//ห้องเก็บไฟภาพโฆษณาแบบที่3
  "/FileUploadImage4": (BuildContext context) => const FileUploadImage4(),//ห้องเก็บไฟภาพโฆษณาแบบที่4    "/FileUploadImage5": (BuildContext context) => const FileUploadImage5(),//ห้องเก็บไฟภาพโฆษณาแบบที่5
  "/FileUploadImage6": (BuildContext context) => const FileUploadImage6(),//ห้องเก็บไฟภาพโฆษณาแบบที่6
  "/FileUploadImage7": (BuildContext context) => const FileUploadImage7(),//ห้องเก็บไฟภาพโฆษณาแบบที่7
  "/FileUploadImage8": (BuildContext context) => const FileUploadImage8(),//ห้องเก็บไฟภาพโฆษณาแบบที่8
  "/SponsorPicg1": (BuildContext context) => const SponsorPicg1(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่1
  "/SponsorPicg2": (BuildContext context) => const SponsorPicg2(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่2
  "/SponsorPicg3": (BuildContext context) => const SponsorPicg3(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่3
  "/SponsorPicg4": (BuildContext context) => const SponsorPicg4(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่4
  "/SponsorPicg5": (BuildContext context) => const SponsorPicg5(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่5
  "/SponsorPicg6": (BuildContext context) => const SponsorPicg6(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่6
  "/SponsorPicg7": (BuildContext context) => const SponsorPicg7(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่7
  "/SponsorPicg8": (BuildContext context) => const SponsorPicg8(),//ห้องรับค่าโฆษณา ภาพนิ่ง แบบที่8
         //#############  VDO
  "/SponsorVdo": (BuildContext context) => const SponsorVdo(),//ห้องปุ่มกดเลือกดูรับค่าโฆษณา VDO
  "/SponsorVdo1": (BuildContext context) => const SponsorVdo1(),//ห้องรับค่าโฆษณา VDO แบบที่1
  "/SponsorVdo2": (BuildContext context) => const SponsorVdo2(),//ห้องรับค่าโฆษณา VDO แบบที่2
  "/SponsorVdo3": (BuildContext context) => const SponsorVdo3(),//ห้องรับค่าโฆษณา VDO แบบที่3
  "/SponsorVdo4": (BuildContext context) => const SponsorVdo4(),//ห้องรับค่าโฆษณา VDO แบบที่4
  "/SponsorVdo5": (BuildContext context) => const SponsorVdo5(),//ห้องรับค่าโฆษณา VDO แบบที่5
  // upload_file_vdo #############
  "/FileUploadVdo1": (BuildContext context) => const FileUploadVdo1(),//ห้องเก็บไฟVdoโฆษณาแบบที่1
  "/FileUploadVdo2": (BuildContext context) => const FileUploadVdo2(),//ห้องเก็บไฟVdoโฆษณาแบบที่2
  "/FileUploadVdo3": (BuildContext context) => const FileUploadVdo3(),//ห้องเก็บไฟVdoโฆษณาแบบที่3
  "/FileUploadVdo4": (BuildContext context) => const FileUploadVdo4(),//ห้องเก็บไฟVdoโฆษณาแบบที่4
  "/FileUploadVdo5": (BuildContext context) => const FileUploadVdo5(),//ห้องเก็บไฟVdoโฆษณาแบบที่5
         //################
  "/ApplicationBackin01": (BuildContext context) => const ApplicationMd(),//ห้องเช็คใบสมัครผู้ที่จะเข้าร่วมบริหารแพรทฟรอม
  "/ApplicationBackin02": (BuildContext context) => const ApplicationSponsor(),//ห้องเช็คใบสมัครผู้ที่ขอเปิดรับโฆษณา
  "/ControlBackinKasetHy": (BuildContext context) => const ProfileBackinThaiKasetHey(),//หน้าปก Backin
  "/kasetbackin01": (BuildContext context) => const KasetBackin01(),
  "/kasetbackin02": (BuildContext context) => KasetBackin02(),
  "/kasetbackin03": (BuildContext context) => KasetBackin03(),
  "/kasetbackin04": (BuildContext context) => KasetBackin04(),
  "/kasetbackin05": (BuildContext context) => KasetBackin05(),
  "/kasetbackin06": (BuildContext context) => KasetBackin06(),
  "/kasetbackin07": (BuildContext context) => KasetBackin07(),
  "/kasetbackin08": (BuildContext context) => const KasetBackin08(),
  
  "/kasetbackin999":(BuildContext context) => const BottonContorl(),//หน้าเมนูปุ่มกดดูห้องจ่ายเงินต่างๆ
  "/listofcontents":(BuildContext context) => const ListOfContents(),


  "/BackinThaiKasetHey": (BuildContext context) => const BottonPay(),//หน้าแรกควบคุมระบบหลังบ้าน
 

    

  //(kaset_project)#######
  "/StoerAuction": (BuildContext context) => const StoerAuction(),//ห้องเก็บสินค้าที่กดเข้าร่วมประมูล
  "/auction": (BuildContext context) => const Auction(), //ห้องรวมโพสเปิดประมูลสินค้าของทุกคน
  "/bell": (BuildContext context) => const Bell(),//ห้องรับและเก็บข้อความเข้า
  "/heart": (BuildContext context) => const Heart(),//ห้องเก็บรายชื่อบุคคล / ร้านค้า ที่กดถูกใจ
  "/openprofileauction": (BuildContext context) => const OpenProfileAuction(), //ห้องโพสเปิดประมูลส่วนตัวให้ลูกค้าดู
  "/openprofileshopping": (BuildContext context) => const OpenProfileShopping(), //ห้องโพสขายสินค้าส่วนตัวให้ลูกค้าดู
  "/openprofilestory": (BuildContext context) => const OpenProfileStory(), //ห้องโพสสตอรี่ส่วนตัวให้ลูกค้าดู
  "/profilecontrol": (BuildContext context) => const ProfileControl(), //ห้องโปรไฟส่วนตัวหลัก
  "/shopping": (BuildContext context) => const Shopping(), //ห้องรวมโพสขายสินค้าของทุกคน


  "/story": (BuildContext context) => const StoryShow(), //ห้องรวมโพสสตอรี่ของทุกคน
  "/RoomProfileStory": (BuildContext context) => const RoomProfileStory(),//ห้องแสดงโพสสตอรี่ของตัวเอง
  "/RoomProfileShopping": (BuildContext context) => const RoomProfileShopping(),//ห้องแสดงโพสขายสินค้าของตัวเอง
  "/RoomProfileAuction": (BuildContext context) => const RoomProfileAuction(),//ห้องแสดงโพสต์ประมูลสินค้าของตัวเอง


  //(model)#######
     //Future<Null> normalDialog() ห้องต้นแบบป๊อปอับ โชโลโก้พร้อมข้อความที่กำหนด
     //class MyStyle ห้องต้นแบบสื และต้นแบบแสดงข้อความ
     // ห้อง router ห้องนี้เอง
     //
     //ShowProfile ห้องดึงข้อมูลการสมัครมาจาก Firebase เพื่อส่งต่อไปแสดงยังหน้าต่างๆ


  //(pay_room)#######
    // (member_pay_tax)#############
     "/TaxMember": (BuildContext context) => const TaxMember(),//ห้องกรอกรายละเอียดเอกสารเกียวกับภาษีร้านค้า
     "/paymember": (BuildContext context) => const PayMember(), //ห้องจ่ายเงินสมัครสมาชิกรายปี
    // (trolley)#######
     "/iconpay": (BuildContext context) => const IconPay(),//ห้องแสดงปุ่มตัวเลือกไปห้องจ่ายเงินต่างๆ   
     "/payauction": (BuildContext context) => const PayAuction(),//ห้องจ่ายเงินค่าสินค้าประมูลชนะ 
     "/payshopping": (BuildContext context) => const PayShopping(), //ห้องจ่ายเงินค่าสินค้าทั่วไป 
     "/refundauction": (BuildContext context) => const RefundAuction(),//ห้องขอคืนเงินวางประมูล
     //######
   "/depositauction": (BuildContext context) => const DepositAuction(),//ห้องจ่ายเงินวางมัดจำการประมูลสินค้า
   "/guarantee": (BuildContext context) => const Guarantee(),//ห้องจ่ายเงินค่าประกันสินค้าประมูล  
   "/PayOpenAuction": (BuildContext context) => const PayOpenAuction(),//ห้องจ่ายเงินสมัครเปิดห้องประมูลสินค้า


   //(room_pos)#######
   "/posauction": (BuildContext context) => const PosAuction(), //ห้องโพสขายสินค้าประมูล
   "/posshopping": (BuildContext context) => const PosShopping(), //ห้องโพสขายสินค้าทั่วไป
   "/posstoryroom": (BuildContext context) => const PosStoryRoom(),//ห้องโพสสตอรี่




    //(sponsor01)############ 
       // pay_sponsor_image ############
          // upload_image ##########
          "/UploadImage1": (BuildContext context) => const UploadImage1(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 1
          "/UploadImage2": (BuildContext context) => const UploadImage2(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 2
          "/UploadImage3": (BuildContext context) => const UploadImage3(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 3
          "/UploadImage4": (BuildContext context) => const UploadImage4(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 4
          "/UploadImage5": (BuildContext context) => const UploadImage5(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 5
          "/UploadImage6": (BuildContext context) => const UploadImage6(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 6
          "/UploadImage7": (BuildContext context) => const UploadImage7(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 7
          "/UploadImage8": (BuildContext context) => const UploadImage8(),//ห้องอัปโหลดรูปภาพโฆษณาแบบที่ 8
        "/SponsorTwo": (BuildContext context) => const SponsorTwo(),//ห้องตัวเลือกลงโฆษณาลองส่วนกลางนำเข้า ห้อง SponsorTwo1 - SponsorTwo8 มาแสดงที่หน้านี้
       // pay_sponsor_vdo #############
          // upload_vdo #############
          "/UploadVdo1": (BuildContext context) => const UploadVdo1(),//ห้องอัปโหลดVDOโฆษณาแบบที่ 1
          "/UploadVdo2": (BuildContext context) => const UploadVdo2(),//ห้องอัปโหลดVDOโฆษณาแบบที่ 2         
          "/UploadVdo3": (BuildContext context) => const UploadVdo3(),//ห้องอัปโหลดVDOโฆษณาแบบที่ 3
          "/UploadVdo4": (BuildContext context) => const UploadVdo4(),//ห้องอัปโหลดVDOโฆษณาแบบที่ 4
          "/UploadVdo5": (BuildContext context) => const UploadVdo5(),//ห้องอัปโหลดVDOโฆษณาแบบที่ 5
       "/SponsorOne": (BuildContext context) => const SponsorOne(),//ห้องตัวเลือกลงโฆษณาหลัก ส่วนกลางนำเข้า ห้อง Sponsorone1 - Sponsor0ne5 มาแสดงที่หน้านี้   
        // VIP_sponsor_year  โฆษณารายปี
        "/SponsorVip": (BuildContext context) => const SponsorVip(),//ห้องเปิดโฆษณาแบบ วีไอพี
          "/UploadFileVdoYear": (BuildContext context) => const UploadFileVdoYear(),//ห้องอัปโหลดVDOโฆษณาแบบรายปี
        
    "/OpenAdvertisement": (BuildContext context) => const OpenAdvertisement(),//ห้องเลือกใช้บริการโฆษณาของทางแอพ
    
    
    
    //(sponsor02)############
       // choic_sponsor #########################
          //thaim ###############################
        "/AdverSponsorPic1": (BuildContext context) => const AdverSponsorPic1(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic2": (BuildContext context) => const AdverSponsorPic2(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic3": (BuildContext context) => const AdverSponsorPic3(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic4": (BuildContext context) => const AdverSponsorPic4(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic5": (BuildContext context) => const AdverSponsorPic5(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic6": (BuildContext context) => const AdverSponsorPic6(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic7": (BuildContext context) => const AdverSponsorPic7(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorPic8": (BuildContext context) => const AdverSponsorPic8(),//ห้องเลือกโฆษณาชนิดภาพ
        "/AdverSponsorVdo1": (BuildContext context) => const AdverSponsorVdo1(),//ห้องเลือกโฆษณาชนิดVdo
        "/AdverSponsorVdo2": (BuildContext context) => const AdverSponsorVdo2(),//ห้องเลือกโฆษณาชนิดVdo
        "/AdverSponsorVdo3": (BuildContext context) => const AdverSponsorVdo3(),//ห้องเลือกโฆษณาชนิดVdo
        "/AdverSponsorVdo4": (BuildContext context) => const AdverSponsorVdo4(),//ห้องเลือกโฆษณาชนิดVdo
        "/AdverSponsorVdo5": (BuildContext context) => const AdverSponsorVdo5(),//ห้องเลือกโฆษณาชนิดVdo


    "/AdverSponsor": (BuildContext context) => const AdverSponsor(),//ห้องบริหารโฆษณาของตัวเอง
    "/AdverMonne": (BuildContext context) => const AdverMonne(),//ห้องเช็คยอดเงินค่าโฆษณา/บัญชีรับเงิน


    //(sponsor03_class)############
    

   //(talk_order)#######
   "/order1": (BuildContext context) => const Order1(), //ห้องเช็คออเด้อของร้านค้ากรณีมีการสั่งซื้อสินค้า
   "/order2": (BuildContext context) => Order2(), //ห้องเช็คออเด้อของร้านค้ากรณีมีการสั่งซื้อสินค้า
   

   //  "/BackinThaiKasetHey": (BuildContext context) => const BackinThaiKasetHey(),


  


 
 
 
  
 
 
 
  
  
 
  
  
 
  
 
 
 
  
  
 
 
 
  
  
 
  
  
  
  
  




 
 
};
