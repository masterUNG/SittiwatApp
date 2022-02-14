
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';



Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: MyStyle().showLogo(),
        title: MyStyle().fonorange15(title),
        subtitle: MyStyle().fonBack12(message), 
      ),
      children: [TextButton(onPressed: ()=>Navigator.pop(context),
       child: Container(color: Colors.pink.shade300,
         width: 100,
         child: Center(child: MyStyle().fongreen15("OK"),),
         ),
       ),
      ],
    ),
  );
}
