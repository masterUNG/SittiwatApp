import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class IconPay extends StatefulWidget {
  const IconPay({Key? key}) : super(key: key);

  @override
  _IconPayState createState() => _IconPayState();
}

class _IconPayState extends State<IconPay> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyStyle()
                  .fonWhite12("ขอขอบคุณทุกท่านที่ให้การสนับสนุนซื้อสินค้า"),
              leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, "/story"),
                icon: Icon(
                  Icons.switch_account_outlined,
                  color: Colors.orangeAccent.shade700,
                  size: 20,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/profilecontrol"),
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.orangeAccent.shade700,
                    size: 20,
                  ),
                ),
              ],

              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade200,
              expandedHeight: 300,
              floating: false,
              //pinned: true,
              flexibleSpace: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipperForAppBer(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.green],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Chewie(
                        controller: ChewieController(
                          aspectRatio: 4 / 2,
                          autoInitialize: true,
                          looping: true,
                          autoPlay: true,
                          fullScreenByDefault: false,
                          videoPlayerController: VideoPlayerController.asset(
                              "lib/video/intorlkaset3.mp4"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screen * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/payshopping"),
                        child: MyStyle().fonBack15("ชำระสินค้าทั่วไป"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screen * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/payauction"),
                        child: MyStyle().fonBack15("ชำระสินค้าประมูล"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screen * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/refundauction"),
                        child: MyStyle().fonBack15("ขอคืนเงินวางประมูล"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(width: screen * 0.5, child: MyStyle().showLogo()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
