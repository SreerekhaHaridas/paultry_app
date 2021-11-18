// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/common_Ui/cliper.dart';
import 'package:paultry_app/datamodels/transaction/chick_transfer.dart';
import 'package:paultry_app/experiments/background.dart';
import 'package:paultry_app/experiments/backgroundchick.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/validate.dart';

class ChickTransfer extends StatefulWidget {
  late DateTime date;
  late String farmId;
  late String farmname;
  late int numberOfChickens;
  late String batchId;
  @override
  _ChickTransferState createState() => _ChickTransferState();
}

class _ChickTransferState extends State<ChickTransfer> {
  DateTime selectedDate = DateTime.now();
  late String date1;
  late DateTime date;
  late String farmId;
  late String farmname;
  late int numberOfChickens;
  late String batchId;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  ChickTransferDataModel chick = ChickTransferDataModel.empty();
  TextEditingController pickInputcontroller = new TextEditingController();
  TextEditingController farmidInputcontroller = new TextEditingController();
  TextEditingController farmnameInputcontroller = new TextEditingController();
  TextEditingController numberofchickInputcontroller =
      new TextEditingController();
  TextEditingController batchInputcontroller = new TextEditingController();

  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chicken Transfer Editor'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            Form(
              key: _FormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(height: height * .2),
                    // SizedBox(height: 20),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    //   decoration: kBoxdecorationStyle,
                    //   child: TextFormField(
                    //     validator: (value) {
                    //       return Validate.txtValidator(value!);
                    //     },
                    //     onSaved: (String? value) {
                    //       chick.FarmId = value!;
                    //     },
                    //     controller: farmidInputcontroller,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Farm Id',
                    //       hintStyle: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black38),
                    //       icon: Icon(
                    //         Icons.batch_prediction,
                    //         color: Colors.black38,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 168.0),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade900,
                          borderRadius: BorderRadius.circular(00),
                        ),
                        child: Text(
                          'Farm Name:',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // TextFormField(
                        //   validator: (value) {
                        //     return Validate.txtValidator(value!);
                        //   },
                        //   onSaved: (String? value) {
                        //     chick.FarmName = value!;
                        //   },
                        //   controller: farmnameInputcontroller,
                        //   keyboardType: TextInputType.text,
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: 'Farm Name',
                        //     hintStyle: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black38),
                        //     icon: Icon(
                        //       Icons.drive_file_rename_outline,
                        //       color: Colors.black38,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Date',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.black38,
                              ),
                            ),
                            onSaved: (String? value) {
                              chick.Date = value! as DateTime;
                            },
                            controller: pickInputcontroller,
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          chick.NumberOfChickens = value! as int;
                        },
                        controller: numberofchickInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Number of Chicks',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.batch_prediction,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    //   decoration: kBoxdecorationStyle,
                    //   child: TextFormField(
                    //     validator: (value) {
                    //       return Validate.txtValidator(value!);
                    //     },
                    //     onSaved: (String? value) {
                    //       chick.BatchId = value!;
                    //     },
                    //     controller: batchInputcontroller,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Batch Id',
                    //       hintStyle: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black38),
                    //       icon: Icon(
                    //         Icons.batch_prediction,
                    //         color: Colors.black38,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.lightGreen,
        onPressed: () async {
          if (_FormKey.currentState!.validate()) {}
          Box box = Hive.box('Farm');
          chick.FarmName = box.get('FarmName');
          chick.FarmId = box.get('FarmID');
          chick.Date = selectedDate;
          // chick.FarmId = farmidInputcontroller.text;
          // chick.FarmName = farmnameInputcontroller.text;
          chick.NumberOfChickens = int.parse(numberofchickInputcontroller.text);
          chick.BatchId = batchInputcontroller.text;
          print('Data : ${chick.toJson()}');
          await web.chickRecord(model: chick);
        },
        child: Icon(Icons.check_outlined),
        backgroundColor: Colors.lightGreen.shade900,
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = picked;
        date1 = selectedDate.toString();
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
