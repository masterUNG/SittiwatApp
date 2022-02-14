import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyShowSponsorInStory extends StatefulWidget {
  const MyShowSponsorInStory({Key? key}) : super(key: key);

  @override
  _MyShowSponsorInStoryState createState() => _MyShowSponsorInStoryState();
}

class _MyShowSponsorInStoryState extends State<MyShowSponsorInStory> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("uploadภาพโฆษณาแบบที่1")
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map(
            (document) {
              return Card(
                elevation: 3,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: screen * 0.2,
                  height: screen * 0.2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(document["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
