// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paultry_app/WebServices/WebserviceHelper.dart';
import 'package:paultry_app/datamodels/master/hatchery.dart';
import 'package:paultry_app/utils/common_ui.dart';
import 'package:paultry_app/utils/validate.dart';

class HatcheryMaster extends StatefulWidget {
  late String name;
  late int capacity;
  late String location;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;
  @override
  _HatcheryMasterState createState() => _HatcheryMasterState();
}

class _HatcheryMasterState extends State<HatcheryMaster> {
  DateTime selectedDate = DateTime.now();
  late String date;
  late String date1;
  late String name;
  late int capacity;
  late String location;
  late String attenderLedger;
  late String currentBatchId;
  late DateTime currentDate;
  late DateTime pastPickupDate;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  HatcheryDataModel mhatchery = HatcheryDataModel.empty();
  TextEditingController pastpickcontroller = TextEditingController();
  TextEditingController dateInputcontroller = TextEditingController();
  TextEditingController pickInputcontroller = TextEditingController();
  TextEditingController nameInputcontroller = TextEditingController();
  TextEditingController capacityInputcontroller = TextEditingController();
  TextEditingController locationInputcontroller = TextEditingController();
  TextEditingController ledgerInputcontroller = TextEditingController();
  TextEditingController batchInputcontroller = TextEditingController();

  WebserviceHelper web = WebserviceHelper();
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hatchery'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              // Positioned(
              //   top: -MediaQuery.of(context).size.height * .15,
              //   right: -MediaQuery.of(context).size.width * .4,
              // child: BezierContainer(),
              // ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Form(
                  key: _FormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: height * .2),
                        // SizedBox(height: 20),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 1),
                        //   padding: EdgeInsets.symmetric(vertical: 2),
                        //   decoration: BoxDecoration(
                        //     color: Colors.lightGreen.shade900,
                        //     borderRadius: BorderRadius.circular(00),
                        //   ),
                        //   child: Padding(
                        //       padding:
                        //       EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                        //       child: Row(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: <Widget>[
                        //           Flexible(
                        //             child: IconButton(
                        //               icon: Icon(Icons.calendar_today,
                        //                   color: Colors.black),
                        //               onPressed: () {
                        //                 _selectDate(context);
                        //                 print('select date');
                        //               },
                        //             ),
                        //           ),
                        //           // Text(fromDateStr),
                        //         ],
                        //       )),
                        // ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left:155.0),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 10),
                            padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration:BoxDecoration(
                              color: Colors.lightGreen.shade900,
                              borderRadius: BorderRadius.circular(00),
                            ),
                            child:Text('Farm Name:',style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold),) ,
                            // TextFormField(
                            //   validator: (value) {
                            //     return Validate.txtValidator(value!);
                            //   },
                            //   onSaved: (String? value) {
                            //     mhatchery.name = value!;
                            //   },
                            //   controller: nameInputcontroller,
                            //   keyboardType: TextInputType.text,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'Name',
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
                          decoration:kBoxdecorationStyle,
                          child: TextFormField(
                            validator: (value) {
                              return Validate.txtValidator(value!);
                            },
                            onSaved: (String? value) {
                              mhatchery.capacity = value! as int;
                            },
                            controller: capacityInputcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Capacity',
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
                              mhatchery.location = value!;
                            },
                            controller: locationInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Location',
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
                              mhatchery.attenderLedger = value!;
                            },
                            controller: ledgerInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Attender Ledger',
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
                          child: TextFormField(
                            validator: (value) {
                              return Validate.txtValidator(value!);
                            },
                            onSaved: (String? value) {
                              mhatchery.currentBatchId = value!;
                            },
                            controller: batchInputcontroller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Current Batch Id',
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
                                  hintText: 'Current Date',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                  icon: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.black38,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  mhatchery.currentDate = value! as DateTime;
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
                          child: InkWell(
                            onTap: () {
                              _selectDate1(context);
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Past Pickup Date',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38),
                                  icon: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.black38,
                                  ),
                                ),
                                onSaved: (String? value) {
                                  mhatchery.pastPickupDate = value! as DateTime;
                                },
                                controller: pickInputcontroller,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        splashColor: Colors.lightGreen,
        onPressed: () async {
          if (_FormKey.currentState!.validate()) {}
          mhatchery.name = nameInputcontroller.text;
          mhatchery.capacity = int.parse(capacityInputcontroller.text);
          mhatchery.location = locationInputcontroller.text;
          mhatchery.attenderLedger = ledgerInputcontroller.text;
          mhatchery.currentBatchId = batchInputcontroller.text;
          mhatchery.currentDate = selectedDate;
          mhatchery.pastPickupDate = selectedDate;
          print('Data : ${mhatchery.toJson()}');
          await web.mHatcheryRecord(model: mhatchery);
        },
        child: Text('Save'),
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
        date = selectedDate.toString();
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
        date1 = selectedDate.toString();
        pickInputcontroller.text = DateFormat.yMMMd().format(selectedDate);
      });
  }
}
