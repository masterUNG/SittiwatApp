
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/router.dart';

//ชุดนี้เป็นระบบ ออโต้ล็อคอิน เปิดใช้งานเมื่อตบแต่งหน้าต่างๆเสร็จ
String initialRoute = "/login";
// ignore: prefer_void_to_null
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    // ignore: await_only_futures
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        initialRoute = "/SplashScreenOne";
      }
      runApp(MyApp());
    });
  });
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KASET HEY",
      debugShowCheckedModeBanner: false,
      routes: router,
      initialRoute: initialRoute,
      theme: ThemeData(
        canvasColor: Colors.grey.shade200,
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}






// //ชุดนี้เป็นชุดเมนที่ใช้เริ่มต้นแบบปกติ
// void main() => runApp(MyApp());
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: router,
//       initialRoute: "/login",
//     );
//   }
// }










