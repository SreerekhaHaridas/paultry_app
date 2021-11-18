import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paultry_app/widgets/userinfo.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  late String name;
  late String imageUrl;
  late bool authSignedIn;
  late String uid;
  late String userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context, }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            user: user,
          ),
        ),
      );
    }
    return firebaseApp;
  }

  Future<String?> registerWithEmailPassword(
      String email, String password) async {
    // Initialize Firebase
    await Firebase.initializeApp();
    bool authSignedIn;
    String uid;
    String userEmail;
    final UserCredential userCredential =
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;

    if (user != null) {
      // checking if uid or email is null
      assert(user.uid != null);
      assert(user.email != null);
      uid = user.uid;
      userEmail = user.email!;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      return 'Successfully registered, User UID: ${user.uid}';
    }

    return null;
  }

  Future<String?> signInWithEmailPassword(String email, String password) async {
    // Initialize Firebase
    await Firebase.initializeApp();
    final UserCredential userCredential =
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = userCredential.user;
    if (user != null) {
      // checking if uid or email is null
      assert(user.uid != null);
      assert(user.email != null);
      uid = user.uid;
      userEmail = user.email!;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      return 'Successfully logged in, User UID: ${user.uid}';
    }

    return null;
  }

  // Future<String> signOut() async {
  //   await _auth.signOut();

  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('auth', false);

  //   uid;
  //   userEmail;

  //   return 'User signed out';
  // }
  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);
        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);
    uid;
    name;
    userEmail;
    imageUrl;

    print("User signed out of Google account");
  }

  Future getUser() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        uid = user.uid;
        name = user.displayName!;
        userEmail = user.email!;
        imageUrl = user.photoURL!;
      }
    }
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
