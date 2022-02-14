import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class ShowLocationMap extends StatefulWidget {
  const ShowLocationMap({Key? key}) : super(key: key);

  @override
  _ShowLocationMapState createState() => _ShowLocationMapState();
}

class _ShowLocationMapState extends State<ShowLocationMap> {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return lat == null
        ? MyStyle().showProgress()
        : builMapGps(); //ระบุตำแหน่ง GPS
  }

  //ระบุตำแหน่ง GPS#########################################
  late double lat, lng;
  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<void> findLatLng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat = locationData!.latitude!;
      lng = locationData.longitude!;
    });
    // print("lat = $lat, lng = $lng");
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  Set<Marker> myMarker() {
    return <Marker>{
      Marker(
        markerId: const MarkerId("myshoop"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.tealAccent.shade400,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return showMapFast();
              },
            );
          },
          title: "รถให้บริการ",
          snippet: "ละติจูด = $lat,ลองติจูด = $lng",
        ),
      )
    };
  }

  Widget showMapFast() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: MyStyle().greenColor,
                radius: 32,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: MyStyle().showLogo(),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(child: ProfileNameGmail()),
            ],
          ),
          MyStyle().fonBack15('ตำแหน่งปลายทาง'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyStyle().fonBack15("ระยะทาง"),
              MyStyle().fonBack15("DATA"),
              MyStyle().fonBack15("กิโลเมตร"),
            ],
          ),
          MyStyle().fonBack15('รายการสินค้า'),
          MyStyle().fonBack12('1.................'),
          MyStyle().fonBack12('2.................'),
          MyStyle().fonBack12('3.................'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyStyle().fonBack15("ค่าส่งสินค้า"),
              MyStyle().fonBack15("DATA"),
              MyStyle().fonBack15("บาท"),
            ],
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.green.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.touch_app,color: Colors.white,),
                  label: MyStyle().fonWhite15("เรียกใช้บริการ"),
                ),
              ),
               Card(
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.red.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.touch_app,color: Colors.white),
                  label: MyStyle().fonWhite15("ยกเลิกบริการ"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget builMapGps() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 17.5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
      ),
      body: Container(
        color: Colors.white54,
        width: double.infinity,
        //height: 300,
        child: GoogleMap(
          initialCameraPosition: cameraPosition,
          mapType: MapType.satellite,
          onMapCreated: (controller) {},
          markers: myMarker(),
        ),
      ),
    );
  }
}
