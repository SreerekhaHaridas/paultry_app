// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paultry_app/utils/validate.dart';
import 'package:paultry_app/widgets/form_menu.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;

  InputWidget(this.topRight, this.bottomRight);
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
                child: Card(
                   elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(bottomRight),
                          topRight: Radius.circular(topRight))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'user@gmail.com',
                        hintStyle:
                            TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                    validator: (value) {
                      return Validate.emailValidator(value!);
                    },
                    controller: textControllerEmail,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(bottomRight),
                          topRight: Radius.circular(topRight))),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: '******',
                        hintStyle:
                            TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)

                        // suffixIcon: IconButton(
                        //   color: Colors.black,
                        //   icon: Icon(
                        //     _passwordVisible
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       this._passwordVisible =
                        //       !this._passwordVisible;
                        //     });
                        //   },
                        // ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20.0),
                        // ),
                        ),
                    validator: (value) {
                      return Validate.pwdValidator(value!);
                    },
                    controller: textControllerPassword,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(top: 00),
                      // child: Text(
                      //   'Enter your email & password to continue...',
                      //   textAlign: TextAlign.end,
                      //   style:
                      //       TextStyle(color: Color(0xFFA0A0A0), fontSize: 12),
                      // ),
                    )),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        gradient: LinearGradient(
                            colors: signInGradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: textControllerEmail.text,
                                    password: textControllerPassword.text)
                                .then((value) => FirebaseFirestore.instance
                                        .collection('TestDataCollection')
                                        // .add(data)
                                        .doc('hi')
                                        .set({
                                      "value": 'xxxxxxx',
                                    }))
                                .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FormMenu()))
                                    .catchError((e) => print(e)));
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormMenu()));
                        },
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                        // icon: Icon(Icons.arrow_forward_sharp),
                      ),
                    ),
                  ],
                ),
              )
              // OutlineButton(
              //   splashColor: Colors.lightGreen,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       // Icon(Icons.login),// icon
              //       Image(
              //         image: AssetImage("assets/images/login.png"),
              //         height: 30.0,
              //       ),
              //       Text(" Login"), // text
              //     ],
              //   ),
              //   // Text('Login'),
              //   // color: Color(0xffEE7B23),
              //   onPressed: () {
              //     if (_loginFormKey.currentState!.validate()) {
              //       FirebaseAuth.instance
              //           .createUserWithEmailAndPassword(
              //           email: textControllerEmail.text,
              //           password: textControllerPassword.text)
              //           .then((value) => FirebaseFirestore.instance
              //           .collection('TestDataCollection')
              //       // .add(data)
              //           .doc('hi')
              //           .set({
              //         "value": 'xxxxxxx',
              //       }))
              //           .then((value) => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => FormMenu()))
              //           .catchError((e) => print(e)));
              //     }
              //   },
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> signInGradients = [
    Color(0xFF0EDED2),
    Color(0xFF03A0FE),
  ];
}
