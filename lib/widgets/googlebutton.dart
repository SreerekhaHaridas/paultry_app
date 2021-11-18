// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new, unnecessary_null_comparison, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:paultry_app/main.dart';
import 'package:paultry_app/utils/authentication.dart';
import 'package:paultry_app/widgets/welcome.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GoogleButton extends StatefulWidget {
  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool _isProcessing = false;
  late String uid;
  late String userEmail;
  late String name;
  late String imageUrl;
  late bool authSignedIn;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30.0)),
      // ),
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                color: Colors.lightGreen.shade900, width: 3),
          ),
          color: Colors.white,
        ),
        child: OutlineButton(
          // highlightColor: Colors.blueGrey[100],
          // splashColor: Colors.blueGrey[200],
          onPressed: () async {
            setState(() {
              _isProcessing = true;
            });
            await Authentication.signInWithGoogle(context: context)
                .then((result) {
              print(result);
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Welcome(),
                ),
              );
            }).catchError((error) {
              print('Registration Error: $error');
            });
            setState(() {
              _isProcessing = false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color:Colors.lightGreen.shade900, width: 3),
          ),
          highlightElevation: 0,
          // borderSide: BorderSide(color: Colors.blueGrey, width: 3),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: _isProcessing
                ? CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.blueGrey,
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 30.0,
                ),
                // Image(image: ,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






// class GoogleSignInButton extends StatefulWidget {
//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }

// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   bool _isSigningIn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: _isSigningIn
//           ? CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//             )
//           : OutlinedButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                 ),
//               ),
//               onPressed: () async {
//                 setState(() {
//                   _isSigningIn = true;
//                 });

//                 User? user =
//                     await Authentication.signInWithGoogle(context: context);

//                 setState(() {
//                   _isSigningIn = false;
//                 });

//                 if (user != null) {
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                       builder: (context) => UserInfoScreen(
//                         user: user,
//                       ),
//                     ),
//                   );
//                 }
//               },
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image(
//                       image: AssetImage("assets/google_logo.png"),
//                       height: 35.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Text(
//                         'Sign in with Google',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }

