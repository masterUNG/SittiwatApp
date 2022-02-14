import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sittiwat_app/model/my_style.dart';

class RunManage extends StatefulWidget {
  const RunManage({Key? key}) : super(key: key);

  @override
  _RunManageState createState() => _RunManageState();
}

class _RunManageState extends State<RunManage> {
  final formKeyrunShopping = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: MyStyle().blackColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(70),
        bottomRight: Radius.circular(70),
        bottomLeft: Radius.circular(0),
      )),
      child: Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyStyle().greenhiColor,
              MyStyle().greenColor,
              Colors.green.shade900,
              Colors.green.shade700,
              Colors.orangeAccent,
              Colors.pink.shade100,
              Colors.purple.shade100,
              Colors.blue.shade100,
              Colors.blue.shade100,
              Colors.orange.shade50,
              Colors.blue.shade100,
              Colors.blue.shade100,
              Colors.blue.shade200,
              Colors.blue.shade200,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(70),
            bottomLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(70),
          ),
        ),
        child: Column(
          children: [
            MyStyle().fongreen25("Welcome"),
            MyStyle().fongreen15("ร่วมบริหารแพรทฟร์อม การค้าในพื้นที่"),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKeyrunShopping,
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
                width: 250,
                height: 35,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  validator: RequiredValidator(
                      errorText: "กรุณากรอก Password ด้วยครับ"),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_clock_outlined,
                      color: Colors.orange,
                      size: 20,
                    ),
                    labelText: "Password:OTP",
                    labelStyle: TextStyle(
                      color: Colors.black12,
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
              child: InkWell(
                onTap: () {
                   showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showAlert(context);
                        },
                      );

                  // if (formKeyrunShopping.currentState!.validate()) {
                  //   formKeyrunShopping.currentState!.reset();
                  // }
                },
                child: Container(
                  child: Center(
                    child: MyStyle().fongreen20("เข้าบริหารพื้นที่ดูแลทันที"),
                  ),
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade100,
                        Colors.purple.shade100,
                        Colors.blue.shade100,
                        Colors.blue.shade100,
                        Colors.orange.shade50,
                        Colors.orange.shade50,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                   showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showAlert(context);
                        },
                      );


                  // if (formKeyrunShopping.currentState!.validate()) {
                  //   formKeyrunShopping.currentState!.reset();
                  //   Navigator.pushNamed(context, "/ChatRoomMd");
                  // }
                },
                child: Container(
                  child: Center(
                    child: MyStyle().fongreen20("Chat Room ทีมผู้บริหาร"),
                  ),
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orangeAccent,
                          Colors.pink.shade100,
                          Colors.purple.shade100,
                          Colors.blue.shade100,
                          Colors.blue.shade100,
                          Colors.orange.shade50,
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
              width: 280,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        MyStyle().fonWhite15("พื้นที่"),
                        const Icon(
                          Icons.system_security_update,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_tab,
                      size: 20,
                      color: Colors.white,
                    ),
                    MyStyle().fonWhite15("data"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
              width: 280,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        MyStyle().fonWhite15("พื้นที่"),
                        const Icon(
                          Icons.store_mall_directory_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_tab,
                      size: 20,
                      color: Colors.white,
                    ),
                    MyStyle().fonWhite15("data"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
              width: 280,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        MyStyle().fonWhite15("พื้นที่"),
                        const Icon(
                          Icons.gavel_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_tab,
                      size: 20,
                      color: Colors.white,
                    ),
                    MyStyle().fonWhite15("data"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


   //โชป๊อปอัป
  AlertDialog showAlert(BuildContext context) {
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
                  //Navigator.pushAndRemoveUntil(context, , (route) => false);

                  Navigator.pushNamed(context, "/myentermanagekaset");
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
