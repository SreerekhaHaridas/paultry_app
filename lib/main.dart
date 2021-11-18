// ignore_for_file: deprecated_member_use, prefer_const_constructors, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paultry_app/common_Ui/cliper.dart';
import 'package:paultry_app/experiments/background.dart';

import 'package:paultry_app/experiments/log.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:paultry_app/widgets/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();
  await Hive.openBox('Farm');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

//***************************************************************************//
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background(),
            LoginUi(),
          ],
        ));
  }
}
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   @override
//   void initState() {
//     _passwordVisible = false;
//     super.initState();
//   }
//
//   bool _passwordVisible = false;
//   bool _isEditingEmail = false;
//   bool _isEditingPassword = false;
//   bool _isRegistering = false;
//   bool _isProcessing = false;
//   final textControllerEmail = TextEditingController();
//   final textControllerPassword = TextEditingController();
//   final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         height: height,
//         width: width,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Container(
//               child: Form(
//                 key: _loginFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         filled: true,
//                         hintText: 'Email',
//                         suffixIcon: Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                       ),
//                       validator: (value) {
//                         return Validate.emailValidator(value!);
//                       },
//                       controller: textControllerEmail,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     TextFormField(
//                       textInputAction: TextInputAction.next,
//                       obscureText: true,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _passwordVisible
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               this._passwordVisible = !this._passwordVisible;
//                             });
//                           },
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                       ),
//                       validator: (value) {
//                         return Validate.pwdValidator(value!);
//                       },
//                       controller: textControllerPassword,
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         FlatButton(
//                           color: Colors.blueGrey,
//                           hoverColor: Colors.blueGrey[700],
//                           highlightColor: Colors.blueGrey[800],
//                           onPressed: () {
//                             if (_loginFormKey.currentState!.validate())
//                               FirebaseAuth.instance
//                                   .createUserWithEmailAndPassword(
//                                       email: textControllerEmail.text,
//                                       password: textControllerPassword.text)
//                                   .then((value) => FirebaseFirestore.instance
//                                           .collection('TestDataCollection')
//                                           // .add(data)
//                                           .doc('hi')
//                                           .set({
//                                         "value": 'xxxxxxx',
//                                       }))
//                                   .then((value) => Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Welcome()))
//                                       .catchError((e) => print(e)));
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Text(
//                             "Sign In",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         FlatButton(
//                           color: Colors.blueGrey,
//                           hoverColor: Colors.blueGrey[700],
//                           highlightColor: Colors.blueGrey[800],
//                           onPressed: () async {
//                             await FirebaseAuth.instance.signOut();
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Text(
//                             'Sign Out',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Center(child: GoogleButton()),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
