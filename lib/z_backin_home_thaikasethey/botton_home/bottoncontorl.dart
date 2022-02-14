import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';


class BottonContorl extends StatefulWidget {
  const BottonContorl({Key? key}) : super(key: key);

  @override
  _BottonContorlState createState() => _BottonContorlState();
}

class _BottonContorlState extends State<BottonContorl> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [],),
        body: Column(
          children: <Widget>[
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      listOfContents(),
                      onBackin08(),
                                         
                     
                     
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding listOfContents() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyStyle().telColor01,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, "/listofcontents"),
          child: Row(
            children: [
              Text(
                "ListOfContents:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: MyStyle().orangeColor,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "ห้องสารบัญ คู่มือ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  

  

 


 

  

  

  Padding onBackin08() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyStyle().telColor01,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, "/kasetbackin08"),
          child:MyStyle().fonWhite15("ร้านขอใบกำกับภาษีค่าสมาชิกรายปี")
           
        ),
      ),
    );
  }


}
