import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/pop_star_rating/rating_view.dart';

class PopStar extends StatefulWidget {
  const PopStar({Key? key}) : super(key: key);

  @override
  _PopStarState createState() => _PopStarState();
}

class _PopStarState extends State<PopStar> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Container(
      width: screen * 0.35,
      height: 28,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.grey.shade300,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: TextButton.icon(
          icon: const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 20,
          ),
          label: MyStyle().fonBack12("ให้คะแนนร้าน"),
          onPressed: () {
            openRatingDialog(context);
          },
        ),
      ),
    );
  }

  openRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            child: RatingView(),
          );
        });
  }
}
