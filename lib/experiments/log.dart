// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paultry_app/experiments/inputwidget.dart';
import 'package:paultry_app/widgets/form_menu.dart';
import 'package:paultry_app/widgets/googlebutton.dart';
import 'package:paultry_app/widgets/login.dart';

class LoginUi extends StatelessWidget {
  @override
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            ///holds email header and inputField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "Email & Password",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0),

                    // Padding(
                    //     padding: EdgeInsets.only(right: 50),
                    //     child: Row(
                    //       children: <Widget>[
                            // Expanded(
                            //     child: Padding(
                            //   padding: EdgeInsets.only(top: 40),
                            //   child: Text(
                            //     'Enter your email & password to continue...',
                            //     textAlign: TextAlign.end,
                            //     style: TextStyle(
                            //         color: Color(0xFFA0A0A0), fontSize: 12),
                            //   ),
                            // )),
                            // Container(
                            //     padding: EdgeInsets.all(1),
                            //     decoration: ShapeDecoration(
                            //       shape: CircleBorder(),
                            //       gradient: LinearGradient(
                            //           colors: signInGradients,
                            //           begin: Alignment.topLeft,
                            //           end: Alignment.bottomRight),
                            //     ),
                            //     child: OutlinedButton(
                            //       style: OutlinedButton.styleFrom(
                            //         shape: CircleBorder(),
                            //         padding: EdgeInsets.all(10),
                            //       ),
                            //       onPressed: () {
                            //         if (_loginFormKey.currentState!.validate()) {
                            //           FirebaseAuth.instance
                            //               .createUserWithEmailAndPassword(
                            //               email: textControllerEmail.text,
                            //               password: textControllerPassword.text)
                            //               .then((value) => FirebaseFirestore.instance
                            //               .collection('TestDataCollection')
                            //           // .add(data)
                            //               .doc('hi')
                            //               .set({
                            //             "value": 'xxxxxxx',
                            //           }))
                            //               .then((value) => Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) => FormMenu()))
                            //               .catchError((e) => print(e)));
                            //         }
                            //         Navigator.push(context, MaterialPageRoute(builder: (context)=>FormMenu()));
                            //       },
                            //       child: Icon(
                            //         Icons.arrow_forward_sharp,
                            //         color: Colors.white,
                            //       ),
                            //       // icon: Icon(Icons.arrow_forward_sharp),
                            //     )
                            //     // ImageIcon(
                            //     //   AssetImage("assets/ic_forward.png"),
                            //     //   size: 40,
                            //     //   color: Colors.white,
                            //     // ),
                            //     ),
                          // ],
                        // ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
            ),
            // roundedRectButton("Create an Account", signInGradients, false),

            GoogleButton(),

          ],
        )
      ],
    );
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("assets/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
const List<Color> signcontinueGradients = [
  Color(0xFFFF9945),
  Color(0XFF9C27B0),
  // Color(0xFFFc6076),
];
