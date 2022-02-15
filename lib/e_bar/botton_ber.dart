//###########################
//ตัวทำบาแทบด้านล่าง(สำหรับใช้ได้ทุกหน้า)
import 'package:flutter/material.dart';

class BuilNaviBer extends StatefulWidget {
  const BuilNaviBer({Key? key}) : super(key: key);

  @override
  _BuilNaviBerState createState() => _BuilNaviBerState();
}

class _BuilNaviBerState extends State<BuilNaviBer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade400,
            Colors.greenAccent,
            Colors.greenAccent.shade100,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/story"),
            icon: Icon(
              Icons.switch_account_outlined,
              color: Colors.orange.shade800,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/iconpay"),
            icon: Icon(
              Icons.local_grocery_store_outlined,
              color: Colors.orange.shade800,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/heart"),
            icon: Icon(
              Icons.favorite_border,
              color: Colors.orange.shade800,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/bell"),
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.orange.shade800,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/profilecontrol", (route) => false),
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.orange.shade800,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
