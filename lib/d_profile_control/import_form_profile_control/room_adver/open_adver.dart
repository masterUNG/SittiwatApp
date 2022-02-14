import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/model/my_style.dart';

class OpenAdver extends StatefulWidget {
  const OpenAdver({Key? key}) : super(key: key);

  @override
  _OpenAdverState createState() => _OpenAdverState();
}

class _OpenAdverState extends State<OpenAdver> {
  final formKeyopenAdver = GlobalKey<FormState>();
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(80),
        topLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(20),
      )),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent.shade100, Colors.cyanAccent.shade400],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(80),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            MyStyle().fonBack20("Welcome"),
            MyStyle().fonBack15("บริหารรายได้การเปิดรับโฆษณาของคุณเอง"),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKeyopenAdver,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.black54, Colors.black12],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow.shade400,
                ),
                width: screen * 0.7,
                height: 35,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: RequiredValidator(
                      errorText: "กรุณากรอก Password ด้วยครับ"),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_clock_outlined,
                      color: Colors.orange,
                      size: 20,
                    ),
                    labelText: "Password: OTP",
                    labelStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: screen * 0.7,
                height: 35,
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
                child: TextButton(
                  child: MyStyle().fonWhite15("เข้าบริหารทันที"),
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return showAlertSponsor(context);
                    //     },
                    //   );

                    if (formKeyopenAdver.currentState!.validate()) {
                      formKeyopenAdver.currentState!.reset();

                      Fluttertoast.showToast(
                        msg:
                            "ยินดีต้อนรับ\nโฆษณาของคุณ รายได้ของคุณ\nทีคุณกำหนดเอง",
                        timeInSecForIosWeb: 7,
                        fontSize: 20,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      );
                      Navigator.pushNamed(context, "/AdverSponsor");
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    MyStyle().fonBack12("ยอดเงินถอนได้"),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.black54, Colors.black12],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow.shade400,
                      ),
                      width: screen * 0.3,
                      height: 30,
                      child: Center(child: MyStyle().fonyellouu12("Data")),
                    ),
                  ],
                ),
                SizedBox(width: screen * 0.25, child: MyStyle().showLogo()),
                SizedBox(
                  width: screen * 0.35,
                  child: TextButton.icon(
                    icon: Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black38,
                        radius: 15,
                        child: Icon(Icons.attach_money_outlined,
                            size: 18, color: Colors.white),
                      ),
                    ),
                    label: MyStyle().fonBack12("ถอนเงิน"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showAlertMonne(context);
                        },
                      );

                      // if (formKeyopenAdver.currentState!.validate()) {
                      //   formKeyopenAdver.currentState!.reset();
                      //   Navigator.pushNamed(context, "/AdverMonne");
                      // }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  //โชป๊อปอัป
  AlertDialog showAlertSponsor(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15(
        "Thai...KASET HEY",
      ),
      content: MyStyle().fongreen15(
        "ขอขอบคุณครับที่สนใจบริการนี้\nคุณยังไม่เข้าเงื่อนไขการเปิดใช้งาน\nกรุณาศึกษาหลักเกณฑ์การสมัครบริการนี้ก่อนนะครับ",
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyStyle().fongreen15("ยกเลิก"),
              ),
            ),
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/mygetads");
                },
                child: MyStyle().fongreen15("ดูหลักเกณฑ์"),
              ),
            ),
          ],
        ),
      ],
    );
  }


  //โชป๊อปอัป
  AlertDialog showAlertMonne(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen15(
        "Thai...KASET HEY",
      ),
      content: MyStyle().fongreen15(
        "ขอขอบคุณครับที่สนใจบริการนี้\nคุณยังไม่เข้าเงื่อนไขการเปิดใช้งาน\nกรุณาศึกษาหลักเกณฑ์การสมัครบริการนี้ก่อนนะครับ",
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyStyle().fongreen15("ยกเลิก"),
              ),
            ),
            Container(
              height: 30,
              color: Colors.blueGrey.shade100,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/mygetads");
                },
                child: MyStyle().fongreen15("ดูหลักเกณฑ์"),
              ),
            ),
          ],
        ),
      ],
    );
  }



}
