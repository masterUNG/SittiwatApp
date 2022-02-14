import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class IncreascThePrice extends StatefulWidget {
  const IncreascThePrice({Key? key}) : super(key: key);

  @override
  _IncreascThePriceState createState() => _IncreascThePriceState();
}

class _IncreascThePriceState extends State<IncreascThePrice> {
  final formKey = GlobalKey<FormState>();
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screen * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyStyle().fonWhite12("ราคาปัจจุบัน"),
                  MyStyle().fonBack20("data"),
                  MyStyle().fonWhite12("บาท"),
                ],
              ),
            ),
            Form(
              key: formKey,
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
                height: 30,
                width: screen * 0.32,
                child: TextFormField(
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "กรุณาใส่รหัส";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาป้อนตัวเลขมากกว่า 0 ด้วยครับ";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.white38,
                      ),
                      labelText: "Password:"),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            SizedBox(
              width: screen*0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      if (mouth != 0) {
                        setState(() {
                          mouth--;
                        });
                      }
                    },
                  ),
                  Text('$mouth',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: masterMouth,
                  ),
                ],
              ),
            ),


            
            Row(
              children: [
                Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return showAlert(context);
                      //   },
                      // );
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return showAlert(context);
                          },
                        );
                      }
                    },
                    child: SizedBox(
                      width: screen * 0.28,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 25,
                            width: screen * 0.22,
                            child: Center(child: MyStyle().fonWhite12("เพิ่ม")),
                            decoration: BoxDecoration(
                              color: MyStyle().redColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(200.0),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.fingerprint_outlined,
                            size: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget showAlert(BuildContext context) {
    return AlertDialog(
      title: MyStyle().fongreen25("THAI KASET HEY"),
      content: MyStyle().fongreen15("คุณต้องการเพิ่มราคาประมูลนะครับ"),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyStyle().fongreen15("ยกเลิก"),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: MyStyle().fongreen15("ตกลง"),
        ),
      ],
    );
  }

  int mouth = 0;
  void masterMouth() {
    setState(() {
      mouth++;
    });
  }
}
