// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile_uid.dart';
import 'package:sittiwat_app/model/my_style.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Profile profile = Profile(email: '', password: '', pisane: '', user: '');
  final formKey = GlobalKey<FormState>();
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");
    return Scaffold(
      body: Container(
         decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/video/backgroundloing.jpg"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  showKaset(),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: screen * 0.3,
                    child: MyStyle().showLogo(),
                  ),
                  const SizedBox(height: 15),
                  showEmail(),
                  const SizedBox(height: 5),
                  showPassword(),
                  const SizedBox(height: 5),
                  showButton(),
                  const SizedBox(height: 25),
                  loginGoogle(),
                  const SizedBox(height: 10),
                  loginFaceBook(),
                  const SizedBox(height: 250),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/signup01"),
        child: MyStyle().fonorange15(
          "New Register (Sign up)>>>",
        ),
      ),
    );
  }

  Widget showKaset() {
    return Center(child: MyStyle().fongreen40("Thai..Kaset Hey"));
  }

  //########## เริ่มต้นเขียนระบบ การกรอกรหัส Email , Password กรณีเคยสมัครสมาชิกแล้ว #################
  Card showEmail() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.7,
            child: TextFormField(
              onSaved: (var email) {
                profile.email = email!;
              },
              keyboardType: TextInputType.emailAddress,
              validator: MultiValidator([
                EmailValidator(errorText: "รูปแบบ Email ไม่ถูกต้องครับ"),
                RequiredValidator(errorText: "กรุณากรอก Email ด้วยครับ"),
              ]),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Email:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Card showPassword() {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Colors.green.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 35,
            width: screen * 0.7,
            child: TextFormField(
              onSaved: (var password) {
                profile.password = password!;
              },
              keyboardType: TextInputType.number,
              obscureText: true,
              validator:
                  RequiredValidator(errorText: "กรุณากรอก Password ด้วยครับ"),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                labelText: "Password:",
                labelStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox showButton() {
    return SizedBox(
      width: screen * 0.73,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyStyle().orangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: profile.email,
                  password: profile.password,
                )
                    .then((value) {
                  formKey.currentState!.reset();
                  Navigator.pushNamed(context, "/SplashScreenOne");
                });
                // ignore: unused_catch_clause
              } on FirebaseAuthException catch (e) {
                Fluttertoast.showToast(
                    msg: "ไม่มีขัอมูลผู้ใช้", gravity: ToastGravity.CENTER);
              }
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return showAlert(context);
              //   },
              // );

              //

            }
          },
          child: MyStyle().fongreen25("Login Kaset Hey")),
    );
  }

  //######### สิ้นสุดส่วน การกรอกรหัส Email , Password ############################################
  AlertDialog showAlert(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "KASET HEY",
        style: TextStyle(
          fontSize: 20,
          color: MyStyle().greenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "ชุมชนคน เกษตรเฮ ขอขอบคุณครับที่สมัครเข้าร่วมแอพพิเคชั่น",
        style: TextStyle(
          fontSize: 15,
          color: MyStyle().greenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/story");
            },
            child: Text(
              "ไม่เป็นไร",
              style: TextStyle(
                fontSize: 15,
                color: MyStyle().greenColor,
                fontWeight: FontWeight.bold,
              ),
            )),
        // ignore: deprecated_member_use
        FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/story");
            },
            child: Text(
              "ยินดี",
              style: TextStyle(
                fontSize: 15,
                color: MyStyle().greenColor,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }

  //########  เริ่มต้นเขียนระบบ GoogleSignin Login #########################################
  SizedBox loginGoogle() {
    return SizedBox(
      width: screen * 0.73,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.yellowAccent.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => processSingInWithGoogle(),
          child: MyStyle().fongreen25("Login  Google")),
    );
  }

  var typeUser, name, email, cord, uid;
  // ignore: prefer_void_to_null
  Future<Null> processSingInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    await Firebase.initializeApp().then((value) async {
      await _googleSignIn.signIn().then((value) async {
        name = value!.displayName!;
        email = value.email;

        await value.authentication.then((value2) async {
          AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: value2.idToken,
            accessToken: value2.accessToken,
          );
          await FirebaseAuth.instance
              .signInWithCredential(authCredential)
              .then((value3) async {
            uid = value3.user!.uid;
            // print( "Login สำเร็จแล้ว value With name = $name,email = $email,uid = $uid");
            // ignore: await_only_futures
            await FirebaseFirestore.instance
                .collection("user")
                .doc(uid)
                .snapshots()
                .listen((event) {
              //  print("event ==> ${event.data()}");
              if (event.data() == null) {
                callTypeUserDialog();
              } else {}
            });
          });
        });
      });
    });
  }

  // ignore: prefer_void_to_null
  Future<Null> callTypeUserDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: MyStyle().showLogo(),
          title: MyStyle().fonyellouu15("สถานะ ?"),
          subtitle: MyStyle().fongreen12("เลือกสถานะ ผู้ซื้อ ผู้ขาย"),
        ),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                RadioListTile(
                  value: "user",
                  groupValue: typeUser,
                  onChanged: (var value) {
                    setState(() {
                      typeUser = value;
                    });
                  },
                  title: MyStyle().fongreen12("ผู้ขาย"),
                ),
                RadioListTile(
                  value: "shop",
                  groupValue: typeUser,
                  onChanged: (value) {
                    setState(() {
                      typeUser = value;
                    });
                  },
                  title: MyStyle().fongreen12("ผู้ซื้อ"),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                insertValueToCloudFirestore();
              },
              child: MyStyle().fongreen15("OK"))
        ],
      ),
    );
  }

  // ignore: prefer_void_to_null
  Future<Null> insertValueToCloudFirestore() async {
    UserModel model =
        UserModel(email: email, name: name, cord: cord, typeuser: typeUser, urlProfile: '');
    Map<String, dynamic> data = model.toMap();

    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(uid)
          .set(data)
          .then((value) {
        switch (typeUser) {
          case "shop":
            Navigator.pushNamedAndRemoveUntil(
                context, "/story", (route) => false);
            break;
          case "user":
            Navigator.pushNamedAndRemoveUntil(
                context, "/persnal", (route) => false);
            break;
          default:
        }
      });
    });
  }
  //######### สิ้นสุดส่วน Googlesignin ####################################################

  //### Facebook เริ่มต้นระบบล็อคอิน#############################################
  SizedBox loginFaceBook() {
    return SizedBox(
      width: screen * 0.73,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {},
          child: MyStyle().fongreen25("Login  Facebook")),
    );
  }
}
