// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/datamodels/transaction/hatchery.dart';
import 'package:paultry_app/experiments/backgroundchick.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/validate.dart';

class Hatchery extends StatefulWidget {
  late String createBatch;
  late DateTime date;
  late String chooseHatchery;
  late num numberOfeggs;
  late String chickProduced;
  late DateTime pickUpdate;
  @override
  _HatcheryState createState() => _HatcheryState();
}

class _HatcheryState extends State<Hatchery> {
  DateTime selectedDate = DateTime.now();
  late String date1;
  late String date2;
  late String createBatch;
  late DateTime date;
  late String chooseHatchery;
  late num numberOfeggs;
  late String chickProduced;
  late DateTime pickUpdate;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  TransactionHatecheryDataModel hatchery =
      TransactionHatecheryDataModel.empty();
  TextEditingController dateInputcontroller = new TextEditingController();
  TextEditingController pickInputcontroller = new TextEditingController();
  TextEditingController batchInputcontroller = new TextEditingController();
  TextEditingController hatcheryInputcontroller = new TextEditingController();
  TextEditingController eggsInputcontroller = new TextEditingController();
  TextEditingController chickproduceInputcontroller =
      new TextEditingController();

  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hatchery Editor'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // BackgroundChick(),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _FormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // SizedBox(height: height * .2),
                    SizedBox(height: 50),
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
                          hatchery.createBatch = value!;
                        },
                        controller: batchInputcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Create Batch',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.home_work_outlined,
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
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
                              hatchery.date = value! as DateTime;
                            },
                            controller: dateInputcontroller,
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
                          hatchery.chooseHatchery = value!;
                        },
                        controller: hatcheryInputcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Choose Hatchery',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.location_on_sharp,
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          hatchery.numberOfeggs = value! as num;
                        },
                        controller: eggsInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'No.Of Eggs',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.reduce_capacity_rounded,
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: TextFormField(
                        validator: (value) {
                          return Validate.txtValidator(value!);
                        },
                        onSaved: (String? value) {
                          hatchery.chickProduced = value!;
                        },
                        controller: chickproduceInputcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Chick Produced',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                          icon: Icon(
                            Icons.note_add,
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
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: kBoxdecorationStyle,
                      child: InkWell(
                        onTap: () {
                          _selectDate1(context);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'PickUp Date',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                              icon: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.black38,
                              ),
                            ),
                            onSaved: (String? value) {
                              hatchery.pickUpdate = value! as DateTime;
                            },
                            controller: pickInputcontroller,
                          ),
                        ),
                      ),
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
          hatchery.createBatch = batchInputcontroller.text;
          hatchery.date = selectedDate;
          hatchery.chooseHatchery = hatcheryInputcontroller.text;
          hatchery.numberOfeggs = double.parse(eggsInputcontroller.text);
          hatchery.chickProduced = chickproduceInputcontroller.text;
          hatchery.pickUpdate = selectedDate;
          print('Data : ${hatchery.toJson()}');
          await web.tHatcheryRecord(model: hatchery);
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
        dateInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }

  _selectDate1(BuildContext context) async {
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
        date2 = selectedDate.toString();
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
