import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ProfileBackinThaiKasetHey extends StatefulWidget {
  const ProfileBackinThaiKasetHey({Key? key}) : super(key: key);

  @override
  _ProfileBackinThaiKasetHeyState createState() => _ProfileBackinThaiKasetHeyState();
}

class _ProfileBackinThaiKasetHeyState extends State<ProfileBackinThaiKasetHey> {
  late double screen;
  //การประกาศตัวแปลทำวัน / เวลา
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            MyStyle().fongreen25("เข้าสู่ระบบหลังบ้าน"),
            Center(child: SizedBox(width: screen*0.5, child: MyStyle().showLogo())),
            const SizedBox(height: 20),
            bottonPay(),
            const SizedBox(height: 20),

          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, "/story"),
                icon: const Icon(
                  Icons.home,
                  color: Colors.black38,
                )),

                IconButton(
                onPressed: () =>Navigator.pushNamed(context, "/kasetbackin999"),
                icon: const Icon(
                  Icons.home_repair_service_rounded,
                  color: Colors.black38,
                )),
           
            IconButton(
                onPressed: ()=>Navigator.pushNamed(context, "/BackinThaiKasetHey"),
                icon: const Icon(
                  Icons.home_work_outlined,
                  color: Colors.black38,
                )),
          ],
        ),
      ),
    );
  }

   Widget bottonPay() {
    return Card(
      shadowColor: Colors.black,
      color: Colors.lightBlue.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        child: Center(child: MyStyle().fonBack20(" หมวดชำระเงินเข้า ")),
        onPressed: ()=>Navigator.pushNamed(context, "/BackinThaiKasetHey") ,
        
      ),
    );
  }

  


 
}
