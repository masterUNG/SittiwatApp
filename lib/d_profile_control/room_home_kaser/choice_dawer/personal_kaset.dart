import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';


class Persnal extends StatefulWidget {
  Persnal({Key? key}) : super(key: key);

  @override
  _PersnalState createState() => _PersnalState();
}

class _PersnalState extends State<Persnal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Center(child: MyStyle().fonWhite15("นโยบายความเป็นส่วนตัว"),),
               MyStyle().fonWhite12("เงื่อนไขการใช้แอพ")
              ],
            ),
          ),
        ),
      ),
       floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, "/profilecontrol"),
        child:MyStyle().fonWhite15( "ยอมรับ",),
         style: ElevatedButton.styleFrom(
          primary: MyStyle().orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
         
      ),
    );
  }
}
