// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paultry_app/utils/common_ui.dart';

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  // String option;
  @override
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.orange[800]),
            ),
            Text('Sales Form',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _title() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Center(
        child: Text('Poultry',
            style: GoogleFonts.diplomata(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
    // return RichText(
    //   textAlign: TextAlign.center,
    //   text: TextSpan(
    //       text: 'P',
    //       //lemon,monoton,bowlbyone,bevan,rye,
    //       // rammettoOne,bungeeshade,vastShadow,
    //       // londrinaOutline,londrinaShadow,diplomata,
    //       // fascinateInline,asset,jacquesFrancoisShadow
    //       style: GoogleFonts.asset(
    //         textStyle: Theme.of(context).textTheme.headline4,
    //         fontSize: 30,
    //         fontWeight: FontWeight.w700,
    //         color: Colors.lightBlue,
    //       ),
    //       children: [
    //         TextSpan(
    //           text: 'oultry',
    //           style: TextStyle(color: Colors.orange[800], fontSize: 25),
    //         ),
    //         // TextSpan(
    //         //   text: 'ray',
    //         //   style: TextStyle(color: Colors.green, fontSize: 30),
    //         // ),
    //       ]),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 100),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Company Name',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                            icon: Icon(
                              Icons.business,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: IconButton(
                                    icon: Icon(Icons.calendar_today,
                                        color: Colors.black38),
                                    onPressed: () {}),
                              ),
                              Text(
                                "First Date Of Visit",
                                // "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin:
                      //       EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //     // image: DecorationImage(
                      //     //   image: AssetImage(
                      //     //     'asset/e.png',
                      //     //   ),
                      //     //   scale: 1.5,
                      //     //   alignment: FractionalOffset.centerLeft,
                      //     // )
                      //   ),
                      //   child: DropdownButtonFormField(
                      //     // value: option,
                      //     // onChanged: (op) => setState(() => option = op),
                      //     decoration: InputDecoration(
                      //         prefixIcon: Icon(
                      //           Icons.app_registration,
                      //           color: Colors.black,
                      //         ),
                      //         hintText: 'Status',
                      //         hintStyle: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30.0),
                      //             borderSide: BorderSide.none)),
                      //     validator: (value) =>
                      //         value == null ? "field required" : null,
                      //     items: [
                      //       'option 1',
                      //       'option 2',
                      //       'option 3',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem(
                      //         child: Text(
                      //           value,
                      //           style: TextStyle(color: Colors.black38),
                      //         ),
                      //         value: value,
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin:
                      //       EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: DropdownButtonFormField(
                      //     // value: option,
                      //     // onChanged: (op) => setState(() => option = op),
                      //     decoration: InputDecoration(
                      //         prefixIcon: Icon(
                      //           Icons.precision_manufacturing_sharp,
                      //           color: Colors.black,
                      //         ),
                      //         hintText: 'Probability',
                      //         hintStyle: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(30.0),
                      //             borderSide: BorderSide.none)),
                      //     validator: (value) =>
                      //         value == null ? "field required" : null,
                      //     items: [
                      //       'option 1',
                      //       'option 2',
                      //       'option 3',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem(
                      //         child: Text(
                      //           value,
                      //           style: TextStyle(color: Colors.black38),
                      //         ),
                      //         value: value,
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 10),
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      //     decoration: BoxDecoration(
                      //       color: Colors.green[100],
                      //       borderRadius: BorderRadius.circular(25),
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //         new Flexible(
                      //           child: IconButton(
                      //               icon: Icon(Icons.calendar_today,
                      //                   color: Colors.black38),
                      //               onPressed: () {}),
                      //         ),
                      //         Text(
                      //           "Next Visit",
                      //           // "${selectedDate.toLocal()}".split(' ')[0],
                      //           style: TextStyle(
                      //               color: Colors.black38,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16),
                      //         ),
                      //       ],
                      //     )),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 10),
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      //     decoration: BoxDecoration(
                      //       color: Colors.green[100],
                      //       borderRadius: BorderRadius.circular(25),
                      //     ),
                      //     child: Row(
                      //       mainAxisSize: MainAxisSize.max,
                      //       children: <Widget>[
                      //         new Flexible(
                      //           child: IconButton(
                      //               icon: Icon(Icons.calendar_today,
                      //                   color: Colors.black38),
                      //               onPressed: () {}),
                      //         ),
                      //         Text(
                      //           "Next Date Of Visit",
                      //           // "${selectedDate.toLocal()}".split(' ')[0],
                      //           style: TextStyle(
                      //               color: Colors.black38,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16),
                      //         ),
                      //       ],
                      //     )),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Follow Up',
                      //       hintStyle: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black38),
                      //       icon: Icon(
                      //         Icons.follow_the_signs,
                      //         color: Colors.black38,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   height: 100,
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Customer Requirment',
                      //       contentPadding: EdgeInsets.only(
                      //           top: 40, bottom: 6, left: 17, right: 6),
                      //       hintStyle: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black38),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Expected Plan',
                      //       hintStyle: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black38),
                      //       icon: Icon(
                      //         Icons.replay_circle_filled,
                      //         color: Colors.black38,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 10),
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      //   decoration: BoxDecoration(
                      //     color: Colors.green[100],
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Quoted Amount',
                      //       hintStyle: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black38),
                      //       icon: Icon(
                      //         Icons.attach_money_outlined,
                      //         color: Colors.black38,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       '                                                   More',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20,
                      //         color: Colors.orange[700],
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(height: height * .14),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }
}

class BezierContainer extends StatelessWidget {
  const BezierContainer({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.8,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.green.shade700,
                (Colors.orange.shade800)
              ])),
        ),
      ),
    ));
  }
}
