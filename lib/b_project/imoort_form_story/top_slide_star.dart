import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';

class BuilProfileStar extends StatefulWidget {
  const BuilProfileStar({Key? key}) : super(key: key);

  @override
  _BuilProfileStarState createState() => _BuilProfileStarState();
}

class _BuilProfileStarState extends State<BuilProfileStar> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Row(
      children: [
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
        showStar(),
      ],
    );
  }

  Widget showStar() {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: screen * 0.15,
          height: screen * 0.20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(width: screen * 0.1, child: MyStyle().showLogo()),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.green.shade400,
                    size: 20,
                  ),
                  MyStyle().fongreen12(" Kaset"),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }




}



